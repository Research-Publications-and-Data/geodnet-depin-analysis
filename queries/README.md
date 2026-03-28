# Dune Analytics Queries

These SQL queries run on Dune Analytics against Solana blockchain data (DuneSQL dialect).

## geodnet_monthly_burns.sql
- **Dune Query ID:** 6917159
- **URL:** https://dune.com/queries/6917159
- **Description:** Monthly aggregation of GEOD token burns on Solana
- **Token Mint:** `7JA5eZdCzztSfQbJvS8aVVxMFfd81Rs9VvwnocV1mKHu`

## geodnet_burn_signer_concentration.sql
- **Dune Query ID:** 6917162
- **URL:** https://dune.com/queries/6917162
- **Description:** Burn signer address concentration (Top-N share, cumulative %)
- **Key finding:** Top-5 = 40.4%, HHI = 0.055

## helium_s2r_trajectory.sql
- **Dune Query ID:** 6918150
- **URL:** https://dune.com/queries/6918150
- **Description:** Monthly Helium Subsidy-to-Revenue (S2R) ratio trajectory
- **Data sources:** Helium Foundation transformation views (HNT emissions, DC burns, oracle prices)
- **Key finding:** S2R declined from ~0.98 (Jan 2025) to ~0.36 (Feb 2026), showing growing data revenue

## Reproducibility

1. Create a free Dune Analytics account at dune.com
2. Navigate to the query URL above
3. Click "Run" to execute against current data
4. Note: results will reflect current blockchain state, not the paper's snapshot date

The CSV files in `data/` represent the snapshot used in the paper (March 2026).
