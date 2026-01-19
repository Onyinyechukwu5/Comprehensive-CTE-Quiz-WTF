# Comprehensive-CTE-Quiz-WTF

## Introduction

This project is a **comprehensive hands-on quiz on Common Table Expressions (CTEs)** using a DVD Rental–style database.
The goal was to strengthen my understanding of **CTE fundamentals, advanced usage, and performance considerations** by applying them to real-world business questions such as revenue analysis, customer spending, rentals per store, and category-level insights.

Through this exercise, I explored **basic CTEs, chained CTEs, recursive CTEs, window functions, and PostgreSQL-specific concepts like materialization**.

## Analysis Question

1. Define a Common Table Expression in your own words.
2. Write a CTE that calculates total revenue generated from the payment table.
3. Explain the difference between a subquery and a CTE.
4. Write a multi-CTE query that identifies the top 10 films by rental count.
5. Explain the concept of materialization in PostgreSQL CTEs.
6. Write a recursive CTE that generates numbers from 1 to 10.
7. Write a CTE that returns the top 5 highest-spending customers with first and last names.
8. Create a CTE that calculates total rentals per store.
9. Identify when it is inappropriate to use a CTE.
10. Write a chained CTE query that calculates revenue per film category
    
## Answers
<a href = >Answers< a/>
### Key analytical tasks covered include:

* **Revenue analysis** using aggregation (`SUM`) on the payment table
* **Customer analytics**, identifying top spenders with grouping and ordering
* **Operational insights**, such as total rentals per store
* **Popularity analysis**, ranking films by rental count using window functions
* **Category-level revenue breakdown**, using chained CTEs to transform data step by step
* **Recursive logic**, generating sequences without built-in helper functions
* **Performance awareness**, understanding when and why CTEs may hurt optimization

Each CTE was designed to:

* Isolate a single logical step
* Improve readability and maintainability
* Reflect real analytics workflows used in reporting and BI tools

## Key Take Away

This exercise reinforced several important SQL concepts:

* **CTEs improve readability**, especially in complex multi-step queries
* **Chained CTEs** make it easier to reason about transformations incrementally
* **Recursive CTEs** are powerful for hierarchical and iterative problems
* **Window functions** pair naturally with CTEs for ranking and analytics
* **CTEs are not always the best choice** — performance, reuse, and simplicity matter
* In PostgreSQL, **materialization can impact performance**, especially in large datasets

Most importantly, I learned that **writing correct SQL is not enough — writing optimized, readable SQL is the real goal**.

## Conclusion

This CTE quiz provided a strong practical foundation in both **theoretical understanding and real-world application** of Common Table Expressions.
It highlights how CTEs can be used effectively for analytics, reporting, and structured query design — while also emphasizing the importance of knowing **when not to use them**.

This project serves as a reusable reference for:

* SQL interviews
* Data analytics projects
* Business intelligence workflows
* PostgreSQL performance discussions





<a href= https://github.com/Onyinyechukwu5/Comprehensive-CTE-Quiz-WTF/blob/main/CTE%20QUIZ.sql>Answers</a>
