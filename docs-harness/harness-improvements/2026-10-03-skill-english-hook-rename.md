# Improvement Log — 2026-10-03 Skills in English + hook rename

## Purposes
- [x] Skills phải viết bằng English (enhance-jev-ai SKILL.md + scripts README)
- [x] Đổi tên `layers/layer-2/hooks/README.md` → `jev-hook.md`

## Changes
| File | Action | Summary |
|------|--------|---------|
| `.agents/skills/enhance-jev-ai/SKILL.md` | modified | Chuyển toàn bộ nội dung sang English |
| `.agents/skills/typesafe-ai/scripts/README.md` | modified | Chuyển sang English (nằm trong skill folder) |
| `docs-harness/layers/layer-2/hooks/README.md` → `jev-hook.md` | renamed | File hook riêng cho Jev (git mv) |
| `docs-harness/layers/README.md` | modified | Hook convention (thêm hook mới) chuyển từ hooks README về đây |
| `docs-harness/JEV-AI.md` | modified | Reference hook file mới |
| `AGENTS.md` | modified | Pointer mindset trỏ tới `jev-hook.md` |
| `docs-harness/INDEX.md` | modified | Row cập nhật path jev-hook.md |

## Decisions
- **English cho skill docs** — convention mới: mọi file trong `.agents/skills/` viết bằng English; docs-harness giữ tiếng Việt.
- **Rename hooks README** — hooks folder giờ chứa per-hook files (`<trigger>-hook.md`); convention "thêm hook mới" dời về `layers/README.md` để mỗi hook file thuần definition.

## Outcome
Status: done
