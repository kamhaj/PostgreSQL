/*
1. First, the product of all tables in the FROM clause is formed.
2. The WHERE clause is then evaluated to eliminate rows that do not satisfy the search_condition.
3. Next, the rows are grouped using the columns in the GROUP BY clause.
4. Then, groups that do not satisfy the search_condition in the HAVING clause are eliminated.
5. Next, the expressions in the SELECT statement target list are evaluated.
6. If the DISTINCT keyword in present in the select clause, duplicate rows are now eliminated.
7. The UNION is taken after each sub-select is evaluated.
8. Finally, the resulting rows are sorted according to the columns specified in the ORDER BY clause.
9. TOP clause is executed

e.g. it explains why an alias (evaluated in step 5.) works in ORDER BY clause but won't work in HAVING 
*/

/* order rows descending */
--SELECT * FROM person ORDER BY country_of_birth DESC;

/* order rows ascending (default), limit output to 10 rows */
--SELECT * FROM person ORDER BY first_name ASC LIMIT 10;

/* see how many unique countries there are - 111 counties */
--SELECT DISTINCT country_of_birth FROM person ORDER BY country_of_birth DESC; 

/* WHERE clause and AND - filter data based on conditions */
--SELECT * FROM person WHERE gender='Female';
--SELECT * FROM person WHERE gender='Male' AND country_of_birth='Poland' OR country_of_birth='Germany';

/* LIMIT and OFFSET */
--SELECT id, first_name, last_name, email from person LIMIT 30 OFFSET 5;

/*  IN keyword */
--SELECT * FROM person WHERE country_of_birth IN('Poland', 'France', 'Brazil') ORDER BY country_of_birth;

/* BETWEEN keyword - people born in last decade of XX century*/
--SELECT * FROM person WHERE date_of_birth BETWEEN DATE '1990-01-01' AND DATE '1999-12-31' ORDER BY date_of_birth DESC;

/*  LIKE operator: _ single character, % any number of characters 
    its is case sensitive, use ILIKE for NOT case sensitive */
--SELECT * FROM person WHERE email LIKE '%tumblr.com';
--SELECT * FROM person WHERE email LIKE '%@google.%';
--SELECT DISTINCT country_of_birth FROM person WHERE country_of_birth ILIKE 'p%' ORDER BY country_of_birth;

/* GROUP BY keyword - group by column values */
-- see how many people are from each country
--SELECT country_of_birth, COUNT(id) as population FROM person GROUP BY country_of_birth ORDER BY population DESC;

/* GROUP BY HAVING, used with aggregate functions 
The HAVING clause is evaluated before the SELECT - so the server doesn't yet know about that alias*/
SELECT country_of_birth, COUNT(*) as population FROM person GROUP BY country_of_birth HAVING COUNT(*) >= 30 ORDER BY population DESC;

