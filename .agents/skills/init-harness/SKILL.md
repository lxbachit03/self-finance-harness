---
name: init-harness
description: Bootstrap the harness repo — create AGENTS.md and configure orchestrator identity. Use when AGENTS.md is empty or harness needs re-initialization.
---

One-time _bootstrap_ for the harness repo. Elicits configuration from the user, then generates `AGENTS.md` at the repo root and a _Top-Down_ routing file in the harness folder.

When the user says "harness repo", they mean the harness documentation folder (e.g. `docs-harness/`), not the git repository root.

## Step 1 — Guard

Check if `AGENTS.md` at the repo root already has content.

- **Empty or missing**: proceed to Step 2.
- **Has content**: show the existing content to the user and ask whether to overwrite or abort. Proceed only on explicit confirmation to overwrite.

**Completion**: AGENTS.md is confirmed writable — either empty, or user approved overwrite.

## Step 2 — Elicit configuration

Ask the user four questions via `ask_question` in a single call:

1. **Harness folder** — where does harness documentation live? This is the folder "harness repo" refers to.
   - `(Recommended) docs-harness` — co-located with the repo, conventional name.
   - Write-in for custom path.

2. **Orchestrator name** — the identity for the coordinating agent, used when this session's main agent addresses or hands off to another main agent.
   - `(Recommended) BALE`
   - Write-in for custom name.

3. **Harness goal** — what is the real purpose of this harness repo? Free text, no default. This answer shapes every context the agent produces — it must be _sharp_.

4. **Index filename** — name of the _Top-Down_ routing file in the harness folder. The agent reads this file first on every harness status check.
   - `(Recommended) INDEX.md` — conventional name for a routing entry point.
   - Write-in for custom filename.

### Sharpening a diffuse goal

If the goal answer is _diffuse_ (vague direction, missing scope or success condition), enter the **inverted-prompting loop**:

1. **Mirror** — restate the goal as you parsed it, in one sentence.
2. **Gaps** — name what is unclear (scope, domain, target audience, success metric).
3. **Options** — for each gap, present ranked interpretations using `ask_question`:
   - Lead with `(Recommended)` and a one-sentence rationale.
   - Each remaining option gets a one-sentence explanation of what it means and when it fits.
   - The tool always includes a write-in input for framings none of the options capture.
4. **Loop** — fold the user's answers in and re-enter from sub-step 1. Exit when _sharp_: one sentence naming the domain, the scope, and what success looks like.

**Completion**: all four answers collected — folder path, _orchestrator_ name, a _sharp_ goal statement, and index filename.

## Step 3 — Generate AGENTS.md

Write `AGENTS.md` at the repo root. This file is always-loaded context — every line costs on every turn. Apply _relentless_ pruning: each line earns its place only if it changes agent behaviour.

### Required sections

1. **Orchestrator identity** — one line: name and coordination role.
2. **Harness purpose** — the _sharp_ goal distilled to one sentence.
3. **Harness folder** — path to the documentation root. Include: "harness repo" = this folder.
4. **Skill pointers** — one line per skill. Scan `.agents/skills/` for existing skills, read each `description` from frontmatter, and generate a context pointer per skill. Each pointer front-loads its leading word and carries only the trigger branches.
5. **Mindsets** — mandatory thinking patterns for every agent in this repo:
   - **Top-Down** — read the index file (`<harness-folder>/<index-filename>`) before loading deeper content. Load only what user intent requires. This saves tokens and keeps context focused.
6. **Conventions** — only what the agent cannot discover from the environment. Include:
   - Directory layout conventions (domain folders, improvement audit paths).
   - On harness status check: read `<harness-folder>/<index-filename>` to report current state.
   - Commits require explicit user approval.

### Pruning test for every line

- Does it change agent behaviour on this turn? → keep.
- Does it only matter on some branches? → push behind a pointer.
- Can the agent discover it by looking? → omit; the environment is the source of truth.

**Completion**: `AGENTS.md` written to disk with non-empty content covering all six sections.

## Step 4 — Create INDEX.md

Create the _Top-Down_ routing file at `<harness-folder>/<index-filename>`.

This file is the **single entry point** the agent reads when the user asks about harness status or explores the repo. It contains routing pointers — the agent loads deeper content only when user intent requires it.

### Required content

Scan the repo to populate:

1. **Domains table** — one row per domain folder found. Columns: domain name, folder path, current status (active / planned), agent role.
2. **Harness documentation table** — one row per documentation area (improvement audits, templates). Columns: document name, path, purpose.
3. **Quick state** — summary metrics: active domains count, total skills count, last improvement date (read from audit logs).

**Completion**: INDEX.md written to disk at the confirmed path, with all three content blocks populated from actual repo state.

## Step 5 — Confirm

Present the generated `AGENTS.md` and `INDEX.md` content to the user. Ask for confirmation or edits. Apply every requested change before finalising.

**Completion**: user confirms both files — files on disk match the confirmed versions.
