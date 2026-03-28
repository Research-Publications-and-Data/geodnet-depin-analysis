-- Dune Query 6918150: Helium S2R Trajectory (GeoDePIN Paper)
-- https://dune.com/queries/6918150
-- S2R = token_rewards_usd / (token_rewards_usd + data_revenue_usd)
-- Data revenue = HNT burned for Data Credits (DC), valued at oracle price

WITH monthly_rewards AS (
    SELECT
        date_trunc('month', block_date) AS month,
        SUM(hnt_minted)                 AS total_hnt_rewards
    FROM (
        SELECT block_date, hnt_minted
        FROM dune."helium-foundation".result_hnt_issued_to_rewards_escrow
        UNION ALL
        SELECT block_date, hnt_minted
        FROM dune."helium-foundation".result_hnt_issued_to_delegation_rewards_escrow
    ) combined
    GROUP BY 1
),

monthly_dc_revenue AS (
    -- HNT burned for Data Credits = data demand revenue
    -- hnt_burned is stored as negative; use ABS
    SELECT
        date_trunc('month', block_date) AS month,
        SUM(ABS(CAST(hnt_burned AS DOUBLE)) * CAST(hnt_avg_price AS DOUBLE)) AS data_revenue_usd,
        AVG(CAST(hnt_avg_price AS DOUBLE))                                    AS avg_hnt_price
    FROM dune."helium-foundation".result_helium_dc_minted_hnt_burned_unparameterized
    WHERE hnt_avg_price IS NOT NULL
      AND hnt_avg_price > 0
    GROUP BY 1
),

combined AS (
    SELECT
        r.month,
        CAST(r.total_hnt_rewards AS DOUBLE) * COALESCE(d.avg_hnt_price, 0) AS token_rewards_usd,
        COALESCE(d.data_revenue_usd, 0)                                     AS data_revenue_usd
    FROM monthly_rewards r
    LEFT JOIN monthly_dc_revenue d
        ON r.month = d.month
)

SELECT
    CAST(month AS DATE)                                    AS month,
    ROUND(token_rewards_usd, 2)                            AS token_rewards_usd,
    ROUND(data_revenue_usd, 2)                             AS data_revenue_usd,
    ROUND(
        CASE
            WHEN (token_rewards_usd + data_revenue_usd) > 0
            THEN token_rewards_usd / (token_rewards_usd + data_revenue_usd)
            ELSE NULL
        END,
        4
    )                                                      AS s2r_ratio
FROM combined
WHERE month < date_trunc('month', CURRENT_DATE)
ORDER BY month ASC
