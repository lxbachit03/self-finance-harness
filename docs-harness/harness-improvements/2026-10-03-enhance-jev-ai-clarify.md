# Improvement Log — 2026-10-03 enhance-jev-ai clarify rule

## Purposes
- [x] Cho phép skill `enhance-jev-ai` hỏi lại user khi intent chưa rõ ràng (Yêu cầu 3)

## Changes
| File | Action | Summary |
|------|--------|---------|
| `.agents/skills/enhance-jev-ai/SKILL.md` | modified | Workflow step 1: intent ambiguous → focused clarifying questions, do not guess |

## Decisions
- Gói yêu cầu vào **step 1** (nơi intent được xác định) thay vì mục riêng — branch chỉ xảy ra tại bước đó.
- Viết theo positive framing của writing-for-agents: điều kiện ambiguity cụ thể (target judgment, output shape, state) + hành vi mục tiêu (ask focused questions), thay vì cấm đoán.

## Outcome
Status: done
