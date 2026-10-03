---
name: improve-self-development-harness
description: Improve the self-development harness — structure, skills, agents, or documentation. Use when enhancing, restructuring, or extending any part of the harness repo.
---

Structured improvement process for the self-development harness. Every run follows the same sequence: _elicit_ intent, _scaffold_ the audit folder (first run only), build the purposes **checklist**, execute, and write the **audit** log.

## Step 1 — Elicit intent

Parse the user's request. Classify:

- **Sharp** — user names a specific target (file, skill, folder, config) and a concrete change. Proceed to Step 2.
- **Diffuse** — target or change is vague, ambiguous, or missing.

When intent is _diffuse_, enter the **inverted-prompting loop**:

1. **Mirror** — state back the goal as you parsed it, in one sentence.
2. **Gaps** — name each piece still missing (target, scope, success condition, priority).
3. **Options** — for each gap, present ranked choices using `ask_question`:
   - Lead with `(Recommended)` option and a one-sentence rationale.
   - Each remaining option gets a one-sentence explanation of what it does and when it fits.
   - The tool always includes a write-in input for cases where listed options miss.
4. **Loop** — re-enter from sub-step 1 with the user's answers folded in. Exit when sharp.

**Completion**: you can state the target, the change, and the success condition — all three concrete.

## Step 2 — Scaffold check

Look for the audit folder on disk. Default path: `docs-harness/harness-improvements`.

### Branch A — folder exists

Read existing audit logs to learn the established template and path. Proceed to Step 3.

### Branch B — folder missing (first run)

Ask the user two questions via `ask_question` in a single call:

1. **Audit location** — where to store improvement logs?
   - `(Recommended) docs-harness/harness-improvements`
   - Write-in for custom path.

2. **Audit template** — what structure for each log?
   - `(Recommended) Let AI generate an appropriate template based on improvement type`
   - Write-in to supply a custom template or reference file.

Then:

- Create the audit folder at the confirmed path.
- If AI-generated template was chosen, create `_TEMPLATE.md` inside the folder with this structure:

```markdown
# Improvement Log — [YYYY-MM-DD] [Short Title]

## Purposes
- [ ] Purpose 1
- [ ] Purpose 2

## Changes
| File | Action | Summary |
|------|--------|---------|
| | | |

## Decisions
- Key decision and rationale.

## Outcome
Status: done | partial | deferred
```

**Completion**: audit folder exists on disk, template is resolved (read from existing logs or freshly created).

## Step 3 — Build checklist

Produce a **purposes checklist** — every distinct goal this improvement session serves. Each item is a concrete, verifiable statement of what will be true after the change.

Present the checklist to the user. Ask them to confirm, add, or remove items. Use `ask_question` with `is_multi_select: true` if presenting optional purposes to include.

**Completion**: user has confirmed the final checklist — at least one item present.

## Step 4 — Execute

For each confirmed checklist item, in order:

1. Make the change (create, edit, restructure, document).
2. Record files affected and what changed.
3. Mark the item done.

If a checklist item reveals sub-problems during execution, _elicit_ (Step 1 loop) on the sub-problem before continuing. Surface new options to the user; proceed only when sharp.

**Completion**: every checklist item is marked done, or explicitly deferred by the user with a stated reason.

## Step 5 — Audit log

Write an improvement log to the audit folder using the established template.

The log captures:

- Date and session slug as filename: `YYYY-MM-DD-<slug>.md`
- The confirmed purposes checklist with final status (done / deferred / skipped)
- Every file created, modified, or deleted
- Key decisions made and their rationale

**Completion**: audit log file written to the audit folder, path reported to the user.
