
-- 使用join查询方式找出没有分类的电影id以及名称

-- film表
CREATE TABLE IF NOT EXISTS film (
film_id smallint(5)  NOT NULL DEFAULT '0',
title varchar(255) NOT NULL,
description text,
PRIMARY KEY (film_id));

-- category表

CREATE TABLE category  (
category_id  tinyint(3)  NOT NULL ,
name  varchar(25) NOT NULL, `last_update` timestamp,
PRIMARY KEY ( category_id ));

-- film_category表

CREATE TABLE film_category  (
film_id  smallint(5)  NOT NULL,
category_id  tinyint(3)  NOT NULL, `last_update` timestamp);


-- My Solution

Select f.film_id, f.title
From film as f left join film_category as fc on f.film_id = fc.film_id
Where fc.category_id is null

-- Learning Solution

-- 解题思路是运用 LEFT JOIN 连接两表，用 IS NULL 语句限定条件：
-- 1、用 LEFT JOIN 连接 film 和 film_category，限定条件为 f.film_id = fc.film_id，即连接电影 id 和电影分类 id，如果电影没有分类，则电影分类 id 显示 null
-- 2、再用 WHERE 来限定条件 fc.category_id IS NULL 选出没分类的电影
/* 注意：最后一句若写成 ON f.film_id = fc.film_id AND fc.category_id IS NULL，则意义变成左连接两表 film_id 相同的记录，且 film_category 原表中的 fc.category 的值为 null。显然，原表中的 fc.category 的值恒不为 null，因此（f.film_id = fc.film_id AND fc.category_id IS NULL）恒为 FALSE，左连接后则只会显示 film 表的数据，而 film_category 表的数据全显示为 null */

SELECT f.film_id, f.title FROM film f LEFT JOIN film_category fc
ON f.film_id = fc.film_id WHERE fc.category_id IS NULL