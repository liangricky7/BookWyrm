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

function getEmployees() {
    $conn = connectDatabase();
    $sql = "SELECT 
        CONCAT(e.first_name, ' ', e.last_name) AS Full_Name,
        e.email AS Email,
        e.phone_number AS Phone,
        CONCAT(
            COALESCE(e.street_number, ''),
            CASE WHEN e.street_number IS NOT NULL AND e.street_name IS NOT NULL THEN ' ' ELSE '' END,
            COALESCE(e.street_name, ''),
            CASE WHEN e.apt_number IS NOT NULL THEN CONCAT(' #', e.apt_number) ELSE '' END,
            ', ',
            COALESCE(e.city, ''),
            ', ',
            COALESCE(e.state, ''),
            ' ',
            COALESCE(e.zip, '')
        ) AS Full_Address,
        e.phone_number AS Phone,
        e.position AS Position,
        e.status AS Status
    FROM 
        Employee e;";

    $result = $conn->query($sql);
    
    $employees = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $employees[] = $row;
        }
    }
    $conn->close();
    return $employees;
}

function displayEmployees($employees) {
    if (empty($employees)) {
        echo "<tr><th colspan='6'>No employees found.</th></tr>";
    } else {
        foreach ($employees as $employee) {
            echo "<tr>";
            echo "<th>" . $employee['Full_Name'] . "</th>";
            echo "<th>" . $employee['Email'] . "</th>";
            echo "<th>" . $employee['Phone'] . "</th>";
            echo "<th>" . $employee['Full_Address'] . "</th>";
            echo "<th>" . $employee['Position'] . "</th>";
            echo "<th>" . $employee['Status'] . "</th>";
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
            <li><a href="/pages/books.php"><img src="../assets/NavBar/ManageBooks.png" alt="Book Dashboard">Book Dashboard</a></li>
            <li><a href="/pages/patrons.php"><img src="../assets/NavBar/ManagePatrons.png" alt="Manage Patrons">Manage Patrons</a></li>
            <li><a href="/pages/employees.php" class="activePage"><img src="../assets/NavBar/Reservations.png" alt="Manage Employees">Manage Employees</a></li>
            <li><a href="/pages/fines.php"><img src="../assets/NavBar/Payments.png" alt="Payments/Fines">Payments/Fines</a></li>
        </ul>
    </div>
    <body class="background">
    <div class="spacer"></div>
        <div class="tableBackground">
            <table>
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Position</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <?php displayEmployees(getEmployees()); ?>
                </tbody>
            </table>
        </div>
    </body>


</html>