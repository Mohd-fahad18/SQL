--                 ---------------- SORTING ------------------

-- #1) TOP 5 SAMSUNG PHONE WITH BIGGEST SCREEN SIZE
-- USE LIMIT SAME AS HEAD IN PANDAS

-- SELECT model,screen_size FROM fahad.smartphones 
-- WHERE brand_name='samsung'
-- ORDER BY screen_size DESC
-- LIMIT 5

-- ---------------------------------------------------------------------------------

-- #2) SORT ALL PHONE IN DESCENDING ORDER OF NUMBER OF TOTAL CAMERAS

-- SELECT model, num_front_cameras + num_rear_cameras AS 'Total_cameras' 
-- FROM fahad.smartphones
-- ORDER BY Total_cameras DESC

-- ------------------------------------------------------------------------------
-- #3) Sort data on basis of ppi in decreasing order

-- SELECT model,
-- ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size) AS ppi
-- FROM fahad.smartphones
-- ORDER BY ppi DESC
 
 -- ------------------------------------------------------------------------------
 -- #4) find the phone with 2nd largest battery
 
 -- SELECT model,battery_capacity 
--  FROM fahad.smartphones
--  ORDER BY battery_capacity DESC LIMIT 1,1 -- -> (start , number of rows) -> 1,1 means from start from 1 and 1 row (it has 0 indexing)  

-- ---------------------------------------------------------------------------
-- #4) find the phone with  largest battery position 3,4,5
 
--  SELECT model,battery_capacity 
--  FROM fahad.smartphones
--  ORDER BY battery_capacity DESC LIMIT 2,3 -- (FOR LOWEST USE ASC INPLACE OF DESC)


-- ----------------------------------------------------------------------------
-- #5) find the name and rating of the worst rated apple phone 

-- SELECT model,rating FROM fahad.smartphones
-- WHERE brand_name = 'apple' AND rating != 0
-- ORDER BY rating ASC LIMIT 1 










