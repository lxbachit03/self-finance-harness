# layer-1 — agents (instruction theo AI model)

Back-link: [INDEX.md](../../../INDEX.md) · [layers README](../../README.md)

Custom instruction cho từng AI model cụ thể. Mỗi file là một instruction áp dụng cho đúng một model+effort.

## Naming

`<model-id>-<effort>.md`, lowercase, hyphenated — vd `gemini-3.8-flash-high.md` (Gemini 3.8 Flash, effort high).

## Load protocol (agent tự thực hiện, không cần user authority)

1. Xác định model + effort của session hiện tại (từ session/system info, hoặc user khai báo rõ).
2. Tìm file `<model-id>-<effort>.md` trong folder này.
3. **Chỉ match đúng model đang dùng** — không load instruction của model khác.
4. File tồn tại **và** frontmatter `enabled: true` → load nội dung file vào context ngay khi bắt đầu session.
5. File không tồn tại, hoặc `enabled: false` → không load gì, làm việc bình thường.

## Công tắc của user

Mở file instruction, đổi `enabled` trong frontmatter (`true` = bật, `false` = tắt). Không có file trung tâm — mỗi file tự quản switch của nó.

## Template cho instruction file mới

```markdown
---
enabled: true
---

# [Model name] (effort: [X]) — [mục tiêu ngắn]

Back-link: [INDEX.md](../../../INDEX.md)

[Phạm vi áp dụng: session nào, không thay đổi gì]

[Instruction body]
```
