CREATE DATABASE LibraryManagementSystem;
USE LibraryManagementSystem;

CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(100) NOT NULL,
    address VARCHAR(200),
    phone VARCHAR(20),
    email VARCHAR(100),
    established_year INT
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    author_id INT,
    publisher_id INT,
    category_id INT,
    publication_year INT,
    pages INT,
    price DECIMAL(10,2),
    copies_available INT DEFAULT 0,
    total_copies INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(200),
    membership_date DATE,
    membership_type ENUM('Student', 'Faculty', 'Public') DEFAULT 'Public',
    status ENUM('Active', 'Inactive', 'Suspended') DEFAULT 'Active'
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    hire_date DATE,
    salary DECIMAL(10,2)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    staff_id INT,
    issue_date DATE,
    due_date DATE,
    return_date DATE NULL,
    fine_amount DECIMAL(8,2) DEFAULT 0.00,
    status ENUM('Issued', 'Returned', 'Overdue') DEFAULT 'Issued',
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

INSERT INTO Authors (first_name, last_name, birth_year, nationality, email) VALUES
('Allama', 'Iqbal', 1877, 'Pakistani', 'allama.iqbal@gmail.com'),
('Faiz', 'Ahmad', 1911, 'Pakistani', 'faiz.ahmad@yahoo.com'),
('Ashfaq', 'Ahmed', 1925, 'Pakistani', 'ashfaq.ahmed@hotmail.com'),
('Bano', 'Qudsia', 1928, 'Pakistani', 'bano.qudsia@gmail.com'),
('Naseem', 'Hijazi', 1914, 'Pakistani', 'naseem.hijazi@yahoo.com'),
('Mumtaz', 'Mufti', 1905, 'Pakistani', 'mumtaz.mufti@gmail.com'),
('Ahmad', 'Nadeem', 1916, 'Pakistani', 'ahmad.nadeem@hotmail.com'),
('Qurratulain', 'Hyder', 1927, 'Pakistani', 'qurratulain.hyder@gmail.com');

INSERT INTO Publishers (publisher_name, address, phone, email, established_year) VALUES
('Sang-e-Meel Publications', 'Lower Mall, Lahore, Punjab', '+92-42-37220100', 'info@sang-e-meel.com', 1960),
('Oxford University Press Pakistan', 'No. 38, Sector 15, Korangi Industrial Area, Karachi', '+92-21-35090300', 'enquiry@oup.com.pk', 1951),
('Maktaba Jamal', 'Urdu Bazaar, Lahore, Punjab', '+92-42-37630145', 'info@maktabajamal.com', 1945),
('Ferozsons Publishers', 'Feroz Palace, 60 Shahrah-e-Quaid-e-Azam, Lahore', '+92-42-37220081', 'info@ferozsons.com.pk', 1894),
('National Book Foundation', 'Bird Wood Road, Karachi, Sindh', '+92-21-99213143', 'info@nbf.gov.pk', 1972),
('Caravan Book House', 'Saddar, Lahore, Punjab', '+92-42-37320652', 'caravan@caravanbooks.com', 1955),
('Al-Faisal Nashiran', 'Shah Alam Market, Lahore, Punjab', '+92-42-37354287', 'alfaisal@publishers.pk', 1968),
('Liberty Books', 'Liberty Market, Gulberg III, Lahore', '+92-42-35758784', 'info@libertybooks.com', 1970);

INSERT INTO Categories (category_name, description) VALUES
('Fiction', 'Literary works of imaginative narration'),
('Mystery', 'Books involving puzzles, crimes, and detective work'),
('Science Fiction', 'Fiction dealing with futuristic concepts and technology'),
('Romance', 'Fiction focusing on romantic relationships'),
('Horror', 'Fiction intended to frighten, unsettle, or create suspense'),
('Fantasy', 'Fiction involving magical or supernatural elements'),
('Biography', 'Account of someone\'s life written by someone else'),
('History', 'Books about past events and civilizations'),
('Science', 'Books about natural sciences and scientific methods');

