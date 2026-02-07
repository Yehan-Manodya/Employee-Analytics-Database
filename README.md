# 🏢 Employee Performance Analytics System

A full-stack database project demonstrating SQL, PHP, and JavaScript skills for data-driven decision making.

## 📊 Project Overview

This project showcases a complete employee management and analytics system with a MySQL database backend, PHP API, and interactive frontend dashboard.

## ✨ Features

- **Normalized Database Schema** - 5 interconnected tables with proper relationships
- **RESTful API** - PHP endpoints for data retrieval
- **Interactive Dashboard** - Real-time employee statistics and directory
- **Performance Tracking** - Employee reviews and project assignments
- **Responsive Design** - Modern UI with gradient styling

## 🛠️ Tech Stack

- **Database:** MySQL (via XAMPP)
- **Backend:** PHP 8.2
- **Frontend:** HTML5, CSS3, JavaScript (ES6+)
- **Server:** Apache 2.4
- **Tools:** VS Code, phpMyAdmin

## 📁 Project Structure
```
employee-analytics-db/
├── api/
│   ├── config.php              # Database connection
│   └── get_employees.php       # Employee data API
├── database/
│   └── schema.sql              # Database schema & sample data
├── public/
│   ├── index.html              # Main dashboard
│   ├── style.css               # Styling
│   └── script.js               # Frontend logic
└── README.md
```

## 🗄️ Database Schema

### Tables:
1. **departments** - Department information
2. **employees** - Employee records with foreign key to departments
3. **performance_reviews** - Employee performance ratings
4. **projects** - Project details
5. **employee_projects** - Many-to-many relationship (employees ↔ projects)

### Key Relationships:
- Employees → Departments (Many-to-One)
- Performance Reviews → Employees (Many-to-One)
- Employees ↔ Projects (Many-to-Many)

## 🚀 Setup Instructions

### Prerequisites
- XAMPP installed (Apache + MySQL)
- Web browser

### Installation Steps

1. **Clone the repository**
```bash
   git clone https://github.com/YOUR_USERNAME/employee-analytics-db.git
```

2. **Move to XAMPP htdocs**
```bash
   # Copy project to:
   C:\xampp\htdocs\employee-analytics-db\
```

3. **Start XAMPP Services**
   - Open XAMPP Control Panel
   - Start **Apache**
   - Start **MySQL**

4. **Import Database**
   - Go to `http://localhost/phpmyadmin`
   - Click **Import**
   - Select `database/schema.sql`
   - Click **Go**

5. **Access the Application**
   - Dashboard: `http://localhost/employee-analytics-db/public/`
   - API: `http://localhost/employee-analytics-db/api/get_employees.php`

## 📊 Sample Queries
```sql
-- Average salary by department
SELECT d.dept_name, AVG(e.salary) as avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Top performers
SELECT e.first_name, e.last_name, AVG(pr.rating) as avg_rating
FROM employees e
JOIN performance_reviews pr ON e.emp_id = pr.emp_id
GROUP BY e.emp_id
ORDER BY avg_rating DESC;
```

## 🎯 Skills Demonstrated

- Database design & normalization
- SQL queries (JOINs, aggregates, subqueries)
- RESTful API development
- Asynchronous JavaScript (Fetch API)
- Responsive web design
- Version control with Git

## 🔮 Future Enhancements

- [ ] Add data visualization with Chart.js
- [ ] Implement CRUD operations (Create, Update, Delete)
- [ ] User authentication system
- [ ] Export data to CSV/Excel
- [ ] Advanced analytics dashboard
- [ ] Search and filter functionality

## 📸 Screenshots

![Dashboard](screenshots/dashboard.png)
*Employee Analytics Dashboard*

## 👤 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your LinkedIn](https://linkedin.com/in/yourprofile)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Built as part of portfolio development for AI/ML/Data Analyst roles
- Sample data is fictional for demonstration purposes
```

---

### **Step 2: Create .gitignore**

**File: `.gitignore`** (in root folder)
```
# Database configuration (sensitive)
api/config.php

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE files
.vscode/
.idea/

# Temporary files
*.tmp
*.log