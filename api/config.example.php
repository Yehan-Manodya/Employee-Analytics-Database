<?php
// Database configuration
// COPY this file to config.php and update with your credentials

define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', ''); // Add your password here
define('DB_NAME', 'employee_analytics');

// Create connection
function getDBConnection() {
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
    
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    return $conn;
}

// Enable CORS for local development
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
?>