<?php
// Database connection details
$servername = "localhost";  // Database server (localhost for local dev)
$username = "root";         // MySQL username (root for local setup)
$password = "";             // MySQL password (empty by default for local dev)
$dbname = "library";    // Database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected!<br>";

// Path to SQL setups
$sql_init_file = 'sql/setup/initialize_table.sql';
$sql_data_file = 'sql/setup/initialize_data.sql';

// Read Initialization SQL file
$sql = file_get_contents($sql_init_file);
if (!$sql) {
    die("Failed to read Initialization SQL File.");
}

// Execute Initialization
if ($conn -> multi_query($sql)) {
    echo "Initialization successfully executed.";
} else { 
    echo "Error executing Initalzation SQL: " . $conn->error . "";
}

// Read Data Insertion SQL file
$sql = file_get_contents($sql_data_file);
if (!$sql) {
    die("Failed to read Data Insertion SQL File.");
}

// Execute Data Insertion
if ($conn -> multi_query($sql)) {
    echo "Data Insertion successfully executed.";
} else { 
    echo "Error executing Addition SQL: " . $conn->error . "";
}


// Close the database connection
$conn->close();
?>
