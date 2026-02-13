
INSERT INTO members (member_id, member_name, member_address, reg_date) VALUES
('C101', 'Md Tuhin Molla', 'Mirpur, Dhaka', '2021-05-15'),
('C102', 'Rakib Hasan', 'Uttara, Dhaka', '2021-06-20'),
('C103', 'Sadia Akter', 'Gazipur', '2021-07-10'),
('C104', 'Mahmudul Islam', 'Narayanganj', '2021-08-05'),
('C105', 'Nusrat Jahan', 'Dhanmondi, Dhaka', '2021-09-25'),
('C106', 'Shihab Ahmed', 'Chattogram', '2021-10-15'),
('C107', 'Farzana Rahman', 'Sylhet', '2021-11-20'),
('C108', 'Tanvir Hossain', 'Rajshahi', '2021-12-10'),
('C109', 'Ayesha Khatun', 'Khulna', '2022-01-05'),
('C110', 'Imran Kabir', 'Barishal', '2022-02-25'),
('C118', 'Sabbir Rahman', 'Cumilla', '2024-06-01'),
('C119', 'Rifat Chowdhury', 'Cox’s Bazar', '2024-05-01');
SELECT * FROM members;


-- Insert values into each branch table
INSERT INTO branch (branch_id, manager_id, branch_address, contact_no) VALUES
('B001', 'E109', 'Motijheel, Dhaka', '+8801711111111'),
('B002', 'E109', 'Uttara, Dhaka', '+8801722222222'),
('B003', 'E109', 'Chattogram City', '+8801733333333'),
('B004', 'E110', 'Rajshahi City', '+8801744444444'),
('B005', 'E110', 'Khulna City', '+8801755555555');
SELECT * FROM branch;


-- Insert values into each employees table
INSERT INTO employees (emp_id, emp_name, position, salary, branch_id) VALUES
('E101', 'Abdul Karim', 'Clerk', 35000.00, 'B001'),
('E102', 'Mizanur Rahman', 'Clerk', 32000.00, 'B002'),
('E103', 'Salma Akter', 'Librarian', 45000.00, 'B001'),
('E104', 'Arif Hossain', 'Assistant', 30000.00, 'B001'),
('E105', 'Nabila Sultana', 'Assistant', 31000.00, 'B001'),
('E106', 'Hasan Mahmud', 'Assistant', 32000.00, 'B001'),
('E107', 'Sajid Ahmed', 'Clerk', 36000.00, 'B005'),
('E108', 'Sharmin Jahan', 'Clerk', 33000.00, 'B004'),
('E109', 'Rashed Chowdhury', 'Manager', 60000.00, 'B003'),
('E110', 'Tahmina Akter', 'Manager', 58000.00, 'B005'),
('E111', 'Nazmul Islam', 'Assistant', 34000.00, 'B005');
SELECT * FROM employees;


-- Inserting into books table 
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');
SELECT * FROM books;


-- inserting into issued table
INSERT INTO issued_status
(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id)
VALUES
('IS101', 'C101', 'Moby Dick', '2023-06-01', '978-0-451-52994-2', 'E101'),
('IS103', 'C103', 'Dune', '2023-08-01', '978-0-345-39180-3', 'E103'),
('IS105', 'C105', 'Fahrenheit 451', '2023-06-05', '978-0-451-52993-5', 'E102'),
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107');


-- inserting into return table
INSERT INTO return_status (return_id, issued_id, return_date) VALUES
('RS101', 'IS101', '2023-06-06'),
('RS102', 'IS105', '2023-06-07'),
('RS103', 'IS103', '2023-08-07'),
('RS104', 'IS106', '2024-05-01'),
('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19');
SELECT * FROM issued_status;

