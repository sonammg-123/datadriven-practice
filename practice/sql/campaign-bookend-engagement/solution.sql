WITH campaign_stats AS (
    SELECT
        ad_campaign,
        MIN(CAST(impression_time AS DATE)) AS first_day,
        MAX(CAST(impression_time AS DATE)) AS last_day,
        COUNT(*) AS total_impressions
    FROM ad_impressions
    GROUP BY ad_campaign
),

daily_counts AS (
    SELECT
        a.ad_campaign,
        s.first_day,
        s.last_day,
        s.total_impressions,

        SUM(
            CASE
                WHEN CAST(a.impression_time AS DATE) = s.first_day
                THEN 1 ELSE 0
            END
        ) AS first_day_impressions,

        SUM(
            CASE
                WHEN CAST(a.impression_time AS DATE) = s.last_day
                THEN 1 ELSE 0
            END
        ) AS last_day_impressions

    FROM ad_impressions a
    JOIN campaign_stats s
        ON a.ad_campaign = s.ad_campaign
    GROUP BY
        a.ad_campaign,
        s.first_day,
        s.last_day,
        s.total_impressions
)

SELECT
    ad_campaign,
    ROUND(100.0 * first_day_impressions / total_impressions, 3) AS first_day_pct,
    ROUND(100.0 * last_day_impressions / total_impressions, 3) AS last_day_pct
FROM daily_counts
ORDER BY ad_campaign;
