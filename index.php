<?php
// Database connection details
$servername = "127.0.0.1";  // Database server (localhost for local dev)
$dbname = "library";        // Database Name
$username = "root";         // MySQL username (root for local setup)
$password = "";             // MySQL password (empty by default for local dev)

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Check if database exists
$result = $conn->query("SHOW DATABASES LIKE '$dbname'");

// If databse doesn't exist, create it
if ($result->num_rows == 0) {
    $sql = "CREATE DATABASE IF NOT EXISTS `$dbname`;";
    if ($conn->query($sql) === TRUE) {
        // echo "Database created successfully\n";
                
        $conn->select_db($dbname);

        // Path to SQL setups
        $sql_init_file = 'sql/initialize_table.sql';
        if (!file($sql_init_file)) {
            die("SQL File does not exist!");
        }

        // Read Initialization SQL file
        $sql = file_get_contents($sql_init_file);
        $queries = explode(';', $sql);

        foreach ($queries as $query) {
            $query = trim($query);
            if (!empty($query)) {
                if ($conn->query($query) !== TRUE) {
                    die("Died executing query: " . $conn->error);
                }
            }
        }
    } else {
        die("Error creating DB: " . $conn->error);
    }
}

// Close the database connection
$conn->close();

function debugDB() {
    // Database connection parameters
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "library";
    
    try {
        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        
        // Check connection
        if ($conn->connect_error) {
            throw new Exception("Connection failed: " . $conn->connect_error);
        }
    
        // Get list of all tables in the database
        $tables_result = $conn->query("SHOW TABLES");
    
        // Check if there are any tables
        if ($tables_result->num_rows > 0) {
            // Loop through each table
            while ($table = $tables_result->fetch_array()) {
                $table_name = $table[0];
                
                // Print table name
                echo "<h2>Table: " . htmlspecialchars($table_name) . "</h2>";
                
                // Get table structure
                $structure_result = $conn->query("DESCRIBE $table_name");
                
                // Print table columns
                echo "<h3>Table Structure:</h3>";
                echo "<table border='1'>";
                echo "<tr><th>Column</th><th>Type</th><th>Null</th><th>Key</th><th>Default</th><th>Extra</th></tr>";
                while ($column = $structure_result->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($column['Field']) . "</td>";
                    echo "<td>" . htmlspecialchars($column['Type']) . "</td>";
                    echo "<td>" . htmlspecialchars($column['Null']) . "</td>";
                    echo "<td>" . htmlspecialchars($column['Key']) . "</td>";
                    echo "<td>" . htmlspecialchars($column['Default'] ?? 'NULL') . "</td>";
                    echo "<td>" . htmlspecialchars($column['Extra']) . "</td>";
                    echo "</tr>";
                }
                echo "</table>";
                
                // Get table data
                $data_result = $conn->query("SELECT * FROM $table_name");
                
                // Print table data
                echo "<h3>Table Data:</h3>";
                if ($data_result->num_rows > 0) {
                    echo "<table border='1'>";
                    
                    // Print headers
                    echo "<tr>";
                    $fields = $data_result->fetch_fields();
                    foreach ($fields as $field) {
                        echo "<th>" . htmlspecialchars($field->name) . "</th>";
                    }
                    echo "</tr>";
                    
                    // Print rows
                    while ($row = $data_result->fetch_assoc()) {
                        echo "<tr>";
                        foreach ($row as $value) {
                            echo "<td>" . htmlspecialchars($value ?? 'NULL') . "</td>";
                        }
                        echo "</tr>";
                    }
                    echo "</table>";
                } else {
                    echo "No data in table " . htmlspecialchars($table_name);
                }
                
                echo "<hr>"; // Separator between tables
            }
        } else {
            echo "No tables found in the database.";
        }
    
        // Close connection
        $conn->close();
    
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
    }
}

function connectDatabase() {
    $host = '127.0.0.1';
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
    // test($conn);
    $sql = "SELECT 
        b.title AS Book_Title,
        p.isbn AS ISBN,
        CONCAT(c.first_name, ' ', c.last_name) AS Full_Name,
        l.checkout_date AS Checkout_Date,
        l.due_date AS Due_Date,
        l.late_fee AS Late_Fee
        
    FROM 
        Customer c
    JOIN
        Loan l ON c.card_number = l.card_number
    JOIN
        Copy cp ON cp.loan_id = l.loan_id
    JOIN
        Publication p ON p.copy_id = cp.copy_id
    JOIN 
        Book b ON b.book_id = p.book_id;";


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
        echo "<tr><td colspan='6'>No books found.</td></tr>";
    } else {
        foreach ($books as $book) {
            echo "<tr>";
            echo "<td>" . $book['Book_Title'] . "</td>";
            echo "<td class='ISBN'>" . (is_null($book['ISBN']) ? "EBook" : $book['ISBN']) . "</td>";
            echo "<td>" . $book['Full_Name'] . "</td>";
            echo "<td>" . $book['Checkout_Date'] . "</td>";
            echo "<td>" . $book['Due_Date'] . "</td>";
            echo "<td>" . $book['Late_Fee'] . "</td>";
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
    
    <div class="navBar">
        <img src="assets/Logo.png" alt="Book Wyrm Logo" class="logo">
        <ul>
            <li><a href="/index.php" class="activePage"><img src="assets/NavBar/Dashboard.png" alt="Inventory Dashboard">Inventory Dashboard</a></li>
            <li><a href="/pages/books.php"><img src="assets/NavBar/ManageBooks.png" alt="Book Dashboard">Book Dashboard</a></li>
            <li><a href="/pages/patrons.php"><img src="assets/NavBar/ManagePatrons.png" alt="Manage Patrons">Manage Patrons</a></li>
            <li><a href="/pages/reservations.php"><img src="assets/NavBar/Reservations.png" alt="Manage Employees">Manage Employees</a></li>
            <li><a href="/pages/fines.php"><img src="assets/NavBar/Payments.png" alt="Payments/Fines">Payments/Fines</a></li>
        </ul>
    </div>

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
              </table>
        </div>

    </body>


</html>