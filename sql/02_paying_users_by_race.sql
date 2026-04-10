/* 02. Share of paying users by race */

SELECT 
    r.race,
    COUNT(DISTINCT CASE WHEN u.payer = 1 THEN u.id END) AS paying_users,
    COUNT(DISTINCT u.id) AS total_users,
    ROUND(
        COUNT(DISTINCT CASE WHEN u.payer = 1 THEN u.id END) * 1.0
        / COUNT(DISTINCT u.id),
        2
    ) AS paying_share
FROM fantasy.users AS u
LEFT JOIN fantasy.race AS r 
    ON u.race_id = r.race_id
GROUP BY r.race
ORDER BY paying_share DESC;
