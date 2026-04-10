/* 03. Purchase amount statistics */

SELECT 
    COUNT(amount) AS total_purchases,
    SUM(amount) AS total_amount,
    MAX(amount) AS max_amount,
    MIN(amount) AS min_amount,
    AVG(amount) AS avg_amount,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY amount) AS median_amount,
    STDDEV(amount) AS stddev_amount
FROM fantasy.events;
