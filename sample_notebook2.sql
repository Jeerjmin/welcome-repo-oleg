
WITH date_ranges AS (
  SELECT
    '2024 Last Month' AS period,
    DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 month' AS start_date,
    DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 day' AS end_date
  UNION ALL
  SELECT
    '2023 Same Month' AS period,
    DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 year' - INTERVAL '1 month' AS start_date,
    DATE_TRUNC('month', CURRENT_DATE) - INTERVAL '1 year' - INTERVAL '1 day' AS end_date
)
SELECT
  dr.period,
  COUNT(o.id) AS order_count
FROM
  date_ranges dr
LEFT JOIN public.orders o ON
  o.created_at >= dr.start_date
  AND o.created_at <= dr.end_date
GROUP BY
  dr.period
