--                  ------ SELECT QUERY ---------

-- #All brand and processor combo exist in this data set

SELECT DISTINCT(brand_name) AS 'All brands',(processor_brand) FROM fahad.smartphones;

-- ---------------------------------------------------------------------------
-- SOME QUESTION AND SOLUTIONS

-- #find all samsung phone
SELECT * FROM fahad.smartphones
WHERE brand_name = 'samsung'

-- ------------------------------------------------------------------------------
-- #1) Phone whose price greter than 1-lack
WHERE price > 100000

-- ------------------------------------------------------------------------------
-- #2) between 
WHERE price > 10000 AND price < 20000 
WHERE price BETWEEN  15000 AND  30000 

-- -------------------------------------------------------------------------------
-- #3) find phones with rating > 80 and price < 25000 of samsung

WHERE price < 20000 AND rating > 80 AND brand_name = 'samsung'

-- ------------------------------------------------------------------------------
-- #4) find brands who sell phones with price > 50,000

SELECT DISTINCT (brand_name) FROM fahad.smartphones
WHERE price > 50000

-- ------------------------------------------------------------------------------
 -- #5) phones with processor snadron , exynos ,bionic
 
SELECT * FROM fahad.smartphones
WHERE processor_brand = 'snapdragon' OR
processor_brand = 'exynos' OR
processor_brand = 'bionic'

-- OR 

WHERE processor_brand IN ('snapdragon','exynos','bionic')

-- ---------------------------------------------------------------------
--                    ---- UPDATE -----

-- #6) Replace mediatek with dimensity as both are same company

UPDATE fahad.smartphones
SET processor_brand = 'dimensity'
WHERE processor_brand = 'mediatek'

-- -----------------------------------------------------------------------
--                     ------ DELETE ------
-- #6) delete all rows (jisme phone ki price 2lkh + ho)

SELECT *FROM fahad.smartphones
WHERE price > 200000

DELETE FROM fahad.smartphones
WHERE price > 200000

-- ------------------------------------------------------------------------
--                ------ SOME SQL QUERY ------ AGG FUNCTION ------
-- #1) MAX , MIN, AVG, SUM, COUNT, STD, VARIANCE

SELECT MAX(price) FROM fahad.smartphones

-- ------------------------------------------------------------------------
-- #2) max priced samsung phone find name of that phone also

SELECT MAX(price) FROM fahad.smartphones
WHERE brand_name = 'samsung'

SELECT * FROM fahad.smartphones
WHERE brand_name = 'samsung' AND price = 110999

-- -----------------------------------------------------------------------
-- #3) FIND NUMBER OF ONE PLUS PHONE
-- SELECT COUNT(*) FROM fahad.smartphones
-- WHERE brand_name = 'oneplus'

-- ----------------------------------------------------------------------
-- #4) Find total number of processor brnd

SELECT COUNT(DISTINCT(brand_name)) FROM fahad.smartphones;

-- ------------------------------------------------------------------
--              ---- SCALAR FUNCTION -----
--  ABS -> make every value +ve , ROUND , CEIL ->uchaye means 6.1 ko 7,FLOOR -> opps of CEIL 6.9 -> 6
 















