// Fetch and display employees
async function loadEmployees() {
    try {
        const response = await fetch('http://localhost/employee-analytics-db/api/get_employees.php');
        const employees = await response.json();
        
        // Update stats
        document.getElementById('totalEmployees').textContent = employees.length;
        
        // Populate table
        const tbody = document.getElementById('employeeTableBody');
        tbody.innerHTML = '';
        
        employees.forEach(emp => {
            const row = `
                <tr>
                    <td>${emp.emp_id}</td>
                    <td>${emp.first_name} ${emp.last_name}</td>
                    <td>${emp.email}</td>
                    <td>${emp.dept_name || 'N/A'}</td>
                    <td>Rs. ${parseFloat(emp.salary).toLocaleString()}</td>
                </tr>
            `;
            tbody.innerHTML += row;
        });
        
    } catch (error) {
        console.error('Error loading employees:', error);
    }
}

// Load data when page loads
window.addEventListener('DOMContentLoaded', loadEmployees);