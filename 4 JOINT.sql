-- USE USERS AND MEMEBERS 

SELECT * FROM  fahad.users t1
CROSS JOIN fahad.groups t2

-- --------------------------------------------------------------------
-- INNER JOIN
SELECT * FROM fahad.membership t1
INNER JOIN fahad.users1 t2
on t1.user_id = t2.user_id

-- -------------------------------------------------------------------
-- LEFT JOIN

SELECT * FROM fahad.membership t1
LEFT JOIN fahad.users1 t2
ON t1.user_id = t2.user_id

-- --------------------------------------------------------------------
--  RIGHT JOIN

SELECT * FROM fahad.membership t1
RIGHT JOIN fahad.users1 t2
ON t1.user_id = t2.user_id

-- -----------------------------------------------------------------
--                 SET OPERATION
--  UNION -> merge 2 table ,remove duplicate rows
--  UNION ALL ->    Same as union it not remove duplicate
-- INTERSECT -> DISPLAY common rows
--  EXCEPT ->  give condition its like minus 

-- -------------------------------------------------------------------
SELECT * FROM fahad.person1 
UNION ALL                         -- USE HERE ALL 4
SELECT * FROM fahad.person2

-- ---------------------------------------------------------------
-- TRICK FRO FULL OUTER JOIN WHEN COLMS AREE DIFFRENT
--   left join +(union)  right join

SELECT * FROM fahad.membership t1
LEFT JOIN fahad.users1 t2
ON t1.user_id = t2.user_id
UNION
SELECT * FROM fahad.membership t1
RIGHT JOIN fahad.users1 t2
ON t1.user_id = t2.user_id

-- -------------------------------------------------------------------
--      **** SELF JOIN ****-> use when compare 2 different rows in same table
-- join users table as name - emergency contact
 
SELECT * FROM fahad.users1 t1
JOIN fahad.users1 t2
ON t1.emergency_contact = t2.user_id

-- ----------------------------------------------------------------
-- JOINT ON BASE OF 2 COLUMN 

SELECT t1.first_name,t2.class_name,t2.class_year,t2.teacher FROM fahad.students t1
JOIN fahad.class t2
ON t1.class_id = t2.class_id AND t1.enrollment_year = t2.class_year

-- ------------------------------------------------------------------------------

--            ----------- PRACTICE QUESTION -----------
-- #1) filter rows on bases of city and joining 

SELECT * FROM fahad.orders t1
JOIN fahad.users t2
ON t1.user_id = t2.user_id
WHERE t2.city = 'Pune' 

-- ------------------------------------------------------------------------------
-- #2) Find the profitable orders
-- complex ques isme order pr group by fir profit pr sum fir condition greter than 0

select t1.order_id,SUM(t2.profit) AS 'total_profit' from fahad.orders t1
JOIN fahad.order_details t2
ON t1.order_id = t2.order_id
GROUP BY t1.order_id
HAVING total_profit > 0

-- -----------------------------------------------------------------------------

-- #3) Customer who place maximum number of order

-- SELECT name,COUNT(*) FROM fahad.orders t1
-- JOIN fahad.users t2
-- ON t1.user_id = t2.user_id
-- GROUP BY t2.name
-- ORDER BY Count(*) DESC 

-- --------------------------------------------------------------------------------

-- #4) Which is most profitable category

-- select t2.vertical,SUM(profit) from fahad.order_details t1
-- join fahad.category t2
-- on t1.category_id = t2.category_id
-- GROUP BY t2.vertical
-- ORDER BY SUM(profit) DESC










