# Layers

Back-link: [INDEX.md](../INDEX.md)

Instruction files mà AI agent load vào context. Mỗi layer là một tầng scope riêng biệt; layer mới chỉ được thêm khi có nhu cầu thực tế.

- **layer-1** — instruction theo AI model cụ thể (`layer-1/agents/`)
- **layer-2** — hooks: user-triggered loads (`layer-2/hooks/`); mỗi hook một file `<trigger>-hook.md` chứa cặp trigger → target

## Quy tắc cho mọi .md trong layers/

1. **Index** — file phải có entry trong bảng Harness documentation của `INDEX.md`.
2. **Back-link** — ngay dưới tiêu đề, file có dòng `Back-link: [INDEX.md](...)` theo relative path đúng độ sâu (vd `../INDEX.md`, `../../INDEX.md`, `../../../INDEX.md`).
3. **Switch** — frontmatter `enabled: true|false` là công tắc do user quyết định; áp dụng cho instruction files (file không phải README). `enabled: false` hoặc thiếu frontmatter → agent không load.

## Thêm hook mới (layer-2)

1. Tạo `layer-2/hooks/<trigger>-hook.md` — bảng trigger → target (+ note).
2. Thêm trigger map tương ứng vào AGENTS.md — một dòng per hook; chuyển sang registry-read khi hooks nhiều hơn 2-3.
3. Target file phải có entry trong INDEX.md + back-link.
