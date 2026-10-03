# JEV-AI — Jev, trợ lý quyết định của harness

Back-link: [INDEX.md](INDEX.md) · Hook trigger: `Jev` (hook: `layers/layer-2/hooks/jev-hook.md`)

## Jev là gì

Jev là System One model của TypeSafe (skill `typesafe-ai`): nhận natural language + state, trả **typed judgments và probabilities** — không generate văn bản, không giải thích lý do. Code và workflow thuộc về agent; Jev cung cấp phán đoán có cấu trúc.

## Vai trò trong harness

Jev là trợ lý của harness repo. Khi user gọi "Jev", AI agent (main) cùng Jev đưa ra quyết định:

1. Load skill `typesafe-ai` và đọc live docs phần liên quan (docs là nguồn truth).
2. Agent decompose quyết định thành các judgments nguyên tố — **Choice** (chọn 1 trong tập), **Noul** (điều kiện có/không), **Score** (độ theo chiều mô tả) — kèm state đủ ngữ cảnh (tin tức, chỉ báo, vị thế, lịch sử); agent tự soạn state + questions structure phù hợp.
3. Chạy judgments qua script transport `.agents/skills/typesafe-ai/scripts/invoke-typesafe.ps1` (agent soạn request JSON — script đọc `TYPESAFE_API_KEY` từ env, retry 429/529, trả raw answers JSON; hỗ trợ `-RequestFile` hoặc pipe stdin).
4. Agent tổng hợp: kết hợp phán đoán Jev với reasoning của mình, nêu rõ ngưỡng quyết định và độ tự tin trước khi hành động.

Nguyên tắc: agent giữ quyền workflow và quyết định cuối; Jev là engine phán đoán, không thay thế agent.
