/* 05. Most popular epic items */

SELECT 
    i.game_items,
    COUNT(e.amount) AS purchase_count,
    ROUND(
        COUNT(e.amount) * 100.0 / (
            SELECT COUNT(amount)
            FROM fantasy.events
            WHERE amount > 0
        ),
        2
    ) AS purchase_share,
    COUNT(DISTINCT e.id) AS buyers_count,
    ROUND(
        COUNT(DISTINCT e.id) * 100.0 / (
            SELECT COUNT(DISTINCT id)
            FROM fantasy.events
            WHERE amount > 0
        ),
        2
    ) AS buyers_share
FROM fantasy.events AS e
JOIN fantasy.items AS i 
    ON e.item_code = i.item_code
WHERE e.amount > 0
GROUP BY i.game_items
ORDER BY buyers_count DESC;
