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



-- Learning Solution
-- 1、找到对应电影数量>=5的所有分类，建立成虚表cc：(select category_id, count(film_id) as category_num from  film_category  group by category_id having count(film_id)>=5) as cc
-- 2、设定限制条件 f.description like '%robot%'
-- 3、在表cc、f、fc、c中查找包括robot的电影对应的分类名称和对应的电影数目。

SELECT c.name, COUNT(fc.film_id) FROM
 (select category_id, COUNT(film_id) AS category_num 
  FROM film_category  
  GROUP BY category_id 
  HAVING count(film_id)>=5) AS cc,
  film AS f, film_category AS fc, category AS c
WHERE  f.description LIKE '%robot%'
AND f.film_id = fc.film_id
AND c.category_id = fc.category_id
AND c.category_id=cc.category_id