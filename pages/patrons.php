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

function getAllPatrons($sort_column = 'Full_Name', $sort_order = 'asc') {
    $conn = connectDatabase();
    $valid_columns = ['Full_Name', 'Email', 'Phone', 'Registration_Date', 'Status'];
    $valid_orders = ['asc', 'desc'];

    $sort_column = in_array($sort_column, $valid_columns) ? $sort_column : 'Full_Name';
    $sort_order = in_array($sort_order, $valid_orders) ? $sort_order : 'asc';

    $sql = "SELECT 
        CONCAT(c.first_name, ' ', c.last_name) AS Full_Name,
        c.email AS Email,
        c.phone_number AS Phone,
        CONCAT(
            COALESCE(street_number, ''),
            CASE WHEN street_number IS NOT NULL AND street_name IS NOT NULL THEN ' ' ELSE '' END,
            COALESCE(street_name, ''),
            CASE WHEN apt_number IS NOT NULL THEN CONCAT(' #', apt_number) ELSE '' END,
            ', ',
            COALESCE(city, ''),
            ', ',
            COALESCE(state, ''),
            ' ',
            COALESCE(zip, '')
        ) AS Full_Address,
        c.registration_date AS Registration_Date,
        c.status AS Status
    FROM 
        Customer c
    ORDER BY 
        $sort_column $sort_order;";

    $result = $conn->query($sql);
    
    $patrons = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $patrons[] = $row;
        }
    }
    $conn->close();
    return [
        'patrons' => $patrons,
        'sort_column' => $sort_column,
        'sort_order' => $sort_order,
        'toggle_order' => ($sort_order === 'asc') ? 'desc' : 'asc'
    ];
}

$patron_data = getAllPatrons(
    $_GET['sort'] ?? 'Full_Name', 
    $_GET['order'] ?? 'asc'
)
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
            <li><a href="/pages/patrons.php" class="activePage"><img src="../assets/NavBar/ManagePatrons.png" alt="Manage Patrons">Manage Patrons</a></li>
            <li><a href="/pages/employees.php"><img src="../assets/NavBar/Reservations.png" alt="Manage Employees">Manage Employees</a></li>
        </ul>
    </div>
    <body class="background">
    <div class="spacer"></div>
    <div class="tableBackground">
            <table>
                <thead>
                  <tr>
                    <th onclick="window.location.href='?sort=Full_Name&order=<?php echo $patron_data['sort_column'] === 'Full_Name' ? $patron_data['toggle_order'] : 'asc'; ?>'">
                        Name <?php echo $patron_data['sort_column'] === 'Full_Name' ? ($patron_data['sort_order'] === 'asc' ? '▲' : '▼') : ''; ?>
                    </th>
                    <th onclick="window.location.href='?sort=Email&order=<?php echo $patron_data['sort_column'] === 'Email' ? $patron_data['toggle_order'] : 'asc'; ?>'">
                        Email <?php echo $patron_data['sort_column'] === 'Email' ? ($patron_data['sort_order'] === 'asc' ? '▲' : '▼') : ''; ?>
                    </th>
                    <th onclick="window.location.href='?sort=Phone&order=<?php echo $patron_data['sort_column'] === 'Phone' ? $patron_data['toggle_order'] : 'asc'; ?>'">
                        Phone Number <?php echo $patron_data['sort_column'] === 'Phone' ? ($patron_data['sort_order'] === 'asc' ? '▲' : '▼') : ''; ?>
                    </th>
                    <th>
                        Address
                    </th>
                    <th onclick="window.location.href='?sort=Registration_Date&order=<?php echo $patron_data['sort_column'] === 'Registration_Date' ? $patron_data['toggle_order'] : 'asc'; ?>'">
                        Registration Date <?php echo $patron_data['sort_column'] === 'Registration_Date' ? ($patron_data['sort_order'] === 'asc' ? '▲' : '▼') : ''; ?>
                    </th>
                    <th onclick="window.location.href='?sort=Status&order=<?php echo $patron_data['sort_column'] === 'Status' ? $patron_data['toggle_order'] : 'asc'; ?>'">
                        Status <?php echo $patron_data['sort_column'] === 'Status' ? ($patron_data['sort_order'] === 'asc' ? '▲' : '▼') : ''; ?>
                    </th>
                  </tr>
                </thead>
                <?php foreach ($patron_data['patrons'] as $patron): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($patron['Full_Name']); ?></td>
                        <td><?php echo htmlspecialchars($patron['Email']); ?></td>
                        <td><?php echo htmlspecialchars($patron['Phone']); ?></td>
                        <td><?php echo htmlspecialchars($patron['Full_Address']); ?></td>
                        <td><?php echo htmlspecialchars($patron['Registration_Date']); ?></td>
                        <td><?php echo htmlspecialchars($patron['Status']); ?></td>
                    </tr>
                    <?php endforeach; ?>
              </table>
        </div>
    </body>


</html>