INSERT INTO Books (title, isbn, author_id, publisher_id, category_id, publication_year, pages, price, copies_available, total_copies) VALUES
('Bang-e-Dra', '978-969-35-0001-1', 1, 1, 7, 1908, 328, 850.00, 5, 8),
('Naqsh-e-Faryadi', '978-969-35-0002-8', 2, 2, 1, 1941, 112, 650.00, 3, 5),
('Zavia', '978-969-35-0003-5', 3, 3, 1, 1982, 432, 750.00, 4, 7),
('Raja Gidh', '978-969-35-0004-2', 4, 1, 1, 1981, 274, 950.00, 2, 6),
('Yusuf bin Tashfin', '978-969-35-0005-9', 5, 4, 8, 1963, 256, 890.00, 6, 9),
('Alakh Nagri', '978-969-35-0006-6', 6, 5, 1, 1973, 447, 1200.00, 3, 7),
('Safina-e-Gham-e-Dil', '978-969-35-0007-3', 7, 6, 1, 1969, 223, 780.00, 8, 12),
('Aag Ka Darya', '978-969-35-0008-0', 8, 7, 1, 1959, 387, 1100.00, 4, 6);

INSERT INTO Members (first_name, last_name, email, phone, address, membership_date, membership_type, status) VALUES
('Muhammad', 'Ali', 'muhammad.ali@gmail.com', '+92-300-1234567', 'Model Town, Lahore, Punjab', '2023-01-15', 'Public', 'Active'),
('Fatima', 'Khan', 'fatima.khan@yahoo.com', '+92-321-9876543', 'Defence Housing Authority, Karachi, Sindh', '2023-02-20', 'Student', 'Active'),
('Ahmed', 'Hassan', 'ahmed.hassan@hotmail.com', '+92-333-4567890', 'F-7 Sector, Islamabad', '2023-03-10', 'Faculty', 'Active'),
('Ayesha', 'Sheikh', 'ayesha.sheikh@gmail.com', '+92-301-2345678', 'Gulberg, Lahore, Punjab', '2023-04-05', 'Public', 'Active'),
('Usman', 'Malik', 'usman.malik@yahoo.com', '+92-345-6789012', 'Clifton, Karachi, Sindh', '2023-05-12', 'Student', 'Active'),
('Zainab', 'Ahmad', 'zainab.ahmad@gmail.com', '+92-302-3456789', 'Hayatabad, Peshawar, KPK', '2023-06-18', 'Public', 'Inactive'),
('Tariq', 'Jamil', 'tariq.jamil@hotmail.com', '+92-336-7890123', 'Satellite Town, Rawalpindi, Punjab', '2023-07-25', 'Faculty', 'Active'),
('Sana', 'Butt', 'sana.butt@gmail.com', '+92-312-4567890', 'Johar Town, Lahore, Punjab', '2023-08-30', 'Student', 'Active');

INSERT INTO Staff (first_name, last_name, position, email, phone, hire_date, salary) VALUES
('Asma', 'Qureshi', 'Head Librarian', 'asma.qureshi@library.edu.pk', '+92-42-11111111', '2020-01-15', 95000.00),
('Bilal', 'Raza', 'Assistant Librarian', 'bilal.raza@library.edu.pk', '+92-42-22222222', '2021-03-20', 65000.00),
('Nadia', 'Siddiqui', 'Library Technician', 'nadia.siddiqui@library.edu.pk', '+92-42-33333333', '2022-05-10', 55000.00),
('Kashif', 'Mahmood', 'Circulation Clerk', 'kashif.mahmood@library.edu.pk', '+92-42-44444444', '2022-08-15', 45000.00),
('Rubina', 'Ashraf', 'Reference Librarian', 'rubina.ashraf@library.edu.pk', '+92-42-55555555', '2021-11-01', 75000.00),
('Faisal', 'Iqbal', 'IT Support', 'faisal.iqbal@library.edu.pk', '+92-42-66666666', '2023-02-14', 70000.00),
('Saima', 'Nawaz', 'Cataloging Specialist', 'saima.nawaz@library.edu.pk', '+92-42-77777777', '2022-09-30', 60000.00),
('Waseem', 'Ahmed', 'Security Guard', 'waseem.ahmed@library.edu.pk', '+92-42-88888888', '2023-01-10', 35000.00);

