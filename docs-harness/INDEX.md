# INDEX — Self-Finance Harness

Top-Down entry point: read this file first for harness state; load deeper content only when user intent requires.

## Domains

| Domain | Folder | Status | Agent role |
|--------|--------|--------|------------|
| trading-analysis | `docs-harness/trading-analysis/` | planned | Phân tích giao dịch, cải thiện phương pháp |
| personal-finance | `docs-harness/personal-finance/` | planned | Quản lý tài chính cá nhân |
| market-news | `docs-harness/market-news/` | planned | Tin tức VN/thế giới, chỉ báo, dòng tiền |

Domains are created only when work actually starts — none scaffolded yet.

## Harness documentation

| Document | Path | Purpose |
|----------|------|---------|
| Layers overview | `docs-harness/layers/README.md` | Purpose các tầng layers + quy tắc index/back-link/switch |
| layer-1 agents protocol | `docs-harness/layers/layer-1/agents/README.md` | Load protocol instruction theo AI model |
| Gemini 3.8 Flash (high) instruction | `docs-harness/layers/layer-1/agents/gemini-3.8-flash-high.md` | Instruction: thoroughness over speed (`enabled: true`) |
| layer-2 hooks | `docs-harness/layers/layer-2/hooks/README.md` | Placeholder — chưa định nghĩa |

## Quick state

- Active domains: 0 (3 planned)
- Skills: 6
- Layers: layer-1 agents — 1 instruction active (`gemini-3.8-flash-high`), layer-2 placeholder
- Output convention: dated analysis documents per domain, in Vietnamese
- Last improvement: 2026-10-03 (layers structure)
