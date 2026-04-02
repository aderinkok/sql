/*
JOIN Examples

Before running these queries, execute the db_okul.sql file from GitHub
and make sure the queries are executed in the Db_okul database.
*/

USE Db_okul;
GO

/*
1. List all columns by joining the ogretmen table (alias: o)
   and the bolum table (alias: b), returning only matching records
   from both tables.

2. Join ogretmen (o) and bolum (b) so that all records from bolum
   are listed, while only matching records from ogretmen are included.

3. Join ogretmen (o) and bolum (b) so that all records from ogretmen
   are listed, while only matching records from bolum are included.

4. Join ogretmen (o) and bolum (b) and list all records whether
   they match or not (full join).

!!! IMPORTANT !!!
Carefully review the SQL queries and their outputs for questions 1–4
to fully understand how different JOIN types behave.

5. Using the tables:
   ders (alias: d)
   bolum (alias: b)
   ders_bolum (alias: db)

   List the columns:
   - ders_adi from the ders table
   - bolum_adi from the bolum table

   using INNER JOIN operations.
*/


/* ===================== ANSWERS ===================== */

-- 1. INNER JOIN (only matching records from both tables)

SELECT *
FROM ogretmen o
INNER JOIN bolum b
ON o.bolum_id = b.id;


-- 2. RIGHT JOIN (all records from bolum, matching from ogretmen)

SELECT *
FROM ogretmen o
RIGHT JOIN bolum b
ON o.bolum_id = b.id;

-- Equivalent query using LEFT JOIN

SELECT *
FROM bolum b
LEFT JOIN ogretmen o
ON b.id = o.bolum_id;


-- 3. LEFT JOIN (all records from ogretmen, matching from bolum)

SELECT *
FROM ogretmen o
LEFT JOIN bolum b
ON o.bolum_id = b.id;

-- Equivalent query using RIGHT JOIN

SELECT *
FROM bolum b
RIGHT JOIN ogretmen o
ON o.bolum_id = b.id;


-- 4. FULL JOIN (all matching and non-matching records)

SELECT *
FROM ogretmen o
FULL JOIN bolum b
ON o.bolum_id = b.id;


-- 5. INNER JOIN across three tables

SELECT
    d.ders_adi,
    b.bolum_adi
FROM ders d
INNER JOIN ders_bolum db
    ON d.id = db.ders_id
INNER JOIN bolum b
    ON b.id = db.bolum_id;
