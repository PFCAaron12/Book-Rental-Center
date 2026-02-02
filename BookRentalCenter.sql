--Total number of patrons
SELECT 
	COUNT(patron_id) AS total_patrons
FROM patron_management;

--Total books currently in the system
SELECT 
	COUNT(*) AS total_current_books
FROM book_management;

--Total books in the system (past and present)
SELECT 
	COUNT(DISTINCT(title)) AS total_books
FROM book_issuance;

--Total books currently rented to patrons
SELECT
	COUNT(*) AS currently_rented
FROM book_management
WHERE status LIKE 'No';

--The number of books rented per patron in descending order
SELECT
	patron_id,
	COUNT(patron_id) AS rental_per_customer
FROM book_issuance
GROUP BY patron_id
ORDER BY rental_per_customer DESC;

--Number of books issued from each branch
SELECT
	e.branch_id,
	COUNT(bi.issue_id) AS book_count
FROM employee_management AS e
LEFT JOIN book_issuance AS bi
ON e.employee_id = bi.employee_id
GROUP BY e.branch_id

--Names of employees whose salary is greater than 60000
SELECT 
	employee_name,
	salary
FROM employee_management
WHERE salary::int > 60000;

