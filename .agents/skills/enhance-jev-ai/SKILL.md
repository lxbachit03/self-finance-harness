---
name: enhance-jev-ai
disable-model-invocation: true
description: Enhance Jev AI for this harness — custom scripts per user intent, written to the `scripts/` folder of the `typesafe-ai` skill.
---

# Enhance Jev AI

Enhance Jev (the harness's decision assistant) for a specific user intent by writing custom scripts into `.agents/skills/typesafe-ai/scripts/`.

## Precondition (guard)

`docs-harness/JEV-AI.md` must exist — it defines Jev's role in this harness. If it is missing: report to the user and stop; do not create it as a substitute.

## Workflow

1. Clarify the intent: what should Jev judge in this harness (e.g. score news, rank candidates, verify price/volume claims...). When the intent is ambiguous — the target judgment, its output shape, or the state it uses is unclear — ask the user focused clarifying questions before proceeding; do not guess.
2. Load the `typesafe-ai` skill; read the relevant live docs (primitives, cookbooks) before writing any script.
3. Write the script to `.agents/skills/typesafe-ai/scripts/<intent-slug>.<ext>` — one script per intent; header records intent + date; reuse existing state/questions where they fit.
4. Test with representative cases; verify the output is typed to the right primitive (Choice/Noul/Score).
5. If the script changes how the harness makes decisions, update `docs-harness/JEV-AI.md` (protocol) so it stays effective across sessions.
