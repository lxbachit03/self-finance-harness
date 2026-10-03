<#
.SYNOPSIS
  Sends a TypeSafe System One request (state + typed questions) and returns structured answers.

.DESCRIPTION
  Transport only: the calling agent composes the full request body (state + questions) and
  passes it as a JSON file or via stdin. The script reads TYPESAFE_API_KEY from the
  environment, POSTs to the System One endpoint, retries 429/529 with exponential backoff,
  and prints the raw response JSON (answers keyed by question id + usage).

.EXAMPLE
  .\invoke-typesafe.ps1 -RequestFile request.json

.EXAMPLE
  Get-Content request.json -Raw | .\invoke-typesafe.ps1

.EXAMPLE
  .\invoke-typesafe.ps1 request.json -OutputFile response.json

.NOTES
  Usage contract: docs-harness/JEV-AI.md (protocol) and .agents/skills/enhance-jev-ai/SKILL.md.
#>
[CmdletBinding()]
param(
  [Parameter(Position = 0)]
  [string]$RequestFile,

  [Parameter(ValueFromPipeline = $true)]
  [string]$Json,

  [string]$Model = 'jev-latest',
  [string]$OutputFile,
  [int]$MaxRetries = 3
)

begin { $raw = $null }
process { if ($null -ne $Json) { $raw = $Json } }
end {
  if ([string]::IsNullOrWhiteSpace($raw)) {
    if ([string]::IsNullOrWhiteSpace($RequestFile)) { throw 'No request. Pass -RequestFile or pipe JSON.' }
    if (-not (Test-Path $RequestFile)) { throw "Request file not found: $RequestFile" }
    $raw = Get-Content $RequestFile -Raw
  }
  if ([string]::IsNullOrWhiteSpace($raw)) { throw 'Request body is empty.' }
  try { $body = $raw | ConvertFrom-Json } catch { throw "Request body is not valid JSON: $($_.Exception.Message)" }
  if (-not $body.PSObject.Properties['questions']) { throw 'Request must contain a "questions" map (see docs-harness/JEV-AI.md).' }

  $apiKey = $env:TYPESAFE_API_KEY
  if ([string]::IsNullOrWhiteSpace($apiKey)) { throw 'TYPESAFE_API_KEY is not set in the environment.' }

  if (-not $body.PSObject.Properties['model']) {
    $body | Add-Member -NotePropertyName model -NotePropertyValue $Model
    $payload = $body | ConvertTo-Json -Depth 64
  }
  else { $payload = $raw }

  $uri = 'https://api.typesafe.ai/v1/systemone'
  $attempt = 0
  while ($true) {
    $attempt++
    try {
      $response = Invoke-RestMethod -Uri $uri -Method Post -ContentType 'application/json' `
        -Headers @{ Authorization = "Bearer $apiKey" } -Body $payload -TimeoutSec 120
      $out = $response | ConvertTo-Json -Depth 64
      if ($OutputFile) { [System.IO.File]::WriteAllText($OutputFile, $out) } else { $out }
      return
    }
    catch {
      $status = $null
      if ($_.Exception.Response) { $status = [int]$_.Exception.Response.StatusCode }
      if (($status -eq 429 -or $status -eq 529) -and $attempt -le $MaxRetries) {
        Start-Sleep -Seconds ([math]::Pow(2, $attempt))
        continue
      }
      if ($_.ErrorDetails -and $_.ErrorDetails.Message) {
        throw "TypeSafe API error (HTTP $status): $($_.ErrorDetails.Message)"
      }
      throw
    }
  }
}
