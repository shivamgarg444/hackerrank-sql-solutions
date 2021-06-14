# Medium difficulty, Basic Join + Subquery, Having

SELECT 
  h.hacker_id,
  h.name,
  SUM(score) AS total_score   # score field used from subquery
FROM Hackers h
JOIN  # joining a regular table and a temp table 
     (SELECT hacker_id, MAX(score) AS score FROM Submissions GROUP BY challenge_id, hacker_id) AS maxs

ON h.hacker_id = maxs.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total_score > 0   # used in place of WHERE as aggregate functions andgroup by is used
ORDER BY total_score DESC, h.hacker_id
