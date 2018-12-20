# Write your MySQL query statement below
# Select w2.Id
# FROM Weather w1, Weather w2
# WHERE w1.Temperature < w2.Temperature and (w2.RecordDate-w1.RecordDate=1);

SELECT wt1.Id 
FROM Weather wt1, Weather wt2
WHERE wt1.Temperature > wt2.Temperature AND 
      TO_DAYS(wt1.RecordDate)-TO_DAYS(wt2.RecordDate)=1;