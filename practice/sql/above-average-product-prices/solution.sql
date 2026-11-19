WITH product_base_prices AS (
    SELECT 
        product_id,
        MIN(total_amount) AS base_price
    FROM transactions
    GROUP BY product_id
)
SELECT 
    product_id,
    base_price
FROM product_base_prices
WHERE base_price > (
    SELECT AVG(base_price) 
    FROM product_base_prices
)
ORDER BY product_id;
