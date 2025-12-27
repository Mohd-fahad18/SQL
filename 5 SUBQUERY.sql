--        ----- SUBQUERY-----
-- query within a query

-- Find the movie with highest rating

-- SELECT * FROM fahad1.movies
-- WHERE score = (SELECT MAX(score) FROM fahad1.movies)

-- ------------------------------------------------------------------------------------------------ 
--              *** SCALAR SUBQUERY ***

-- #1) find the movie with highest profit vs (order by)

-- M1
-- USE fahad1;
-- SELECT * FROM movies
-- WHERE (gross - budget) = (SELECT MAX(gross - budget) FROM movies)

--   OR M-2

-- SELECT * from movies
-- order by (gross - budget) desc limit 1

-- ----------------------------------------------------------------------------------------
-- #2) find count of above avg movies

-- select count(*) from movies
-- where score > (select avg(score) from movies)

-- -----------------------------------------------------------------------------------------
-- #3) find highest rated movie of  year 2000

-- select * from movies
-- where year = 2000 and score = (select max(score) from movies where year = 2000)

-- ----------------------------------------------------------------------------------------
-- #4) find the highest rated movie among all movies whose number of voters are greter
--   than the dataset avg vote

-- query -> query k andr -> query (3 time)

-- select * from movies 
-- where score = (select max(score) from movies
--                 where votes > (select avg(votes)
--                                  from movies))

-- ---------------------------------------------------------------------------------------------
--             *** INDEPENDENT SUQUERY *** use 'IN' and 'NOT IN'
-- #1) Find the users who never placed order

-- select * from users
-- where user_id not in (select distinct(user_id) from orders)

-- --------------------------------------------------------------------------------------------------
-- #2) find all the movies made by top 3 directors(in term of total gross income)

-- WITH top_directors AS (SELECT director FROM movies 
--                          GROUP BY director 
--                          ORDER BY  sum(gross) DESC
--                                   LIMIT 3)
-- SELECT * FROM movies
-- WHERE director IN (SELECT * FROM top_directors)

-- -------------------------------------------------------------------------------------------------------
-- #3) find all movies of all those actor whose filmography avg rating greter than 8.5
--   (take 25000 vote as cut off)

-- SELECT * FROM movies
-- WHERE star IN (SELECT star FROM movies
-- WHERE votes > 25000
-- GROUP BY star 
-- HAVING AVG(score) > 8.5)

-- ------------------------------------------------------------------------------------------------------------
--               *** TABLE SUBQUERY *** multiple rows and column

#1) find most profitable movie of each year 

-- SELECT * FROM movies
-- WHERE (year,gross - budget) IN (SELECT year , MAX(gross - budget)
-- 									FROM movies 
-- 									GROUP BY year)

-- -------------------------------------------------------------------------------------------
-- #2) Find highest rated movie of each genre votes cutoff of 25000

-- SELECT * FROM movies
-- WHERE (genre,score) IN (SELECT genre,MAX(score) 
-- 							FROM movies
-- 							WHERE votes > 25000
-- 							GROUP BY genre)

-- ---------------------------------------------------------------------------------------------
--                *** CORELATED SUBQUERY ***
-- #1) find the movies that have a rating higher than the avg rating of the same genre

-- SELECT * FROM movies m1
-- WHERE score > (SELECT AVG(score) FROM movies m2 WHERE m2.genre = m1.genre) 

-- --------------------------------------------------------------------------------------------
--           USING HAVING
#1)  Find genres having avg score > avg score of all the movies 

-- SELECT genre, AVG(score) FROM movies
-- GROUP BY genre
-- HAVING AVG(score) > (SELECT AVG(score) FROM movies)

-- --------------------------------------------------------------------------------------------
--    INSERT
#2 Pupulate a alredy created loyal customer table with customenrs who have order food more than 3 time
-- CREATE TABLE loyal_user (
-- 	user_id INTEGER NOT NULL,
-- 	name VARCHAR(255) NOT NULL
-- );

SELECT * FROM fahad1.loyal_user;
INSERT INTO loyal_user(user_id,name)
SELECT t1.user_id,name
FROM orders t1
JOIN users t2 ON t1.user_id = t2.user_id
GROUP BY user_id
HAVING COUNT(*) > 3


















 