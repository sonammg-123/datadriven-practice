SELECT
    status,
    COUNT(*) AS order_count,
    ROUND(AVG(profit), 3) AS avg_profit
FROM orders
WHERE region IS NOT NULL
GROUP BY status
HAVING COUNT(*) >= 24
ORDER BY avg_profit DESC;
