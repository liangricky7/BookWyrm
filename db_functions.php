<?php
// db_functions.php
function connectDatabase() {
    $host = 'localhost';
    $dbname = 'library';
    $username = 'root';
    $password = '';

    $conn = new mysqli($host, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    return $conn;
}

function getBooks() {
    $conn = connectDatabase();
    $sql = 
    "SELECT 
        b.title AS Book_Title,
        p.isbn AS ISBN,
        c.first_name AS Customer_First_Name,
        c.last_name AS Customer_Last_Name,
        l.checkout_date AS Checkout_Date,
        l.late_fee AS Late_Fee
    FROM 
        Loan l
    JOIN 
        Copy cp ON l.loan_id = cp.loan_id
    JOIN 
        Publication p ON cp.copy_id = p.copy_id
    JOIN 
        Book b ON p.book_id = b.book_id
    JOIN 
        Customer c ON l.card_number = c.card_number;";
    $result = $conn->query($sql);
    
    $books = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $books[] = $row;
        }
    }
    $conn->close();
    return $books;
}

function displayBooks($books) {
    if (empty($books)) {
        echo "<tr><td colspan='4'>No books found.</td></tr>";
    } else {
        foreach ($books as $book) {
            echo "<tr>";
            echo "<td>" . $book['id'] . "</td>";
            echo "<td>" . $book['title'] . "</td>";
            echo "<td>" . $book['author'] . "</td>";
            echo "<td>" . $book['published_year'] . "</td>";
            echo "</tr>";
        }
    }

}
?>