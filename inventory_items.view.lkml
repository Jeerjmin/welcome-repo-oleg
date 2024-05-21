SELECT
  COUNT(*)
FROM products
WHERE
  EXTRACT(YEAR FROM created_at) = EXTRACT(YEAR FROM CURRENT_DATE - INTERVAL '1 week')
  AND EXTRACT(WEEK FROM created_at) = EXTRACT(WEEK FROM CURRENT_DATE - INTERVAL '1 week')