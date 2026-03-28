# GeoDePIN: Design Patterns for Decentralized Geographic Infrastructure

**Author:** Zach Zukowski
**Affiliation:** Tokenization Systems
**ORCID:** [0009-0006-3642-2450](https://orcid.org/0009-0006-3642-2450)

## Abstract

Decentralized Physical Infrastructure Networks (DePIN) that provide geographic coverage face a design problem absent from digital-only token economies: incentives must attract hardware deployment to specific physical locations. This paper analyzes design patterns across two production DePIN networks (Helium and GEODNET), extracting generalizable principles for token mechanism design in spatially constrained infrastructure.

## Key Findings

1. S2R trajectory is more informative than S2R level for assessing network sustainability
2. Burn mechanism design determines revenue concentration independent of network size
3. Governance concentration creates protocol-level risks that token-level metrics do not capture
4. Spatial staking (GEODNET SuperHex) represents a novel incentive primitive
5. DePIN tokenomics is a design space with at least two viable architectures

## Key Data Points

| Metric | Helium | GEODNET |
|--------|--------|---------|
| S2R Ratio | 0.379 | Subscription-based |
| Burn Top-5 Share | ~90% | 40.4% |
| Burn HHI | 0.22 | 0.055 |
| Governance HHI | — | 0.14* |
| Team Wallet Voting | — | 25.3% |

*Polygon-side governance

## Repository Structure

- `data/` — Processed datasets used in the paper
- `queries/` — Dune Analytics SQL queries that produced the datasets
- `figures/` — Publication-quality figures (300 DPI)
- `analysis/` — Analysis scripts

## Data Sources

- **GEODNET burn data:** Dune Analytics queries [6917159](https://dune.com/queries/6917159) (monthly burns) and [6917162](https://dune.com/queries/6917162) (burn signer concentration) on Solana
- **Helium data:** DefiLlama, Helium Explorer, public blockchain data
- **Governance data:** Polygon DAO voting records

## Companion Papers

This paper is part of a research program on token mechanism design:

| Paper | Title | SSRN |
|-------|-------|------|
| B1 | Adaptive Tokenomics | [6364158](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6364158) |
| B3 | GeoDePIN (this paper) | TBD |
| B4 | Operational Risk in Token Economies | [6352118](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=6352118) |

## License

MIT License. See [LICENSE](LICENSE).

## Citation

See [CITATION.cff](CITATION.cff) for machine-readable citation.
