# Write your MySQL query statement below
SELECT
    (CASE
        -- 非末尾奇数 id+1
        WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
        -- 末尾奇数 id不变
        WHEN MOD(id, 2) != 0 AND counts = id THEN id
        -- 偶数 id-1
        ELSE id - 1
    END) AS id,
    student
FROM
    seat,
    (SELECT
        COUNT(*) AS counts
    FROM
        seat) AS seat_counts
ORDER BY id ASC;
