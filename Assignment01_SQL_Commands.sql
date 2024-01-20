use mavenmovies;

-- Q 1. Identify the primary keys and foreign keys in maven movies db. Discuss the differences
SELECT * FROM information_schema.key_column_usage WHERE constraint_name = 'PRIMARY' AND table_schema = 'mavenmovies';
SELECT * FROM information_schema.key_column_usage WHERE constraint_name != 'PRIMARY' AND table_schema = 'mavenmovies';

-- Difference between Primary key and foreign key
/* 
Primary Key --> 
- It represents a column with unique values which repersent the whole row
- There is a only one primary key in a table.
- Primary key can not be a NULL value.
- It's value can not be deleted from parent table.
- Primary key repersent the all data of row 
----------------------------------------------------------------

Foreign Key -->
- For most of the time foreign key is primary key of another table.
- Foreign key is column which provides link between data of two tables.
- Foriegn key is used to make to connect two tables easily.
- It allows duplicate values.
- It can contain NULL values.
*/

-- Q 2. List all details of actors
SELECT *FROM actor;

-- Q 3. List all customer information from DB. 
SELECT *FROM customer;

-- Q 4. List different countries. 
SELECT DISTINCT country FROM country;

-- Q 5.  Display all active customers. 
select *from customer where active = 1;

-- Q 6.  List of all rental IDs for customer with ID 1. 
SELECT rental_id FROM rental where customer_id = 1;

-- Q 7. Display all the films whose rental duration is greater than 5 . 
SELECT *FROM film where rental_duration > 5;

-- Q 8. List the total number of films whose replacement cost is greater than $15 and less than$20. 
SELECT *FROM film where replacement_cost > 15 and replacement_cost < 20;
SELECT count(*) as total_films FROM film where replacement_cost > 15 and replacement_cost < 20;

-- Q 9. Display the count of unique first names of actors. 
SELECT COUNT(distinct(first_name)) as first_names FROM actor;

-- Q 10.  Display the first 10 records from the customer table . 
SELECT *FROM customer limit 10;

-- Q 11.  Display the first 3 records from the customer table whose first name starts with ‘b’. 
SELECT *FROM customer  WHERE first_name like 'b%' limit 3;

-- Q 12. Display the names of the first 5 movies which are rated as ‘G’. 
SELECT title , rating FROM film WHERE  rating ='G' limit 5;

-- Q 13. Find all customers whose first name starts with "a".
SELECT first_name FROM customer WHERE first_name like 'a%'; 

-- Q 14.  Find all customers whose first name ends with "a". 
SELECT first_name FROM customer WHERE first_name like '%a';

-- Q 15.  Display the list of first 4 cities which start and end with ‘a’ . 
SELECT city FROM city WHERE city like 'a%a' limit 4;

-- Q 16.  Find all customers whose first name have "NI" in any position. 
SELECT first_name FROM customer WHERE first_name like '%NI%';

-- Q 17.  Find all customers whose first name have "r" in the second position .
SELECT first_name FROM customer WHERE first_name like '_r%';

/* 18.  Find all customers whose first name starts with "a" and are 
at least 5 characters in length. */ 
SELECT first_name FROM customer WHERE first_name like 'a%' and length(first_name) >= 5;

-- Q 19.  Find all customers whose first name starts with "a" and ends with "o". 
SELECT *FROM customer WHERE first_name like 'a%o';

-- Q 20.  Get the films with pg and pg-13 rating using IN operator. 
SELECT title, rating FROM film WHERE rating IN ('PG', 'PG-13');

-- Q 21.  Get the films with length between 50 to 100 using between operator. 
SELECT title, length FROM film WHERE length between 50 and 100;

-- Q 22. Get the top 50 actors using limit operator. 
SELECT *FROM actor limit 50;

-- Q 23.  Get the distinct film ids from inventory table. 
SELECT distinct film_id FROM inventory;