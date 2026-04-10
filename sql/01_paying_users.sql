/* 01. Overall share of paying users */

SELECT 
    COUNT(DISTINCT id) AS total_users,
    COUNT(DISTINCT CASE WHEN payer = 1 THEN id END) AS paying_users,
    ROUND(
        COUNT(DISTINCT CASE WHEN payer = 1 THEN id END) * 1.0
        / COUNT(DISTINCT id),
        2
    ) AS paying_share
FROM fantasy.users;
