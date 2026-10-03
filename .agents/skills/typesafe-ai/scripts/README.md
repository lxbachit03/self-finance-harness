# scripts — Jev enhancement scripts

The `enhance-jev-ai` skill writes custom scripts here: one script per intent (`<intent-slug>.<ext>`); the header records intent + creation date. See `../../enhance-jev-ai/SKILL.md` and `docs-harness/JEV-AI.md` (Jev protocol).

## Scripts

| Script | Purpose | Input |
|--------|---------|-------|
| `invoke-typesafe.ps1` | Transport to the TypeSafe System One API — reads `TYPESAFE_API_KEY` from env, retries 429/529 | Agent-composed request JSON (`state` + `questions`), via `-RequestFile` or stdin |
