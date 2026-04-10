/* 06. Race-based player activity analysis */

WITH race_users AS (
    SELECT 
        r.race,
        COUNT(DISTINCT u.id) AS total_users
    FROM fantasy.users AS u
    LEFT JOIN fantasy.race AS r
        ON u.race_id = r.race_id
    GROUP BY r.race
),

race_buyers AS (
    SELECT 
        r.race,
        COUNT(DISTINCT e.id) AS buyers_count
    FROM fantasy.users AS u
    LEFT JOIN fantasy.race AS r
        ON u.race_id = r.race_id
    LEFT JOIN fantasy.events AS e
        ON u.id = e.id
    WHERE e.amount > 0
    GROUP BY r.race
),

race_payers AS (
    SELECT 
        r.race,
        COUNT(DISTINCT u.id) AS paying_users
    FROM fantasy.users AS u
    LEFT JOIN fantasy.race AS r
        ON u.race_id = r.race_id
    WHERE u.payer = 1
    GROUP BY r.race
),

race_purchase_stats AS (
    SELECT 
        r.race,
        COUNT(DISTINCT e.id) AS buyers_count,
        COUNT(e.amount) AS purchase_count,
        ROUND(COUNT(e.amount) * 1.0 / COUNT(DISTINCT e.id), 2) AS purchases_per_user,
        ROUND(AVG(e.amount)::numeric, 2) AS avg_purchase_amount,
        ROUND(SUM(e.amount)::numeric / COUNT(DISTINCT e.id), 2) AS total_amount_per_user
    FROM fantasy.users AS u
    LEFT JOIN fantasy.events AS e
        ON u.id = e.id
    LEFT JOIN fantasy.race AS r
        ON u.race_id = r.race_id
    WHERE e.amount > 0
    GROUP BY r.race
)

SELECT 
    ru.race,
    ru.total_users,
    COALESCE(rb.buyers_count, 0) AS buyers_count,
    ROUND(COALESCE(rb.buyers_count, 0) * 100.0 / ru.total_users, 2) AS buyers_share,
    COALESCE(rp.paying_users, 0) AS paying_users,
    ROUND(COALESCE(rp.paying_users, 0) * 100.0 / ru.total_users, 2) AS paying_share,
    rps.purchases_per_user,
    rps.avg_purchase_amount,
    rps.total_amount_per_user
FROM race_users AS ru
LEFT JOIN race_buyers AS rb
    ON ru.race = rb.race
LEFT JOIN race_payers AS rp
    ON ru.race = rp.race
LEFT JOIN race_purchase_stats AS rps
    ON ru.race = rps.race
ORDER BY ru.race;
