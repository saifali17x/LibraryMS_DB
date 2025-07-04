# LibraryMS_DB

A comprehensive MySQL database system for managing library operations including books, members, staff, and transactions with automated procedures and reporting capabilities.

## 📋 Table of Contents

- [Overview](#overview)
- [Database Schema](#database-schema)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Stored Procedures](#stored-procedures)
- [Sample Queries](#sample-queries)
- [Database Structure](#database-structure)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

This Library Management System is designed to handle the complete workflow of a library including:

- Book catalog management
- Member registration and management
- Staff management
- Book borrowing and returning
- Fine calculation and management
- Comprehensive reporting

## 🗄️ Database Schema

The database consists of 7 main tables:

- **Authors** - Store author information
- **Publishers** - Publisher details
- **Categories** - Book categories
- **Books** - Complete book catalog
- **Members** - Library member information
- **Staff** - Library staff details
- **Transactions** - Book borrowing/returning records

## ✨ Features

### Core Features

- ✅ Complete book catalog with ISBN tracking
- ✅ Member management with different membership types
- ✅ Staff management with role-based access
- ✅ Transaction tracking for book loans
- ✅ Automated fine calculation
- ✅ Book availability management

### Advanced Features

- 🔧 **Stored Procedures** for common operations
- 📊 **Comprehensive Reporting** with statistical queries
- 🔍 **Advanced Search** with pattern matching
- 💰 **Automated Fine Management**
- 📈 **Usage Analytics** and statistics

## 🚀 Installation

### Prerequisites

- MySQL 8.0 or higher
- MySQL Workbench (optional, for GUI management)

### Setup Instructions

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/library-management-system.git
   cd library-management-system
   ```

2. **Create the database:**

   ```sql
   mysql -u root -p < library_management_system.sql
   ```

3. **Verify installation:**
   ```sql
   USE LibraryManagementSystem;
   SHOW TABLES;
   ```

## 🎮 Usage

### Basic Operations

#### Issue a Book

```sql
CALL IssueBook(member_id, book_id, staff_id, loan_days);
-- Example: Issue book ID 1 to member ID 1 for 14 days
CALL IssueBook(1, 1, 2, 14);
```

#### Return a Book

```sql
CALL ReturnBook(transaction_id, fine_amount);
-- Example: Return transaction ID 1 with 0 fine
CALL ReturnBook(1, 0.00);
```

#### Calculate Overdue Fines

```sql
CALL CalculateOverdueFines(fine_per_day);
-- Example: Calculate fines at 5 PKR per day
CALL CalculateOverdueFines(5.00);
```

## 🔧 Stored Procedures

| Procedure                   | Description                          | Parameters                              |
| --------------------------- | ------------------------------------ | --------------------------------------- |
| `IssueBook`                 | Issue a book to a member             | member_id, book_id, staff_id, loan_days |
| `ReturnBook`                | Return a borrowed book               | transaction_id, fine_amount             |
| `CalculateOverdueFines`     | Calculate fines for overdue books    | fine_per_day                            |
| `GetMemberHistory`          | Get borrowing history of a member    | member_id                               |
| `GetBookAvailabilityReport` | Get availability status of all books | None                                    |

## 📊 Sample Queries

### Find Overdue Books

```sql
SELECT m.first_name, m.last_name, b.title,
       DATEDIFF(CURDATE(), t.due_date) AS days_overdue
FROM Transactions t
JOIN Members m ON t.member_id = m.member_id
JOIN Books b ON t.book_id = b.book_id
WHERE t.status = 'Issued' AND t.due_date < CURDATE();
```

### Most Popular Books

```sql
SELECT b.title, COUNT(t.transaction_id) AS times_borrowed
FROM Books b
LEFT JOIN Transactions t ON b.book_id = t.book_id
GROUP BY b.book_id, b.title
ORDER BY times_borrowed DESC
LIMIT 5;
```

### Member Statistics

```sql
SELECT membership_type, COUNT(*) as member_count
FROM Members
WHERE status = 'Active'
GROUP BY membership_type;
```

## 🏗️ Database Structure

### Entity Relationship Overview

```
Authors (1) ──────── (M) Books (M) ──────── (1) Publishers
                         │
                         │ (M)
                         │
                         │ (1)
                   Categories
                         │
                         │ (M)
                         │
                         │ (1)
                   Transactions
                         │
                         │ (M)
                         │
Members (1) ──────── (M) │ (M) ──────── (1) Staff
```

### Key Tables

#### Books Table

- `book_id` (Primary Key)
- `title`, `isbn`, `publication_year`
- `price`, `pages`
- `copies_available`, `total_copies`
- Foreign keys to Authors, Publishers, Categories

#### Members Table

- `member_id` (Primary Key)
- `first_name`, `last_name`, `email`
- `membership_type` (Student, Faculty, Public)
- `status` (Active, Inactive, Suspended)

#### Transactions Table

- `transaction_id` (Primary Key)
- `issue_date`, `due_date`, `return_date`
- `fine_amount`, `status`
- Foreign keys to Members, Books, Staff

## 📈 Sample Data

The database comes pre-populated with:

- 8 Pakistani authors (Allama Iqbal, Faiz Ahmad, etc.)
- 8 publishers from Pakistan
- 9 book categories
- 8 classic Urdu/Pakistani literature books
- 8 library members
- 8 staff members
- 9 sample transactions

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Guidelines

- Follow SQL naming conventions
- Add comments for complex queries
- Test all stored procedures
- Update documentation for new features

## 📝 License

This project is licensed under the MIT License.

## 🙏 Acknowledgments

- Sample data inspired by Pakistani literature and authors
- Database design follows standard library management practices
- Built with MySQL best practices and performance considerations

## 📞 Support

For support, please open an issue in the GitHub repository.

---

**Made with ❤️ for library management efficiency**
