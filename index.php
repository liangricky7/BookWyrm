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

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Book Wyrm</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    </head>
<!--     
    <div class="navBar">
        <img src="assets/Logo.png" alt="Book Wyrm Logo" class="logo">
        <ul>
            <li><a href="/index.html" class="activePage"><img src="assets/NavBar/Dashboard.png" alt="Dashboard">Dashboard</a></li>
            <li><a href="/pages/books.html"><img src="assets/NavBar/ManageBooks.png" alt="Manage Books">Manage Books</a></li>
            <li><a href="/pages/patrons.html"><img src="assets/NavBar/ManagePatrons.png" alt="Manage Patrons">Manage Patrons</a></li>
            <li><a href="/pages/reservations.html"><img src="assets/NavBar/Reservations.png" alt="Reservations">Reservations</a></li>
            <li><a href="/pages/fines.html"><img src="assets/NavBar/Payments.png" alt="Payments/Fines">Payments/Fines</a></li>
        </ul>
    </div> -->

    <body class="background">
        <div class="tableBackground">
            <table>
                <thead>
                  <tr>
                    <th>Book Title</th>
                    <th>ISBN</th>
                    <th>Customer</th>
                    <th>Checkout Date</th>
                    <th>Due Date</th>
                    <th>Amount Due</th>
                  </tr>
                </thead>
                <?php displayBooks(getBooks())?>
                <!-- <tbody>
                    <tr>
                        <th>"..."</th>
                        <th class="ISBN">0000000000000</th>
                        <th>Jacob Marcus</th>
                        <th>11/15/2024</th>
                        <th>11/29/2024</th>
                        <th>$000</th>
                    </tr>
                    <tr>
                        <th>"..."</th>
                        <th class="ISBN">0000000000000</th>
                        <th>Jacob Marcus</th>
                        <th>11/15/2024</th>
                        <th>11/29/2024</th>
                        <th>$000</th>
                    </tr>
                    <tr>
                        <th>"..."</th>
                        <th class="ISBN">0000000000000</th>
                        <th>Jacob Marcus</th>
                        <th>11/15/2024</th>
                        <th>11/29/2024</th>
                        <th>$000</th>
                    </tr>
                    <tr>
                        <th>"..."</th>
                        <th class="ISBN">0000000000000</th>
                        <th>Jacob Marcus</th>
                        <th>11/15/2024</th>
                        <th>11/29/2024</th>
                        <th>$000</th>
                    </tr>
                    <tr>
                        <th>"..."</th>
                        <th class="ISBN">0000000000000</th>
                        <th>Jacob Marcus</th>
                        <th>11/15/2024</th>
                        <th>11/29/2024</th>
                        <th>$000</th>
                    </tr>
                    <tr>
                        <th>"..."</th>
                        <th class="ISBN">0000000000000</th>
                        <th>Jacob Marcus</th>
                        <th>11/15/2024</th>
                        <th>11/29/2024</th>
                        <th>$000</th>
                    </tr>
                    <tr>
                        <th>"..."</th>
                        <th class="ISBN">0000000000000</th>
                        <th>Jacob Marcus</th>
                        <th>11/15/2024</th>
                        <th>11/29/2024</th>
                        <th>$000</th>
                    </tr>
                    <tr>
                        <th>"..."</th>
                        <th class="ISBN">0000000000000</th>
                        <th>Jacob Marcus</th>
                        <th>11/15/2024</th>
                        <th>11/29/2024</th>
                        <th>$000</th>
                    </tr>
                    <tr>
                        <th>"..."</th>
                        <th class="ISBN">0000000000000</th>
                        <th>Jacob Marcus</th>
                        <th>11/15/2024</th>
                        <th>11/29/2024</th>
                        <th>$000</th>
                    </tr>
                </tbody> -->
              </table>
        </div>

    </body>


</html>