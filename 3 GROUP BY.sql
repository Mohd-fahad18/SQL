--              ------------ GROUPBY -------

-- #1) GROUP SMARTPHONES BY BRAND AND GET THE COUNT ,AVERAGE PRICE , MAX RATING, 
--    AVG SCREEN SIZE, AND AVG BATTERY CAPACITY 

SELECT brand_name,
COUNT(*) AS 'num_phone',
ROUND(AVG(price)) AS 'avg_price',
MAX(rating) AS 'max_rating',
ROUND(AVG(screen_size),2) AS 'avg_screen',
ROUND(AVG(battery_capacity)) AS 'avg_battery'
FROM fahad.smartphones
group by brand_name

-- ------------------------------------------------------------------------------

-- #2) GROUP BY SMARTPHONES BY WETHER THEY SUPPORT 5G OR NOT

SELECT has_5g,
AVG(price) AS 'avg_price',
AVG(rating) AS 'rating'
FROM fahad.smartphones
GROUP BY has_5g

-- -----------------------------------------------------------------------------

-- #3) GROUP SMARTPHONES BY EXTENDED MEMORY ABAILABLE AND GET AVERAGE PRICE

SELECT extended_memory_available,
AVG(price) AS 'avg_price',
AVG(rating) AS 'rating'
FROM fahad.smartphones
GROUP BY extended_memory_available

-- --------------------------------------------------------------------------
--    ---------GROUP BY ON 2 OR MORE COLUMN ----------

-- #4) GROUP SMARTPHONES BY THE BRAND AND PROCESSOR BRAND AND GET THE COUNT OF MODEL
--   AND THE AVG PRIMARY CAMERA RESOLUTION 

SELECT brand_name,
processor_brand,
COUNT(*) AS 'num_phones',
ROUND(AVG(primary_camera_rear)) AS 'avg_camera_resolution'
FROM fahad.smartphones
GROUP BY brand_name, processor_brand
ORDER BY brand_name

-- -------------------------------------------------------------------------
-- #5) FIND SAMSUNG 5G PHONE ALSO FIND OUT AVG PRICE FOR NFC AND NON NFC

SELECT has_nfc,
ROUND(AVG(price)) AS 'avg_price'
FROM fahad.smartphones
WHERE brand_name = 'samsung'
GROUP BY has_nfc

-- -------------------------------------------------------------------------
-- #6) FIND THE PHONE NAME PRICE OF THE COSTIEST PHONE FOR EACH BRAND

SELECT brand_name,
MAX(price) AS 'max_price' 
FROM fahad.smartphones
GROUP BY brand_name
ORDER BY max_price DESC

-- -------------------------------------------------------------------------------
--     SELECT -> WHERE    SAME WAY    ,   GROUP-BY -> HAVING

-- #7) AVG PRICE NIKALO UN PHONES KA JISKE AT LEAST 20 PHONE HO DATASET M

SELECT brand_name,
COUNT(*) AS 'count',
AVG(price) AS 'avg_price'
FROM fahad.smartphones
GROUP BY brand_name
HAVING count BETWEEN 20 AND 50
ORDER BY avg_price DESC

-- ------------------------------------------------------------------------------
--                           GOOD QESTION 
-- #8) Find the top 3 brand with the highest avg ram that have a refresh rate of at least 
--  90 hz and fast charging available and dont consider brands which have less than 10 phone

SELECT brand_name,
COUNT(*) AS 'count',
AVG(ram_capacity) AS 'avg_ram' 
FROM fahad.smartphones
WHERE refresh_rate>90 AND  fast_charging_available = 1
GROUP BY brand_name
HAVING  count >10
ORDER BY 'avg_ram' DESC limit 3

-- ---------------------------------------------------------------------
--                 --- IMPORTANT---
-- agar khud k bnaye col like avg pr filter krenge to 'HAVING' m jayega
-- agar dataset k kisi col pr flitering kroge to 'WHERE' m jaygea

-- #9) Find avg price of the phone brand with avg rating > 70 and num_phone 
--  more than 10 among all 5g enables phones


SELECT brand_name, AVG(price) AS 'avg_price'
FROM fahad.smartphones
WHERE has_5g = 'TRUE'
GROUP BY brand_name
HAVING AVG(rating) > 70 AND COUNT(*) > 10
ORDER BY avg_price DESC

-- -------------------------------------------------------------------------
--            ------- OPERATION OF IPL DATASET--------
-- #1)PLAERS WITH MOST RUN IN IPL CARRER

SELECT batter, SUM(batsman_run) AS 'runs'
FROM fahad.ipl
GROUP BY batter
ORDER BY runs DESC LIMIT 5

-- --------------------------------------------------------------------------
-- #2) FIND THE 2ND HIGHEST 6 HITTER IN IPL

SELECT batter,COUNT(*) AS 'six_count'
FROM fahad.ipl
WHERE batsman_run = 6
GROUP BY batter
ORDER BY six_count DESC LIMIT 1,1

-- ---------------------------------------------------------------------------
-- #3) find the top 5 batsman with highest srike rate who have played a min of 1000 balls

SELECT batter,SUM(batsman_run) AS 'runs',COUNT(batsman_run) AS 'ball_played',
ROUND((SUM(batsman_run)/COUNT(batsman_run))*100) AS 'strike_rate'
FROM fahad.ipl
GROUP BY batter 
HAVING COUNT(batsman_run) > 1000
ORDER BY strike_rate DESC LIMIT 5

















