# Library Management System using SQL Project

## Project Overview

**Project Title**: Library Management System  
**Database**: `library_management`

This project presents the development of a **Library Management System** using SQL. It focuses on designing and maintaining database tables, handling full CRUD operations, and applying advanced SQL queries. The objective is to demonstrate proficiency in database modeling, data management, and efficient query execution.

[![Library_project](https://i.postimg.cc/gcvGg1M4/library.jpg)](https://postimg.cc/K48Xzphg)

## Objectives

1. **Set up the Library Management System Database**: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
2. **CRUD Operations**: Perform Create, Read, Update, and Delete operations on the data.
3. **CTAS (Create Table As Select)**: Utilize CTAS to create new tables based on query results.
4. **Advanced SQL Queries**: Develop complex queries to analyze and retrieve specific data.

## Project Structure

### 1. Database Setup
[![ERD](https://i.postimg.cc/zG3ZYQjJ/erdiagram.png)](https://postimg.cc/RWrbcXy8)

- **Database Creation**: Created a database named `library_db`.
- **Table Creation**: Created tables for branches, employees, members, books, issued status, and return status. Each table includes relevant columns and relationships.

```sql
-- Library Management System

-- Create Database
CREATE DATABASE library_management;

-- Creating branch table
DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
	branch_id VARCHAR(10) PRIMARY KEY,
	manager_id VARCHAR(10),
	branch_address VARCHAR(50),
	contact_no VARCHAR(15)
);

-- Creating employees table
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	emp_id VARCHAR(10) PRIMARY KEY,
	emp_name VARCHAR(25),
	position VARCHAR(30),
	salary INT,
	branch_id VARCHAR(10),
    CONSTRAINT fk_branch
        FOREIGN KEY (branch_id)
        REFERENCES branch(branch_id)
);

-- Creating books table
DROP TABLE IF EXISTS books;
CREATE TABLE books (
	isbn VARCHAR(50) PRIMARY KEY,
	book_title VARCHAR(80),
	category VARCHAR(30),
	rental_price DECIMAL(10,2),
	status VARCHAR(10),
	author VARCHAR(30),
	publisher VARCHAR(30)
);

-- Creating members table
DROP TABLE IF EXISTS members;
CREATE TABLE members (
	member_id VARCHAR(30) PRIMARY KEY,
	member_name VARCHAR(30),
	member_address VARCHAR(50),
	reg_date DATE
);

-- Creating issued_status table
DROP TABLE IF EXISTS issued_status;
CREATE TABLE issued_status (
	issued_id VARCHAR(30) PRIMARY KEY,
	issued_member_id VARCHAR(30),
	issued_book_name VARCHAR(80),
	issued_date DATE,
	issued_book_isbn VARCHAR(50),
	issued_emp_id VARCHAR(10),
	FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
	FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
	FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn) 
);

-- Creating return_status table
DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
(
	return_id VARCHAR(10) PRIMARY KEY,
	issued_id VARCHAR(30),
	return_book_name VARCHAR(80),
	return_date DATE,
	return_book_isbn VARCHAR(50),
	FOREIGN KEY (issued_id) REFERENCES issued_status(issued_id),
	FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);
```

### 2. CRUD Operations

- **Create**: Inserted sample records into the `books` table.
- **Read**: Retrieved and displayed data from various tables.
- **Update**: Updated records in the `employees` table.
- **Delete**: Removed records from the `members` table as needed.

Q1. **Create a New Book Record-- "('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"**
```sql
INSERT INTO books (isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
```

Q2: **Update an Existing Member's Address**
```sql
UPDATE members
SET member_address = 'Banani, Dhaka'
WHERE member_id = 'C101';
```


Q3: **Delete a Record from the Issued Status Table-- Delete the record with issued_id = 'IS104' from the issued_status table.**
```sql
DELETE FROM issued_status
WHERE issued_id = 'IS104';
```

Q4: **Retrieve All Books Issued by a Specific Employee-- Retrieve all issued book records processed by the employee with emp_id = 'E101'**
```sql
SELECT * 
FROM issued_status
WHERE issued_emp_id = 'E101';
```

Q5: **List Members Who Have Issued More Than One Book-- Use GROUP BY to find members who have issued more than one book.**
```sql
SELECT issued_emp_id, COUNT(*)
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(*) > 1;
```

### 3. CTAS (Create Table As Select)
Q6: **Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**
```sql
CREATE TABLE book_issued_cnt AS 
SELECT b.isbn, b.book_title, COUNT(ist.issued_id) AS issue_count
FROM issued_status as ist
JOIN books as b
ON ist.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;
```

### 4. Data Analysis & Findings

Q7. **Retrieve All Books in a Specific Category**
```sql
SELECT *
FROM books
WHERE category = 'Classic';
```

Q8: **Find Total Rental Income by Category-- Calculate the total rental income generated for each book category based on issued books**
```sql
SELECT 
	b.category, 
	SUM(b.rental_price), 
	COUNT(*)
FROM issued_status AS ist 
JOIN 
books AS b
ON b.isbn = ist.issued_book_isbn
GROUP BY 1
```

Q9: **List Members Who Registered in the Last 180 Days-- Retrieve members whose reg_date falls within the last 180 days from the current date**
```sql
SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL '180 days';
```

Q10: **List Employees with Their Branch Manager and Branch Details-- Display employee name, position, branch address, branch contact number and branch manager name**
```sql
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
```

Q11: **Create a Table of Books with High Rental Price-- Create a new table using CTAS that contains books with rental_price above a given threshold(e.g., rental_price > 7.00)**
```sql
CREATE TABLE expensive_books AS
SELECT * FROM books
WHERE rental_price > 7.00;
```

Q12: **Retrieve the List of Books Not Yet Returned-- Find all books that have been issued but do not have a corresponding return record**
```sql
SELECT 
    i.issued_id,
    i.issued_book_name,
    i.issued_date,
    i.issued_member_id
FROM issued_status AS i
LEFT JOIN 
return_status AS r
ON i.issued_id = r.issued_id
WHERE r.issued_id IS NULL;
```

### 5. Advanced SQL Operations

Q13: **Identify Members with Overdue Books-- Write a query to identify members who have overdue books (assume a 30-day return period). Display the member's name, book title, issue date, and days overdue.**
```sql
SELECT 
	i.issued_member_id,
	m.member_name,
	b.book_title,
	i.issued_date,
	CURRENT_DATE - i.issued_date as overdue
FROM
	issued_status AS i
JOIN
	members AS m
ON i.issued_member_id = m.member_id
JOIN
	books AS b
ON b.isbn = i.issued_book_isbn
LEFT JOIN 
	return_status AS r
ON r.issued_id = i.issued_id
WHERE
	return_date IS NULL
	AND
	(CURRENT_DATE - i.issued_date) > 30
ORDER BY 1;
```

Q14: **Update Book Status on Return-- Update the books table Set status = 'yes' when a book has been returned based on return_status table entries**
```sql

CREATE OR REPLACE PROCEDURE add_return_records(p_return_id VARCHAR(10), p_issued_id VARCHAR(10), p_book_quality VARCHAR(10))
LANGUAGE plpgsql
AS $$

DECLARE
    v_isbn VARCHAR(50);
    v_book_name VARCHAR(80);
    
BEGIN
    -- inserting into returns based on users input
    INSERT INTO return_status(return_id, issued_id, return_date, book_quality)
    VALUES
    (p_return_id, p_issued_id, CURRENT_DATE, p_book_quality);

    SELECT 
        issued_book_isbn,
        issued_book_name
        INTO
        v_isbn,
        v_book_name
    FROM issued_status
    WHERE issued_id = p_issued_id;

    UPDATE books
    SET status = 'yes'
    WHERE isbn = v_isbn;

    RAISE NOTICE 'Thank you for returning the book: %', v_book_name;
    
END;
$$


-- Testing FUNCTION add_return_records

issued_id = IS135
ISBN = WHERE isbn = '978-0-307-58837-1'

SELECT * FROM books
WHERE isbn = '978-0-307-58837-1';

SELECT * FROM issued_status
WHERE issued_book_isbn = '978-0-307-58837-1';

SELECT * FROM return_status
WHERE issued_id = 'IS135';

-- calling function 
CALL add_return_records('RS138', 'IS135', 'Good');

-- calling function 
CALL add_return_records('RS148', 'IS140', 'Good');
```

Q15: **Branch Performance Report-- Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.**
```sql
CREATE TABLE branch_reports
AS
SELECT 
    b.branch_id,
    b.manager_id,
    COUNT(ist.issued_id) as number_book_issued,
    COUNT(rs.return_id) as number_of_book_return,
    SUM(bk.rental_price) as total_revenue
FROM issued_status as ist
JOIN 
employees as e
ON e.emp_id = ist.issued_emp_id
JOIN
branch as b
ON e.branch_id = b.branch_id
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
JOIN 
books as bk
ON ist.issued_book_isbn = bk.isbn
GROUP BY 1, 2;

SELECT * FROM branch_reports;
```

Q16: **CTAS: Create a Table of Active Members Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 6 months.**
```sql

CREATE TABLE active_members
AS
SELECT * FROM members
WHERE member_id IN (SELECT 
                        DISTINCT issued_member_id   
                    FROM issued_status
                    WHERE 
                        issued_date >= CURRENT_DATE - INTERVAL '2 month'
                    )
;

SELECT * FROM active_members;
```

Q17: **Find Employees with the Most Book Issues Processed-- Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.**
```sql
SELECT 
    e.emp_name,
    b.*,
    COUNT(ist.issued_id) as no_book_issued
FROM issued_status as ist
JOIN
employees as e
ON e.emp_id = ist.issued_emp_id
JOIN
branch as b
ON e.branch_id = b.branch_id
GROUP BY 1, 2;
```

## Reports

- **Database Schema**: Comprehensive table structures including `branch`, `employees`, `members`, `books`, `issued_status`, and `return_status` with properly defined primary keys, foreign keys, and relationships ensuring data integrity.
- **Data Analysis**: Key insights derived from the system:
  - Book rental trends across different categories (Classic, Literary Fiction, etc.)
  - Employee performance metrics based on book issue processing
  - Member registration patterns and activity levels
  - Overdue book tracking and return rate analysis
  - Branch-wise performance reports including revenue generation
- **Summary Reports**: Aggregated data providing actionable insights:
  - High-demand books identified through issue count analysis
  - Active members who issued books in recent months
  - Branch performance reports showing books issued, returned, and total revenue
  - Top-performing employees based on number of books processed
  - Revenue analysis by book category

## Conclusion

This project demonstrates the application of SQL skills in creating and managing a comprehensive Library Management System. It showcases expertise in database design, implementing complex relationships, performing CRUD operations, and executing advanced SQL queries including joins, subqueries, stored procedures, and CTAS operations. The system effectively addresses real-world library management challenges such as tracking book inventory, managing member records, processing book issues and returns, identifying overdue books, and generating performance reports. This project provides a solid foundation for database management, data analysis, and business intelligence in the library domain.

## Author - Md Tuhin Molla

This project is part of my portfolio, demonstrating my SQL skills in database design, data management, and business intelligence. If you have any questions or would like to connect, feel free to reach out!

- **LinkedIn**: [Md Tuhin Molla](https://www.linkedin.com/in/md-tuhin-molla)
- **GitHub**: [Md Tuhin Molla](https://github.com/tuhin1522)

## How to Run the Project

1. **Install PostgreSQL**: Download and install PostgreSQL from [postgresql.org](https://www.postgresql.org/download/).

2. **Set Up the Database**: Open pgAdmin 4 and create a new database named `library_management`.

3. **Create Tables**: Execute `library_management.sql` in the Query Tool to create all necessary tables.

4. **Insert Sample Data**: Execute `insert_data.sql` to populate the tables with sample data.

5. **Run Analysis**: Execute queries from `query.sql` to perform CRUD operations and generate insights across 17 different tasks.

6. **Test Stored Procedures**: Use the `add_return_records` procedure to process book returns and update book status automatically.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.