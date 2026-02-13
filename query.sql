-- Task 1. Create a New Book Record-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
INSERT INTO books (isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

-- Task 2: Update an Existing Member's Address
UPDATE members
SET member_address = 'Banani, Dhaka'
WHERE member_id = 'C101';


-- Task 3: Delete a Record from the Issued Status Table-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.
DELETE FROM issued_status
WHERE issued_id = 'IS104';

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Retrieve all issued book records processed by the employee with emp_id = 'E101'
SELECT * 
FROM issued_status
WHERE issued_emp_id = 'E101'
-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.
SELECT issued_emp_id, COUNT(*)
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(*) > 1;

select * from issued_status;

-- ### 3. CTAS (Create Table As Select)
-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
CREATE TABLE book_issued_cnt AS 
SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS issue_count
FROM issued_status as ist
JOIN books as b
ON ist.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;

-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:
SELECT *
FROM books
WHERE category = 'Classic';

-- Task 8: Find Total Rental Income by Category
-- Objective: Calculate the total rental income generated for each book category based on issued books
SELECT 
	b.category, 
	SUM(b.rental_price), 
	COUNT(*)
FROM issued_status AS ist 
JOIN 
books AS b
ON b.isbn = ist.issued_book_isbn
GROUP BY 1

-- Task 9: List Members Who Registered in the Last 180 Days
-- Objective: Retrieve members whose reg_date
-- falls within the last 180 days from the current date
SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days';

-- Task 10: List Employees with Their Branch Manager and Branch Details
-- Objective: Display employee name, position,
-- branch address, branch contact number and branch manager name
SELECT 
	e.emp_name, 
	e.position, 
	b.branch_address, 
	b.contact_no, 
	e2.emp_name
FROM 
employees AS e
JOIN
branch as b
ON e.branch_id = b.branch_id
JOIN
employees AS e2
ON e2.emp_id = b.manager_id
-- Task 11: Create a Table of Books with High Rental Price
-- Objective: Create a new table using CTAS
-- that contains books with rental_price above a given threshold(e.g., rental_price > 7.00)
CREATE TABLE expensive_books AS
SELECT * FROM books
WHERE rental_price > 7.00;

-- Task 12: Retrieve the List of Books Not Yet Returned
-- Objective: Find all books that have been issued but do not have a corresponding return record
SELECT 
    i.issued_id,
    i.issued_book_name,
    i.issued_date,
    i.issued_member_id
FROM issued_status AS i
LEFT JOIN return_status AS r
ON i.issued_id = r.issued_id
WHERE r.issued_id IS NULL;

/*
### Advanced SQL Operations

Task 13: Identify Members with Overdue Books
Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's name, book title, issue date, and days overdue.


Task 14: Update Book Status on Return
Write a query to update the status of books in the books table to "available" when they are returned (based on entries in the return_status table).



Task 15: Branch Performance Report
Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.


Task 16: CTAS: Create a Table of Active Members
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 6 months.



Task 17: Find Employees with the Most Book Issues Processed
Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.


Task 18: Identify Members Issuing High-Risk Books
Write a query to identify members who have issued books more than twice with the status "damaged" in the books table. Display the member name, book title, and the number of times they've issued damaged books.    


Task 19: Stored Procedure
Objective: Create a stored procedure to manage the status of books in a library system.
    Description: Write a stored procedure that updates the status of a book based on its issuance or return. Specifically:
    If a book is issued, the status should change to 'no'.
    If a book is returned, the status should change to 'yes'.

Task 20: Create Table As Select (CTAS)
Objective: Create a CTAS (Create Table As Select) query to identify overdue books and calculate fines.

Description: Write a CTAS query to create a new table that lists each member and the books they have issued but not returned within 30 days. The table should include:
    The number of overdue books.
    The total fines, with each day's fine calculated at $0.50.
    The number of books issued by each member.
    The resulting table should show:
    Member ID
    Number of overdue books
    Total fines
*/