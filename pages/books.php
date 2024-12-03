<?php
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

function getAllBooks() {
    $conn = connectDatabase();
    $sql = "SELECT 
        b.title AS Title,
        CONCAT(a.first_name, ' ', a.last_name) AS Author,
        b.summary AS Summary,
        b.reading_age AS Reading_Age,
        bg.genre AS Genre
    FROM 
        Book b
    JOIN
        Book_Author ba ON ba.book_id = b.book_id
    JOIN
        Author a ON a.author_id = ba.author_id
    JOIN 
        Book_Genre bg ON bg.book_id = b.book_id;";

    $result = $conn->query($sql);
    
    $patrons = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $patrons[] = $row;
        }
    }
    $conn->close();
    return $patrons;
}

function displayAllBooks($patrons) {
    if (empty($patrons)) {
        echo "<tr><th colspan='5'>No patrons found.</th></tr>";
    } else {
        foreach ($patrons as $patron) {
            echo "<tr>";
            echo "<th>" . $patron['Title'] . "</th>";
            echo "<th>" . $patron['Author'] . "</th>";
            echo "<th>" . $patron['Summary'] . "</th>";
            echo "<th>" . $patron['Genre'] . "</th>";
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
        <link rel="stylesheet" href="../css/styles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    </head>
    
    <div class="navBar">
        <img src="../assets/Logo.png" alt="Book Wyrm Logo" class="logo">
        <ul>
            <li><a href="/index.php"><img src="../assets/NavBar/Dashboard.png" alt="Inventory Dashboard">Inventory Dashboard</a></li>
            <li><a href="/pages/books.php" class="activePage"><img src="../assets/NavBar/ManageBooks.png" alt="Book Dashboard">Book Dashboard</a></li>
            <li><a href="/pages/patrons.php"><img src="../assets/NavBar/ManagePatrons.png" alt="Manage Patrons">Manage Patrons</a></li>
            <li><a href="/pages/employees.php"><img src="../assets/NavBar/Reservations.png" alt="Manage Employees">Manage Employees</a></li>
            <li><a href="/pages/fines.php"><img src="../assets/NavBar/Payments.png" alt="Payments/Fines">Payments/Fines</a></li>
        </ul>
    </div>
    <body class="background">
    <div class="spacer"></div>
    <div class="tableBackground">
            <table>
                <thead>
                  <tr>
                    <th>Book Title</th>
                    <th>Author</th>
                    <th>Synopsis</th>
                    <th>Genre</th>
                  </tr>
                </thead>
                <tbody> 
                    <?php displayAllBooks(getAllBooks())?>
                </tbody>
              </table>
        </div>
    </body>


</html>