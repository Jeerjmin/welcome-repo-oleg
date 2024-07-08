SELECT
  *
FROM users
WHERE
  country = 'USA'
UNION ALL
SELECT
  *
FROM users
WHERE
  country = 'Canada'