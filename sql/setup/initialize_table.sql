CREATE DATABASE library; 
use library; 

CREATE TABLE Genre (
    genre VARCHAR(100) PRIMARY KEY,
    description TEXT
);

CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    summary TEXT,
    reading_age INT,
    dewey_decimal VARCHAR(10),
    series VARCHAR(100)
);

CREATE TABLE Prequel (
    book_id INT,
    prequel_id INT,
    PRIMARY KEY (book_id, prequel_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (prequel_id) REFERENCES Book(book_id)
);

CREATE TABLE Sequel (
    book_id INT,
    sequel_id INT,
    PRIMARY KEY (book_id, sequel_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (sequel_id) REFERENCES Book(book_id)
);

CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    biography TEXT,
    date_of_birth DATE,
    country_of_origin VARCHAR(100)
);

CREATE TABLE Narrator (
    narrator_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    biography TEXT,
    date_of_birth DATE,
    country_of_origin VARCHAR(100)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    status ENUM('Active', 'Inactive', 'Retired', 'Terminated'),
    position VARCHAR(100),
    hire_date DATE,
    leave_date DATE,
    date_of_birth DATE,
    street_number INT,
    street_name VARCHAR(100),
    apt_number INT,
    city VARCHAR(100),
    state CHAR(2),
    zip INT
);

CREATE TABLE Customer (
    card_number INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    status ENUM('Suspended', 'Overdue', 'Active', 'Expired'),
    registration_date DATE,
    street_number INT,
    street_name VARCHAR(100),
    apt_number INT,
    city VARCHAR(100),
    state CHAR(2),
    zip INT
);

CREATE TABLE Publication (
    edition VARCHAR(100),
    format ENUM('Hardcover', 'Paperback', 'Ebook', 'Audiobook'),
    language VARCHAR(50),
    publisher VARCHAR(255),
    copy_id INT,
    book_id INT,
    isbn VARCHAR(13),
    publication_date DATE,
    page_count INT,
    PRIMARY KEY (edition, format, language, publisher),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    employee_id INT,
    card_number INT,
    late_fee DECIMAL(5, 2),
    checkout_date DATE,
    due_date DATE,
    return_date DATE,
    renewal_count INT
);

CREATE TABLE Copy (
    copy_id INT PRIMARY KEY,
    condition_type ENUM('New', 'Good', 'Worn', 'Damaged'),
    price DECIMAL(10, 2),
    status ENUM('Available', 'Checked Out', 'Reserved', 'Processing'),
    location VARCHAR(255),
    reservations BOOLEAN,
    loan_id INT,
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)
);

-- Many-to-many relationships tables
CREATE TABLE Book_Genre (
    book_id INT,
    genre VARCHAR(100),
    PRIMARY KEY (book_id, genre),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (genre) REFERENCES Genre(genre)
);

CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

CREATE TABLE Publication_Narrator (
    edition VARCHAR(100),
    format ENUM('Hardcover', 'Paperback', 'Ebook', 'Audiobook'),
    language VARCHAR(50),
    publisher VARCHAR(255),
    narrator_id INT,
    PRIMARY KEY (edition, format, language, publisher, narrator_id),
    FOREIGN KEY (edition, format, language, publisher)
		REFERENCES Publication(edition, format, language, publisher),
    FOREIGN KEY (narrator_id) REFERENCES Narrator(narrator_id)
);