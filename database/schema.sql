-- Create Database
CREATE DATABASE IF NOT EXISTS employee_analytics;
USE employee_analytics;

-- Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    dept_id INT,
    hire_date DATE,
    salary DECIMAL(10, 2),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Performance Reviews Table
CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    review_date DATE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

-- Projects Table
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    status ENUM('Planning', 'Active', 'Completed', 'On Hold')
);

-- Employee Projects (Many-to-Many)
CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    role VARCHAR(50),
    hours_worked DECIMAL(5, 2),
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert Sample Data
INSERT INTO departments (dept_name, location) VALUES
('Engineering', 'Colombo'),
('Marketing', 'Kandy'),
('Sales', 'Galle'),
('HR', 'Colombo');

INSERT INTO employees (first_name, last_name, email, dept_id, hire_date, salary) VALUES
('Nimal', 'Perera', 'nimal@company.lk', 1, '2022-01-15', 120000),
('Saman', 'Silva', 'saman@company.lk', 1, '2021-06-20', 95000),
('Kamala', 'Fernando', 'kamala@company.lk', 2, '2023-03-10', 85000),
('Ruwan', 'Jayasinghe', 'ruwan@company.lk', 3, '2022-09-05', 78000),
('Dilini', 'Wickramasinghe', 'dilini@company.lk', 4, '2020-11-25', 105000);

INSERT INTO projects (project_name, start_date, end_date, status) VALUES
('Website Redesign', '2024-01-01', '2024-06-30', 'Active'),
('Mobile App Development', '2023-09-01', '2024-03-31', 'Completed'),
('Marketing Campaign Q1', '2024-01-01', '2024-03-31', 'Completed');

INSERT INTO performance_reviews (emp_id, review_date, rating, comments) VALUES
(1, '2024-01-15', 5, 'Excellent performance'),
(2, '2024-01-20', 4, 'Good team player'),
(3, '2024-02-10', 4, 'Creative solutions');