# Layers

Back-link: [INDEX.md](../INDEX.md)

Instruction files mà AI agent load vào context. Mỗi layer là một tầng scope riêng biệt; layer mới chỉ được thêm khi có nhu cầu thực tế.

- **layer-1** — instruction theo AI model cụ thể (`layer-1/agents/`)
- **layer-2** — chưa định nghĩa (`layer-2/hooks/` là placeholder)

## Quy tắc cho mọi .md trong layers/

1. **Index** — file phải có entry trong bảng Harness documentation của `INDEX.md`.
2. **Back-link** — ngay dưới tiêu đề, file có dòng `Back-link: [INDEX.md](...)` theo relative path đúng độ sâu (vd `../INDEX.md`, `../../INDEX.md`, `../../../INDEX.md`).
3. **Switch** — frontmatter `enabled: true|false` là công tắc do user quyết định; áp dụng cho instruction files (file không phải README). `enabled: false` hoặc thiếu frontmatter → agent không load.
