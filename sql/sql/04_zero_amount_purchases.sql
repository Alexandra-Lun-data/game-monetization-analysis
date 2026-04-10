/* 04. Zero-value purchases */

SELECT 
    total_count,
    zero_amount_count,
    ROUND(zero_amount_count * 100.0 / total_count, 2) AS zero_amount_share
FROM (
    SELECT 
        COUNT(*) AS total_count,
        SUM(CASE WHEN amount = 0 THEN 1 ELSE 0 END) AS zero_amount_count
    FROM fantasy.events
) AS stats;
