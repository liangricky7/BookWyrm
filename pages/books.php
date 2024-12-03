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

function getAllBooks($sort_column = 'Title', $sort_order = 'asc') {
    $conn = connectDatabase();
    $valid_columns = ['Title', 'Author', 'Genre'];
    $valid_orders = ['asc', 'desc'];

    $sort_column = in_array($sort_column, $valid_columns) ? $sort_column : 'Title';
    $sort_order = in_array($sort_order, $valid_orders) ? $sort_order : 'asc';

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
        Book_Genre bg ON bg.book_id = b.book_id
    ORDER BY 
        $sort_column $sort_order;";

    $result = $conn->query($sql);
    
    $books = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $books[] = $row;
        }
    }
    $conn->close();
    return [
        'books' => $books,
        'sort_column' => $sort_column,
        'sort_order' => $sort_order,
        'toggle_order' => ($sort_order === 'asc') ? 'desc' : 'asc'
    ];
}

function addBook() {
    $servername = '127.0.0.1';
    $dbname = 'library';
    $username = 'root';
    $password = '';
    $title = $summary = $reading_age = $dewey_decimal = $series = $genre = $author = "";
    $message = "";
    
    // Check if form is submitted
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
    
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
    
        // Sanitize and validate input
        $title = $conn->real_escape_string(trim($_POST['title']));
        $summary = $conn->real_escape_string(trim($_POST['summary']));
        $reading_age = $conn->real_escape_string(trim($_POST['reading_age']));
        $dewey_decimal = $conn->real_escape_string(trim($_POST['dewey_decimal']));
        $series = $conn->real_escape_string(trim($_POST['series']));
        $genre = $conn->real_escape_string(trim($_POST['genre']));
        $author = $conn->real_escape_string(trim($_POST['author']));
    
        // Prepare SQL insert statement
        $sql = "INSERT INTO Book (Title, Summary, ReadingAge, DeweyDecimal, Series) 
                VALUES (?, ?, ?, ?, ?, ?, ?)";
    
        // Prepare and bind
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("sssssss", $title, $summary, $reading_age, $dewey_decimal, $series, $genre, $author);
    
        // Execute the statement
        if ($stmt->execute()) {
            $message = "New book added successfully!";
            
            // Clear form fields after successful submission
            $title = $summary = $reading_age = $dewey_decimal = $series = $genre = $author = "";
        } else {
            $message = "Error: " . $stmt->error;
        }
    
        // Close statement and connection
        $stmt->close();
        $conn->close();
    }
}

$book_data = getAllBooks(
    $_GET['sort'] ?? 'Title', 
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
            <li><a href="/pages/books.php" class="activePage"><img src="../assets/NavBar/ManageBooks.png" alt="Book Dashboard">Book Dashboard</a></li>
            <li><a href="/pages/patrons.php"><img src="../assets/NavBar/ManagePatrons.png" alt="Manage Patrons">Manage Patrons</a></li>
            <li><a href="/pages/employees.php"><img src="../assets/NavBar/Reservations.png" alt="Manage Employees">Manage Employees</a></li>
        </ul>
    </div>
    <body class="background">
    <div class="spacer"></div>
    <div class="tableBackground">
            <table>
                <thead>
                  <tr>
                    <th onclick="window.location.href='?sort=Title&order=<?php echo $book_data['sort_column'] === 'Title' ? $book_data['toggle_order'] : 'asc'; ?>'">
                        Book Title <?php echo $book_data['sort_column'] === 'Title' ? ($book_data['sort_order'] === 'asc' ? '▲' : '▼') : ''; ?>
                    </th>
                    <th onclick="window.location.href='?sort=Author&order=<?php echo $book_data['sort_column'] === 'Author' ? $book_data['toggle_order'] : 'asc'; ?>'">
                        Author <?php echo $book_data['sort_column'] === 'Author' ? ($book_data['sort_order'] === 'asc' ? '▲' : '▼') : ''; ?>
                    </th>
                    <th>Synopsis</th>
                    <th onclick="window.location.href='?sort=Genre&order=<?php echo $book_data['sort_column'] === 'Genre' ? $book_data['toggle_order'] : 'asc'; ?>'">
                        Genre <?php echo $book_data['sort_column'] === 'Genre' ? ($book_data['sort_order'] === 'asc' ? '▲' : '▼') : ''; ?>
                    </th>
                  </tr>
                </thead>
                <tbody> 
                    <?php foreach ($book_data['books'] as $book): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($book['Title']); ?></td>
                        <td><?php echo htmlspecialchars($book['Author']); ?></td>
                        <td><?php echo htmlspecialchars($book['Summary']); ?></td>
                        <td><?php echo htmlspecialchars($book['Genre']); ?></td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
              </table>
        </div>
    </body>


</html>