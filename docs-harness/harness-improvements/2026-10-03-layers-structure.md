# Improvement Log — 2026-10-03 Layers structure

## Purposes
- [x] Tạo cấu trúc `docs-harness/layers/layer-1/agents/` (folder đã có sẵn từ user; hoàn thiện nội dung)
- [x] Load protocol: auto-load instruction theo model đang dùng, chỉ load đúng model đó
- [x] Checklist bật/tắt: frontmatter `enabled` per-file (user chọn frontmatter thay vì file trung tâm)
- [x] INDEX.md index mọi .md trong layers/ + back-link về INDEX.md
- [x] AGENTS.md pointer để auto-load hoạt động giữa các session
- [x] Audit scaffold `harness-improvements/` + `_TEMPLATE.md`

## Changes
| File | Action | Summary |
|------|--------|---------|
| `docs-harness/layers/README.md` | created | Purpose layers + 3 quy tắc: index, back-link, switch |
| `docs-harness/layers/layer-1/agents/README.md` | created | Naming `<model-id>-<effort>.md` + load protocol 5 bước + template |
| `docs-harness/layers/layer-1/agents/gemini-3.8-flash-high.md` | modified | Thêm frontmatter `enabled: true` + back-link (body giữ nguyên) |
| `docs-harness/layers/layer-2/hooks/README.md` | modified | Điền placeholder — layer-2 chưa định nghĩa |
| `docs-harness/INDEX.md` | modified | Index 4 file layers vào Harness documentation + Quick state |
| `AGENTS.md` | modified | Thêm mindset "Model layer" — pointer auto-load |
| `docs-harness/harness-improvements/_TEMPLATE.md` | created | Template audit log |

## Decisions
- **Frontmatter per-file** thay vì `_checklist.md` tập trung — user chọn; mỗi instruction tự quản switch, không có rủi ro lệch 2 nguồn.
- **layer-1 = instruction theo AI model**; layer-2+ chỉ định nghĩa khi có nhu cầu (convention "không scaffold trống" của harness).
- **Switch rule chỉ áp dụng instruction files**, không áp README — README là tài liệu tham khảo, không phải thứ agent load theo model.
- **Không tạo sẵn instruction file** cho model chưa dùng — thêm khi user thực sự dùng model đó.
- User đã tự tạo trước cấu trúc folder + file `gemini-3.8-flash-high.md` (không có frontmatter); tôi hoàn thiện thay vì ghi đè. Phát hiện thêm `docs-harness/JEV-AI.md` rỗng — không index vì chưa có nội dung.

## Outcome
Status: done
