<?php
require_once 'config.php';

$conn = getDBConnection();

$sql = "SELECT e.*, d.dept_name 
        FROM employees e 
        LEFT JOIN departments d ON e.dept_id = d.dept_id";

$result = $conn->query($sql);

$employees = array();
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $employees[] = $row;
    }
}

echo json_encode($employees);
$conn->close();
?>