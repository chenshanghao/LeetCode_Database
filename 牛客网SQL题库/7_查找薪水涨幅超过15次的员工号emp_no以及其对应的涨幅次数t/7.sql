

/**
1、用COUNT()函数和GROUP BY语句可以统计同一emp_no值的记录条数
2、根据题意，输出的涨幅次数为t，故用AS语句将COUNT(emp_no)的值转换为t
3、由于COUNT()函数不可用于WHERE语句中，故使用HAVING语句来限定t>15的条件
4、最后存在一个理解误区，涨幅超过15次，salaries中相应的记录数应该超过16（从第2条记录开始算作第1次涨幅），不过题目为了简单起见，将第1条记录当作第1次涨幅，所以令t>15即可
/**  注意： 严格来说，下一条salary高于本条才算涨幅，但本题只要出现了一条记录就算一次涨幅，salary相同可以理解为涨幅为0，salary变少理解为涨幅为负 **/

/**
Having是一个过滤声明，是在查询返回结果集以后对查询结果进行的过滤操作，在Having中可以使用聚合函数。
在查询过程中聚合语句(sum,min,max,avg,count)要比having子句优先执行。而where子句在查询过程中执行优先级高于聚合语句。
**/


SELECT emp_no, COUNT(emp_no) AS t 
FROM salaries 
GROUP BY emp_no 
HAVING t > 15