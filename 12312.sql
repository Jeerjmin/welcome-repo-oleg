SELECT
  *
FROM (
  SELECT
    author,
    COUNT(*) AS num_stories
  FROM hackernews.stories
  GROUP BY author
  ORDER BY num_stories DESC
  LIMIT 10
)