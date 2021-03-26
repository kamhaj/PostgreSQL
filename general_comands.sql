/*  COALESCE(value1, value2, value3, ...) keyword - try next value if previous is not present  */
-- select emails, if not present print 'email not provided'
--SELECT COALESCE(email, 'Email not provided') from person;


/* NULLIF(arg1, arg2) - return arg1 if arg1 is not equal to arg1 
 useful to safely person division by 0 */
--SELECT NULLIF(10, 5);  				-- returns 10
--SELECT NULLIF(10, -5);  				-- returns 10
--SELECT NULLIF(12, 3);  				-- returns 12
--SELECT NULLIF(12, 12);  				-- returns null
--SELECT 10 / NULLIF(2, 9); 			-- returns 5 (10/2)
--SELECT NULLIF(0,0)					-- returns null
--SELECT COALESCE (10/NULLIF(0,0), 0) 	-- returns 0


/*  TIMESTAMPS and DATES */
-- see when record was created, updated, ...
--SELECT NOW();		-- returns 2021-03-26 09:21:18.252046+01
--SELECT NOW()::DATE;	-- returns 2021-03-26
--SELECT NOW()::TIME;	-- returns 09:22:04.485988

-- subtract one year from now
--SELECT NOW() - INTERVAL '1 YEAR'; 				-- 2020-03-26 09:23:33.353054+01
--SELECT NOW() - INTERVAL '10 YEARS';				-- 2011-03-26 09:24:31.923302+01
--SELECT NOW()::DATE - INTERVAL '10 MONTHS';		-- 2020-05-26 00:00:00
--SELECT (NOW() - INTERVAL '10 MONTHS')::DATE;		-- 2020-05-26


/*  EXTRACTING FIELDS (year, ...) */
--SELECT EXTRACT(YEAR FROM NOW());		-- 2021
--SELECT EXTRACT(YEAR FROM NOW());		-- 2021
--SELECT EXTRACT (DOW FROM NOW()); 		-- 5 (FRIDAY), SUNDAY is 0?
--SElECT EXTRACT (century FROM NOW());  -- 21


/*  AGE(start date, end date) FUNCTION */
-- compute age (TIMESTAMP) using function
--SELECT first_name, last_name, gender, country_of_birth, date_of_birth, AGE(NOW(), date_of_birth) FROM person;
--SELECT first_name, last_name, date_of_birth, EXTRACT (YEAR FROM AGE(NOW(), date_of_birth)) FROM person;