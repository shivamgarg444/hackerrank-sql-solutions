# Medium difficulty, Basic Join + Subquery, Having

SELECT 
  h.hacker_id,
  h.name,
  SUM(score) AS total_score
FROM Hackers h
JOIN
     (SELECT hacker_id, MAX(score) AS score FROM Submissions GROUP BY challenge_id, hacker_id) AS maxs

ON h.hacker_id = maxs.hacker_id
GROUP BY h.hacker_id, h.name
HAVING total_score > 0
ORDER BY total_score DESC, h.hacker_id
