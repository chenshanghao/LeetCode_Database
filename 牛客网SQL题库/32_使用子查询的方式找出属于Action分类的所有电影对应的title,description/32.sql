-- 使用子查询的方式找出属于Action分类的所有电影对应的title,description


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

Select f1.title, f1.description
From (film as f inner join film_category as fc on f.film_id = fc.film_id) as f1
    inner join category as c on f1.category_id = c.category_id
Where c.name = 'Action'


-- Learning Solution
-- 根据题意，最简单粗暴的解法是直接 FROM 三张表查询，且用 WHERE 并列三个限定条件：
-- 1、三个限定条件分别是【f.film_id = fc.film_id】、【fc.category_id = c.category_id 】、【c.name = 'Action'】 

SELECT f.title, f.description 
FROM film f, film_category fc, category c
WHERE f.film_id = fc.film_id 
AND fc.category_id = c.category_id 
AND c.name = 'Action'