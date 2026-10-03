# Improvement Log — 2026-10-03 Jev AI + enhance-jev-ai skill

## Purposes
- [x] `JEV-AI.md`: instruction cho Jev (System One model của TypeSafe) tương thích harness
- [x] Jev dùng skill `typesafe-ai`; khi user gọi "Jev" → agent + Jev cùng ra quyết định
- [x] Hook trigger thay cho "load đầu mỗi session" (user quyết định: load tuỳ lúc gọi)
- [x] Skill `enhance-jev-ai` (user-invoked), guard `JEV-AI.md` phải tồn tại
- [x] `scripts/` trong skill `typesafe-ai` (skill tồn tại → không cần report)

## Changes
| File | Action | Summary |
|------|--------|---------|
| `docs-harness/JEV-AI.md` | created | Identity Jev + protocol agent+Jev decompose judgments (Choice/Noul/Score) |
| `docs-harness/layers/README.md` | modified | layer-2 = hooks: user-triggered loads |
| `docs-harness/layers/layer-2/hooks/README.md` | modified | Hooks convention + registry (`Jev` → JEV-AI.md) |
| `AGENTS.md` | modified | Mindset "Hook: Jev" + skill pointer `enhance-jev-ai` |
| `docs-harness/INDEX.md` | modified | Rows: hooks registry, JEV-AI, audit template/logs; skills 6→7 |
| `.agents/skills/enhance-jev-ai/SKILL.md` | created | User-invoked skill: intent → script → test |
| `.agents/skills/typesafe-ai/scripts/README.md` | created | Ownership + naming convention scripts |

## Decisions
- **Hook trigger thay always-load**: user từ chối cả 3 cơ chế load-mỗi-session vì nặng context; layer-2 = hooks ra đời — JEV-AI.md chỉ load khi user gọi "Jev" (YC4 "load đầu mỗi session" được user chủ động sửa thành trigger-based).
- **Trigger map inline AGENTS.md** (1 dòng/hook) vì chỉ 1 hook; chuyển registry-read khi hooks > 2-3.
- **User-invoked** cho `enhance-jev-ai` — chỉ fire khi user gõ `$enhance-jev-ai`, zero context load.
- **Không `enabled` frontmatter** cho JEV-AI.md — load theo hook trigger, không phải per-model như layer-1.
- **Guard skill**: `JEV-AI.md` không tồn tại → report + dừng, không tự tạo thay (YC2 của skill).
- Phát hiện `JEV-AI.md` rỗng có sẵn từ session trước — điền nội dung thay vì tạo mới.

## Outcome
Status: done
