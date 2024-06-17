SELECT
  COUNT(*)
FROM (
  SELECT
    author,
    COUNT(*) AS num_stories
  FROM hackernews.stories
  GROUP BY
    author
)