INSERT INTO Transactions (member_id, book_id, staff_id, issue_date, due_date, return_date, fine_amount, status) VALUES
(1, 1, 2, '2024-01-15', '2024-02-15', '2024-02-10', 0.00, 'Returned'),
(2, 3, 2, '2024-01-20', '2024-02-20', NULL, 0.00, 'Issued'),
(3, 5, 4, '2024-02-01', '2024-03-01', '2024-03-05', 25.00, 'Returned'),
(4, 7, 2, '2024-02-10', '2024-03-10', NULL, 0.00, 'Issued'),
(5, 2, 4, '2024-02-15', '2024-03-15', '2024-03-20', 30.00, 'Returned'),
(1, 6, 2, '2024-03-01', '2024-04-01', NULL, 0.00, 'Issued'),
(6, 4, 4, '2024-03-10', '2024-04-10', '2024-04-08', 0.00, 'Returned'),
(7, 8, 2, '2024-03-15', '2024-04-15', NULL, 0.00, 'Issued'),
(8, 1, 4, '2024-03-20', '2024-04-20', '2024-04-25', 27.50, 'Returned');


DELIMITER //

-- Procedure to issue a book to a member
CREATE PROCEDURE IssueBook(
    IN p_member_id INT,
    IN p_book_id INT,
    IN p_staff_id INT,
    IN p_loan_days INT
)
BEGIN
    DECLARE book_available INT DEFAULT 0;
    DECLARE member_active INT DEFAULT 0;
    
    -- Check if member is active
    SELECT COUNT(*) INTO member_active
    FROM Members 
    WHERE member_id = p_member_id AND status = 'Active';
    
    -- Check if book is available
    SELECT copies_available INTO book_available
    FROM Books 
    WHERE book_id = p_book_id;
    
    IF member_active = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Member is not active';
    ELSEIF book_available <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Book is not available';
    ELSE
        -- Issue the book
        INSERT INTO Transactions (member_id, book_id, staff_id, issue_date, due_date, status)
        VALUES (p_member_id, p_book_id, p_staff_id, CURDATE(), DATE_ADD(CURDATE(), INTERVAL p_loan_days DAY), 'Issued');
        
        -- Update book availability
        UPDATE Books 
        SET copies_available = copies_available - 1 
        WHERE book_id = p_book_id;
        
        SELECT 'Book issued successfully' AS message;
    END IF;
END //

-- Procedure to return a book
CREATE PROCEDURE ReturnBook(
    IN p_transaction_id INT,
    IN p_fine_amount DECIMAL(8,2)
)
BEGIN
    DECLARE book_id_to_return INT;
    DECLARE transaction_exists INT DEFAULT 0;
    
    -- Check if transaction exists and is issued
    SELECT COUNT(*), book_id INTO transaction_exists, book_id_to_return
    FROM Transactions 
    WHERE transaction_id = p_transaction_id AND status = 'Issued';
    
    IF transaction_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction not found or already returned';
    ELSE
        -- Update transaction
        UPDATE Transactions 
        SET return_date = CURDATE(), 
            fine_amount = p_fine_amount,
            status = 'Returned'
        WHERE transaction_id = p_transaction_id;
        
        -- Update book availability
        UPDATE Books 
        SET copies_available = copies_available + 1 
        WHERE book_id = book_id_to_return;
        
        SELECT 'Book returned successfully' AS message;
    END IF;
END //

-- Procedure to calculate fine for overdue books
CREATE PROCEDURE CalculateOverdueFines(
    IN p_fine_per_day DECIMAL(8,2)
)
BEGIN
    UPDATE Transactions 
    SET fine_amount = DATEDIFF(CURDATE(), due_date) * p_fine_per_day,
        status = 'Overdue'
    WHERE status = 'Issued' 
    AND due_date < CURDATE()
    AND return_date IS NULL;
    
    SELECT 'Overdue fines calculated' AS message;
END //

-- Procedure to get member borrowing history
CREATE PROCEDURE GetMemberHistory(
    IN p_member_id INT
)
BEGIN
    SELECT t.transaction_id, b.title, a.first_name, a.last_name,
           t.issue_date, t.due_date, t.return_date, t.fine_amount, t.status
    FROM Transactions t
    JOIN Books b ON t.book_id = b.book_id
    JOIN Authors a ON b.author_id = a.author_id
    WHERE t.member_id = p_member_id
    ORDER BY t.issue_date DESC;
