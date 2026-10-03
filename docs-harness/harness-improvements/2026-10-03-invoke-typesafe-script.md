# Improvement Log — 2026-10-03 invoke-typesafe.ps1 transport script

## Purposes
- [x] Script transport cho TypeSafe API: agent tự soạn state + questions, script gọi API

## Changes
| File | Action | Summary |
|------|--------|---------|
| `.agents/skills/typesafe-ai/scripts/invoke-typesafe.ps1` | created | Transport: `-RequestFile` / stdin, env key, retry 429/529 exponential backoff, validate `questions` map |
| `docs-harness/JEV-AI.md` | modified | Protocol step 2-3: agent soạn state+questions, chạy qua script |
| `.agents/skills/typesafe-ai/scripts/README.md` | modified | Bảng Scripts: invoke-typesafe.ps1 |
| `docs-harness/INDEX.md` | modified | Row Jev scripts |

## Decisions
- **Transport-only script**: agent (LLM) sở hữu state + questions design — đúng nguyên tắc "code owns the workflow; Jev supplies judgments" của TypeSafe.
- **Key từ env, không hardcode**; retry chỉ 429/529 (theo API docs), lỗi khác throw kèm error body.
- Tested thật 2 mode (-RequestFile + stdin) với request demo VN-Index — cùng answers khớp lần gọi curl trực tiếp.

## Outcome
Status: done
