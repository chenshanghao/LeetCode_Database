# Write your MySQL query statement below

# Method 1
SELECT Score, 
(SELECT COUNT(DISTINCT Score) FROM Scores WHERE Score >= s.Score) as Rank 
FROM Scores s ORDER BY Score DESC;

# Method 2(和方法一类似)
SELECT Score,
(SELECT COUNT(*) FROM (SELECT DISTINCT Score s FROM Scores) t WHERE s >= Score) Rank
FROM Scores ORDER BY Score DESC;

# Method 3
SELECT s.Score, COUNT(DISTINCT t.Score) Rank
FROM Scores s JOIN Scores t ON s.Score <= t.Score
GROUP BY s.Id 
ORDER BY s.Score DESC;

