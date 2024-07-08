-- Create the database
CREATE DATABASE library;

-- Use the database
USE library;

-- Create Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
);
desc Branch;

-- Create Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
desc Employee;

-- Create Books table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);
desc Books;

-- Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);
desc Customer;

-- Create IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
desc IssueStatus;

-- Create ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
desc ReturnStatus;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Library St, CityA', '123-456-7890'),
(2, 102, '456 Knowledge Blvd, CityB', '234-567-8901'),
(3, 103, '789 Book Ln, CityC', '345-678-9012');
select * from Branch;


INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'John Doe', 'Manager', 75000, 1),
(102, 'Jane Smith', 'Manager', 72000, 2),
(103, 'Emily Johnson', 'Manager', 70000, 3),
(104, 'Michael Brown', 'Assistant', 50000, 1),
(105, 'Jessica Davis', 'Assistant', 48000, 2),
(106, 'David Wilson', 'Assistant', 46000, 3),
(107, 'Sarah Miller', 'Clerk', 40000, 1),
(108, 'Robert Moore', 'Clerk', 42000, 2),
(109, 'James Taylor', 'Clerk', 43000, 3);
select * from Employee;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 30.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-14-118280-3', '1984', 'Dystopian', 25.00, 'no', 'George Orwell', 'Penguin'),
('978-0-452-28423-4', 'To Kill a Mockingbird', 'Fiction', 28.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-7432-7356-5', 'The Da Vinci Code', 'Thriller', 35.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-394-52340-9', 'The Catcher in the Rye', 'Fiction', 32.00, 'no', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-06-112008-4', 'Brave New World', 'Dystopian', 30.00, 'yes', 'Aldous Huxley', 'Harper & Brothers'),
('978-0-517-88936-0', 'Moby Dick', 'Adventure', 40.00, 'no', 'Herman Melville', 'Harper & Brothers');
select* from Books;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(201, 'Alice Walker', '123 Apple St, CityA', '2020-12-15'),
(202, 'Bob Harris', '456 Orange Blvd, CityB', '2021-05-22'),
(203, 'Charlie Brown', '789 Banana Ln, CityC', '2023-03-10'),
(204, 'Diana Prince', '101 Grape Ave, CityA', '2022-11-30'),
(205, 'Edward Cullen', '202 Lemon Dr, CityB', '2023-06-15');
select* from Customer;



INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(301, 201, 'The Great Gatsby', '2023-06-10', '978-3-16-148410-0'),
(302, 202, '1984', '2023-05-05', '978-0-14-118280-3'),
(303, 203, 'To Kill a Mockingbird', '2023-06-25', '978-0-452-28423-4'),
(304, 204, 'The Da Vinci Code', '2023-06-20', '978-0-7432-7356-5');
select* from IssueStatus;


-- Adding more employees to Branch 1
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(110, 'Alice Johnson', 'Assistant', 45000, 1),
(111, 'Bob Martin', 'Clerk', 38000, 1),
(112, 'Carol White', 'Assistant', 47000, 1);

-- Adding more employees to Branch 2
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(113, 'Daniel Harris', 'Clerk', 39000, 2),
(114, 'Eve Clark', 'Assistant', 48000, 2),
(115, 'Frank Lewis', 'Clerk', 42000, 2);



INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(401, 201, 'The Great Gatsby', '2023-06-30', '978-3-16-148410-0'),
(402, 202, '1984', '2023-05-20', '978-0-14-118280-3'),
(403, 203, 'To Kill a Mockingbird', '2023-07-01', '978-0-452-28423-4');

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-0-123-45678-9', 'A Brief History of Time', 'Science', 50.00, 'yes', 'Stephen Hawking', 'Bantam Books'),
('978-0-987-65432-1', 'History of the World', 'History', 60.00, 'yes', 'J.M. Roberts', 'Oxford University Press'),
('978-0-111-22233-4', 'The History of Ancient Rome', 'History', 45.00, 'yes', 'Mary Beard', 'Penguin');


-- Retrieve the book title, category, and rental price of all available books
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';


-- List the employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;


-- Retrieve the book titles and the corresponding customers who have issued those books
SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- Display the total count of books in each category
SELECT Category, COUNT(*) AS Total_Count
FROM Books
GROUP BY Category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;


-- List the customer names who registered before 2022-01-01 and have not issued any books yet
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01' 
  AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);
  
  -- Display the branch numbers and the total count of employees in each branch
  SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;


-- Display the names of customers who have issued books in the month of June 2023
SELECT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Retrieve book_title from book table containing history
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- Retrieve the names of employees who manage branches and their respective branch addresses
SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;


-- Display the names of customers who have issued books with a rental price higher than Rs. 25
SELECT DISTINCT Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE Books.Rental_Price > 25;














