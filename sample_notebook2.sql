SELECT
  *
FROM (
  SELECT
    author,
    COUNT(*) AS num_stories
  FROM hackernews.stories
  GROUP BY author
) AS T1
INNER JOIN (
  SELECT
    author,
    COUNT(*) AS num_stories
  FROM hackernews.stories
  GROUP BY author
) AS T2
ON T1.author = T2.author
WHERE T1.num_stories > 1 AND T2.num_stories > 1