<?php
// db_functions.php
function createDatabase($conn, $dbname) {
    $sql = "CREATE DATABASE IF NOT EXISTS $dbname";
    if ($conn->query($sql) === TRUE) {
        echo "Database '$dbname' created successfully.<br>";
    } else {
        echo "Error creating database: " . $conn->error . "<br>";
    }
}

function createUsersTable($conn) {
    $sql = "CREATE TABLE IF NOT EXISTS users (
        id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) NOT NULL,
        email VARCHAR(100) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )";
    if ($conn->query($sql) === TRUE) {
        echo "Table 'users' created successfully.<br>";
    } else {
        echo "Error creating table: " . $conn->error . "<br>";
    }
}

function insertSampleData($conn) {
    $sql = "INSERT INTO users (username, email) VALUES ('John Doe', 'johndoe@example.com')";
    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully.<br>";
    } else {
        echo "Error inserting data: " . $conn->error . "<br>";
    }
}
?>