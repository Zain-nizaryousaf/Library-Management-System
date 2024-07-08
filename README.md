# Library-Management-System
Overview
The Library Management System is designed to manage the operations of a library, keeping track of all information about books, their cost, status, and availability. The system also maintains records of branches, employees, customers, and the status of issued and returned books. This system is built using SQL for efficient database management.

Database Schema
The database consists of six primary tables:

Branch: Stores information about library branches.

Branch_no: A unique identifier for the branch (Primary Key).
Manager_Id: ID of the branch manager.
Branch_address: The physical address of the branch.
Contact_no: Contact number for the branch.
Employee: Stores information about employees working in the library.

Emp_Id: A unique identifier for the employee (Primary Key).
Emp_name: Name of the employee.
Position: Job position of the employee.
Salary: Salary of the employee.
Branch_no: References the branch number the employee is assigned to (Foreign Key).
Books: Stores information about books available in the library.

ISBN: International Standard Book Number, a unique identifier for books (Primary Key).
Book_title: Title of the book.
Category: Genre or category of the book.
Rental_Price: Price to rent the book.
Status: Availability status of the book ('yes' for available, 'no' for not available).
Author: Author of the book.
Publisher: Publisher of the book.
Customer: Stores information about library customers.

Customer_Id: A unique identifier for the customer (Primary Key).
Customer_name: Name of the customer.
Customer_address: Address of the customer.
Reg_date: Registration date of the customer.
IssueStatus: Tracks the status of issued books.

Issue_Id: A unique identifier for each issued book record (Primary Key).
Issued_cust: ID of the customer who issued the book (Foreign Key referencing Customer_Id).
Issued_book_name: Name of the issued book.
Issue_date: Date the book was issued.
Isbn_book: ISBN of the issued book (Foreign Key referencing ISBN).
ReturnStatus: Tracks the status of returned books.

Return_Id: A unique identifier for each returned book record (Primary Key).
Return_cust: ID of the customer who returned the book.
Return_book_name: Name of the returned book.
Return_date: Date the book was returned.
Isbn_book2: ISBN of the returned book (Foreign Key referencing ISBN).
SQL Queries
The following SQL queries are designed to manage and retrieve data from the system:

Retrieve the book title, category, and rental price of all available books:
This query fetches the titles, categories, and rental prices of books that are currently available in the library.

List the employee names and their respective salaries in descending order of salary:
This query lists the names of employees along with their salaries, sorted from highest to lowest salary.

Retrieve the book titles and the corresponding customers who have issued those books:
This query provides a list of book titles and the names of customers who have issued those books.

Display the total count of books in each category:
This query counts the number of books available in each category.

Retrieve the employee names and their positions for the employees whose salaries are above Rs. 50,000:
This query lists the names and job positions of employees earning more than Rs. 50,000.

List the customer names who registered before 2022-01-01 and have not issued any books yet:
This query identifies customers who registered before January 1, 2022, and have not issued any books.

Display the branch numbers and the total count of employees in each branch:
This query shows the number of employees working in each branch.

Display the names of customers who have issued books in the month of June 2023:
This query lists the names of customers who issued books in June 2023.

Retrieve book titles containing "history":
This query finds all book titles that contain the word "history".

Retrieve the branch numbers along with the count of employees for branches having more than 5 employees:
This query shows branch numbers and the number of employees for branches that have more than 5 employees.

Retrieve the names of employees who manage branches and their respective branch addresses:
This query lists the names of employees who are branch managers and their respective branch addresses.

Display the names of customers who have issued books with a rental price higher than Rs. 25:
This query lists the names of customers who have issued books with a rental price greater than Rs. 25.

# How to Use
Set Up the Database:

# Create a new database named library.
Use the provided schema to create the necessary tables.
Insert Sample Data:

# Populate the tables with sample data to test the system.
Run SQL Queries:

Use the provided queries to retrieve and manage data as needed.

# Conclusion
The Library Management System is a robust tool for managing library operations, tracking book availability, and maintaining detailed records of employees and customers. By utilizing SQL for data management, the system ensures efficient and accurate handling of library information.
