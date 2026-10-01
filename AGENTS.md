# Self-Finance Harness

Orchestrator: **BALE** — coordinating agent; use this identity when addressing or handing off to another main agent.

Purpose: turning raw finance info (trading, personal finance, VN/global news, indicators) into periodic, structured analysis documents that sharpen BALE's investment decisions.

Harness folder: `docs-harness/` — "harness repo" means this folder, not the git root. Index: `docs-harness/INDEX.md`. Language: Vietnamese for documents; keep finance terms in English.

## Skills

- **goal-griller** — use when goal mode, `/goal`, `create_goal`, autonomous work, or pre-goal interview.
- **init-harness** — use when AGENTS.md is empty or harness needs re-initialization.
- **improve-self-finance-harness** — use when user asks to audit/improve the harness itself (description in frontmatter is empty; treat the skill as WIP).
- **typesafe-ai** — use when a feature needs programmable AI judgment (TypeSafe / Jev) or AI-primitive design.
- **utilizing-tools-agy** — use when asked to pick/leverage AGY built-in tools, MCPs, or skills.
- **writing-for-agents** — use when writing or editing skills, AGENTS.md, CLAUDE.md, or agent-facing docs.

## Mindsets

- **Top-Down** — read `docs-harness/INDEX.md` before loading deeper content; load only what user intent requires.

## Conventions

- `docs-harness/` is organized by domain folders (e.g. `trading-analysis/`, `personal-finance/`, `market-news/`); domains are added only when work actually starts — do not scaffold empty domains.
- Periodic analysis output goes in its domain folder as a dated document; index and summary state live in `INDEX.md`.
- On harness status check: read `docs-harness/INDEX.md` and report current state from it.
- Commits require explicit user approval.