END //

-- Procedure to get book availability report
CREATE PROCEDURE GetBookAvailabilityReport()
BEGIN
    SELECT b.title, a.first_name, a.last_name, c.category_name,
           b.total_copies, b.copies_available,
           (b.total_copies - b.copies_available) AS copies_issued
    FROM Books b
    JOIN Authors a ON b.author_id = a.author_id
    JOIN Categories c ON b.category_id = c.category_id
    ORDER BY b.title;
END //

DELIMITER ;

-- Query to find overdue books with member details
SELECT m.first_name, m.last_name, m.phone, m.email,
       b.title, t.issue_date, t.due_date,
       DATEDIFF(CURDATE(), t.due_date) AS days_overdue
FROM Transactions t
JOIN Members m ON t.member_id = m.member_id
JOIN Books b ON t.book_id = b.book_id
WHERE t.status = 'Issued' 
AND t.due_date < CURDATE()
ORDER BY days_overdue DESC;

-- Query to find most popular books (most borrowed)
SELECT b.title, a.first_name, a.last_name, c.category_name,
       COUNT(t.transaction_id) AS times_borrowed
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Categories c ON b.category_id = c.category_id
LEFT JOIN Transactions t ON b.book_id = t.book_id
GROUP BY b.book_id, b.title, a.first_name, a.last_name, c.category_name
ORDER BY times_borrowed DESC
LIMIT 5;

-- Query to find members with highest fines
SELECT m.first_name, m.last_name, m.email, m.phone,
       SUM(t.fine_amount) AS total_fines,
       COUNT(t.transaction_id) AS total_transactions
FROM Members m
JOIN Transactions t ON m.member_id = t.member_id
WHERE t.fine_amount > 0
GROUP BY m.member_id, m.first_name, m.last_name, m.email, m.phone
ORDER BY total_fines DESC;

-- Basic SELECT queries
SELECT title, publication_year 
FROM Books 
ORDER BY publication_year DESC;

-- Select inactive members (replaced DELETE to avoid safe mode errors)
SELECT member_id, first_name, last_name, email, status, membership_date
FROM Members 
WHERE status = 'Inactive';

-- Safe UPDATE with specific WHERE condition using primary key
UPDATE Books 
SET price = price * 1.10 
WHERE book_id IN (1, 2, 5, 7, 8) AND publication_year < 1970;

-- Add column to Categories table
ALTER TABLE Categories 
ADD COLUMN priority_level INT DEFAULT 1;

-- Category analysis with book count
SELECT c.category_name, c.priority_level, COUNT(b.book_id) as book_count
FROM Categories c
LEFT JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name, c.priority_level
ORDER BY book_count DESC;

-- Books with author and publisher information
SELECT b.title, a.first_name, a.last_name, p.publisher_name
FROM Books b
JOIN Authors a ON b.author_id = a.author_id
JOIN Publishers p ON b.publisher_id = p.publisher_id
ORDER BY b.title;

-- Currently issued books
SELECT m.first_name, m.last_name, b.title, t.issue_date, t.due_date
FROM Transactions t
JOIN Members m ON t.member_id = m.member_id
JOIN Books b ON t.book_id = b.book_id
WHERE t.status = 'Issued';

-- Books grouped by category
SELECT c.category_name, b.title, a.first_name, a.last_name
FROM Books b
JOIN Categories c ON b.category_id = c.category_id
JOIN Authors a ON b.author_id = a.author_id
ORDER BY c.category_name, b.title;

-- Returned transactions with staff information
SELECT m.first_name, m.last_name, b.title, s.first_name AS staff_first_name, s.last_name AS staff_last_name, t.issue_date, t.return_date, t.fine_amount
FROM Transactions t
JOIN Members m ON t.member_id = m.member_id
JOIN Books b ON t.book_id = b.book_id
JOIN Staff s ON t.staff_id = s.staff_id
WHERE t.return_date IS NOT NULL;

