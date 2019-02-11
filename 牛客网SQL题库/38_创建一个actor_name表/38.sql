-- 创建一个actor_name表

-- 对于如下表actor，其对应的数据为:
-- actor_id    first_name  last_name   last_update
-- 1   PENELOPE    GUINESS 2006-02-15 12:34:33
-- 2   NICK    WAHLBERG    2006-02-15 12:34:33

-- 创建一个actor_name表，将actor表中的所有first_name以及last_name导入改表。 actor_name表结构如下：
-- 列表  类型  是否为NULL 含义
-- first_name  varchar(45) not null    名字
-- last_name   varchar(45) not null    姓氏



-- Learning Solution 1

CREATE TABLE actor_name
(
first_name varchar(45) NOT NULL,
last_name varchar(45) NOT NULL
);

INSERT INTO actor_name 
SELECT first_name, last_name FROM actor;


-- 题目使用的是sqlite3，可以这么做：
create table actor_name as
select first_name,last_name from actor;


-- 如果是mysql，那么as可以去掉，也可以不去掉，例如：
create table actor_name
select first_name,last_name from actor;

