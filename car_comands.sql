-- car table practice -=

/* Calculating Min, Max & Average */
-- find the most expensive car
--SELECT MAX(price) FROM car;
-- find the cheapest car in each model
--SELECT make, MIN(price) as lowest_price FROM car GROUP BY make ORDER BY lowest_price;

-- find avarage car price
--SELECT AVG(price) FROM car;				-- 54243.716400000000
--SELECT ROUND(AVG(price)) FROM car;		-- 54244


/*  SUM */
-- sum up car prices for each producer
--SELECT make, SUM(price) FROM car GROUP BY make;




/*  ======= ARITHMETIC OPERATIONS ======== */
-- get 15% discount price on each car
--SELECT id, make, model, price, ROUND(price*0.15, 2) AS discount_15_perc , ROUND(price-price*0.15, 2) AS discounted_price_15_perc FROM car;

/*  COALESCE keyword - try next value if previous is not present  */
SELECT COALESCE 

/*   */


/*   */


/*   */