-- Publisher statistics
SELECT p.publisher_name, COUNT(b.book_id) as total_books, AVG(b.price) as avg_price
FROM Publishers p
LEFT JOIN Books b ON p.publisher_id = b.publisher_id
GROUP BY p.publisher_id, p.publisher_name
ORDER BY total_books DESC;

-- Books by Pakistani authors 
SELECT title, publication_year, price
FROM Books
WHERE author_id IN (
    SELECT author_id 
    FROM Authors 
    WHERE nationality = 'Pakistani'
);

-- Members who borrowed books published after 1950
SELECT DISTINCT first_name, last_name, email
FROM Members
WHERE member_id IN (
    SELECT member_id 
    FROM Transactions 
    WHERE book_id IN (
        SELECT book_id 
        FROM Books 
        WHERE publication_year > 1950
    )
);

-- Books never borrowed
SELECT title, isbn, price
FROM Books
WHERE book_id NOT IN (
    SELECT DISTINCT book_id 
    FROM Transactions 
    WHERE book_id IS NOT NULL
);

-- Fiction authors
SELECT first_name, last_name, nationality
FROM Authors
WHERE author_id IN (
    SELECT author_id 
    FROM Books 
    WHERE category_id = (
        SELECT category_id 
        FROM Categories 
        WHERE category_name = 'Fiction'
    )
);

-- Books with above average price
SELECT title, price, 
       (SELECT AVG(price) FROM Books) as avg_price
FROM Books
WHERE price > (
    SELECT AVG(price) 
    FROM Books
);

-- Overall book statistics
SELECT COUNT(*) as total_books,
       AVG(price) as average_price,
       MIN(price) as lowest_price,
       MAX(price) as highest_price,
       SUM(total_copies) as total_inventory
FROM Books;

-- Category statistics
SELECT c.category_name, 
       COUNT(b.book_id) as book_count,
       AVG(b.price) as avg_price
FROM Categories c
LEFT JOIN Books b ON c.category_id = b.category_id
GROUP BY c.category_id, c.category_name
ORDER BY book_count DESC;

-- Member statistics by type 
-- Count all members by type
SELECT membership_type,
       COUNT(*) as member_count
FROM Members
GROUP BY membership_type;

-- Count active members by type 
SELECT membership_type,
       COUNT(*) as active_members
FROM Members
WHERE status = 'Active'
GROUP BY membership_type;

-- Staff salary statistics
SELECT position,
       COUNT(*) as staff_count,
       AVG(salary) as avg_salary,
       MIN(salary) as min_salary,
       MAX(salary) as max_salary
FROM Staff
GROUP BY position
ORDER BY avg_salary DESC;

-- Transaction statistics by month
SELECT YEAR(issue_date) as year,
       MONTH(issue_date) as month,
       COUNT(*) as total_transactions,
       SUM(fine_amount) as total_fines,
       AVG(fine_amount) as avg_fine
FROM Transactions
GROUP BY YEAR(issue_date), MONTH(issue_date)
ORDER BY year DESC, month DESC;

-- Pattern matching queries
SELECT title, author_id, publication_year
FROM Books
WHERE title LIKE 'A%'
ORDER BY title;

SELECT first_name, last_name, nationality
FROM Authors
WHERE first_name LIKE '%a%' OR last_name LIKE '%a%';

SELECT first_name, last_name, email
FROM Members
WHERE email LIKE '%@gmail.com' 
   OR email LIKE '%@yahoo.com' 
   OR email LIKE '%@hotmail.com';

SELECT publisher_name, address, established_year
FROM Publishers
WHERE publisher_name LIKE '%Publications%' OR publisher_name LIKE '%Publishers%';

SELECT first_name, last_name, position, phone
FROM Staff
WHERE phone LIKE '+92-42%'
ORDER BY last_name;



-- Example: Issue a book (member_id=1, book_id=5, staff_id=2, for 14 days)
-- CALL IssueBook(1, 5, 2, 14);

-- Example: Return a book (transaction_id=1, fine_amount=0.00)
-- CALL ReturnBook(1, 0.00);

-- Example: Calculate overdue fines (5 PKR per day)
-- CALL CalculateOverdueFines(5.00);

-- Example: Get member history (member_id=1)
-- CALL GetMemberHistory(1);

-- Example: Get book availability report
-- CALL GetBookAvailabilityReport();