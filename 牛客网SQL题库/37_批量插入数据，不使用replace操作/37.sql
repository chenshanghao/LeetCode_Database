-- 批量插入数据，不使用replace操作



-- 对于表actor批量插入如下数据,如果数据已经存在，请忽略，不使用replace操作
CREATE TABLE IF NOT EXISTS actor (
actor_id smallint(5) NOT NULL PRIMARY KEY,
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL,
last_update timestamp NOT NULL DEFAULT (datetime('now','localtime')))

-- actor_id    first_name  last_name   last_update
-- '3' 'ED'    'CHASE' '2006-02-15 12:34:33'



-- Learning Solution

-- 因为题目判定系统使用的是sqlite3，所以必须按sqlite3的写法来做，
Insert or Ignore into actor
Values('3', 'ED', 'CHASE', '2006-02-15 12:34:33')

-- 如果是mysql，那么把or去掉，像下面这样：
insert IGNORE into actor
values(3,'ED','CHASE','2006-02-15 12:34:33');
