-- COMPREHENSIVE CTE QUIZ

-- 1. Define a Common Table Expression in your own words.

/* CTE (common Table Experession) is a temporary, named result set that exists only for the duration of a single query
CTE (Common Table Expression) in SQL is a temporary result set that you create within a query
It is like creating a short-term table just for one query.
It is written using the keyword WITH before your main SELECT statement. */


--2. Write a CTE that calculates total revenue generated from the payment table.
WITH total_revenue AS (
    SELECT SUM(amount) AS revenue
    FROM payment
)
SELECT revenue
FROM total_revenue;

-- 3. Explain the difference between a subquery and a CTE.

/* 
A subquery is a query written inside another query. It runs as part of the main query.

*Usually used for small, one-off logic
*Can make queries harder to read if nested deeply
*The same subquery may be repeated multiple times
*Best for simple filtering or calculations 

A CTE is a named temporary result set defined using WITH. It exists only for the duration of the query.

*Improves readability and structure
*Can be reused multiple times in the same query
*Makes complex queries easier to debug
*Supports recursive queries (subqueries do not)
*Feels like creating a temporary table. 
*/

4. Write a multi-CTE query that identifies the top 10 films by rental count.

WITH film_inventory AS (
    SELECT 
        f.film_id,
        f.title,
        i.inventory_id
    FROM film f
    JOIN inventory i
        ON f.film_id = i.film_id
),

film_rentals AS (
    SELECT 
        fi.film_id,
        fi.title,
        COUNT(r.rental_id) AS rental_count
    FROM film_inventory fi
    JOIN rental r
        ON fi.inventory_id = r.inventory_id
    GROUP BY fi.film_id, fi.title
),

ranked_films AS (
    SELECT 
        film_id,
        title,
        rental_count,
        RANK() OVER (ORDER BY rental_count DESC) AS rental_rank
    FROM film_rentals
)

SELECT 
    title,
    rental_count
FROM ranked_films
WHERE rental_rank <= 10
ORDER BY rental_count DESC;

-- 5. Explain the concept of materialization in PostgreSQL CTEs.
/*
Materialization means that PostgreSQL executes the CTE first, Stores its result in a temporary, in-memory (or disk) structure, 
then runs the main query using that stored result, instead of re-planning or re-optimizing it
*/

-- 6. Write a recursive CTE that generates numbers from 1 to 10.

WITH RECURSIVE numbers AS (
    -- Anchor member: start at 1
    SELECT 1 AS num

    UNION ALL

    -- Recursive member: increment by 1
    SELECT num + 1
    FROM numbers
    WHERE num < 10
)
SELECT num
FROM numbers;

-- 7. Write a CTE that returns the top 5 highest-spending customers with first and last names.

WITH customer_spending AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        SUM(p.amount) AS total_spent
    FROM customer c
    JOIN payment p
        ON c.customer_id = p.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name
)

SELECT
    first_name,
    last_name,
    total_spent
FROM customer_spending
ORDER BY total_spent DESC
LIMIT 5;

-- 8. Create a CTE that calculates total rentals per store.
WITH store_rentals AS (
    SELECT
        s.store_id,
        COUNT(r.rental_id) AS total_rentals
    FROM store s
    JOIN inventory i
        ON s.store_id = i.store_id
    JOIN rental r
        ON i.inventory_id = r.inventory_id
    GROUP BY s.store_id
)

SELECT
    store_id,
    total_rentals
FROM store_rentals
ORDER BY store_id;

-- 9. Identify when it is inappropriate to use a CTE.
/*
CTEs should be avoided when they don’t improve readability or when they introduce unnecessary materialization that harms performance, 
especially in large or performance-critical queries.
* When performance is critical and the CTE is materialized unnecessarily
* When the logic is very simple and used only once
* When the CTE is only a stylistic replacement for a subquery
* When you need index usage inside the CTE result
* When the CTE is not reused
* When query planners need full freedom to optimize
* When the database doesn’t optimize CTEs well
*/

-- 10. Write a chained CTE query that calculates revenue per film category.

WITH film_categories AS (
    SELECT
        fc.film_id,
        c.category_id,
        c.name AS category_name
    FROM film_category fc
    JOIN category c
        ON fc.category_id = c.category_id
),

film_inventory AS (
    SELECT
        fcat.category_name,
        i.inventory_id
    FROM film_categories fcat
    JOIN inventory i
        ON fcat.film_id = i.film_id
),

category_revenue AS (
    SELECT
        fi.category_name,
        SUM(p.amount) AS total_revenue
    FROM film_inventory fi
    JOIN rental r
        ON fi.inventory_id = r.inventory_id
    JOIN payment p
        ON r.rental_id = p.rental_id
    GROUP BY fi.category_name
)
SELECT
    category_name,
    total_revenue
FROM category_revenue
ORDER BY total_revenue DESC;
