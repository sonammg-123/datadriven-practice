SELECT
    ad_campaign,
    ROUND(100.0 * SUM(clicked) / COUNT(*), 2) AS ctr_pct,
    SUM(revenue) AS total_revenue,
    COUNT(*) AS impressions
FROM ad_impressions
GROUP BY ad_campaign
HAVING 100.0 * SUM(clicked) / COUNT(*) > 20
ORDER BY ctr_pct DESC;
