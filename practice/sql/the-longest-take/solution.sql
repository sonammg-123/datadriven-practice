WITH max_duration AS (
    SELECT
        content_type,
        MAX(duration_seconds) AS longest_duration
    FROM content_items
    GROUP BY content_type
)

SELECT DISTINCT
    c.content_id,
    c.title
FROM content_items c
JOIN max_duration m
    ON c.content_type = m.content_type
    AND c.duration_seconds = m.longest_duration
WHERE c.publish_date >= '2026-01-01';
