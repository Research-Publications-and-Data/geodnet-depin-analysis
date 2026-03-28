# Data

## GEODNET

### monthly_burns.csv
Monthly GEOD token burns on Solana from Dune query [6917159](https://dune.com/queries/6917159).

| Column | Type | Description |
|--------|------|-------------|
| month | date | Calendar month |
| burn_tx_count | integer | Number of burn transactions |
| geod_burned | numeric | Total GEOD burned (adjusted for 9 decimals) |
| unique_signers | integer | Distinct signers that month |

### burn_signer_concentration.csv
Burn signer concentration from Dune query [6917162](https://dune.com/queries/6917162).

| Column | Type | Description |
|--------|------|-------------|
| call_tx_signer | string | Solana wallet address |
| burn_tx_count | integer | Number of burn transactions by this signer |
| geod_burned | numeric | Total GEOD burned by this address |
| pct_of_total | numeric | Percentage of total burns |
| cumulative_pct | numeric | Cumulative percentage (ranked by volume) |

## Helium

### s2r_trajectory.csv
Helium Subsidy-to-Revenue ratio trajectory from Dune query [6918150](https://dune.com/queries/6918150).

Token rewards = HNT emissions (rewards escrow + delegation rewards) valued at monthly average oracle price. Data revenue = HNT burned for Data Credits, valued at oracle price.

| Column | Type | Description |
|--------|------|-------------|
| month | date | Calendar month |
| token_rewards_usd | numeric | Monthly HNT reward emissions (USD) |
| data_revenue_usd | numeric | Monthly HNT burned for Data Credits (USD) |
| s2r_ratio | numeric | token_rewards / (token_rewards + data_revenue) |

## Data Provenance

All GEODNET data was collected via Dune Analytics on Solana blockchain data (GEOD token mint: `7JA5eZdCzztSfQbJvS8aVVxMFfd81Rs9VvwnocV1mKHu`). Helium data was collected via Dune Analytics using Helium Foundation transformation views on Solana. Collection date: March 2026. Specific query IDs are linked above for reproducibility.
