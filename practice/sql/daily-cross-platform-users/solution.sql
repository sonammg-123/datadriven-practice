SELECT
    DATE(us.session_start) AS session_date,
    COUNT(DISTINCT us.user_id) AS user_count

FROM user_sessions us

JOIN devices d
    ON us.device_id = d.device_id

WHERE d.device_type IN ('desktop', 'tablet', 'smart_tv')

GROUP BY DATE(us.session_start)

ORDER BY session_date ASC;
