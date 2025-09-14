-- Departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name TEXT
);

INSERT INTO departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Sales');

-- Employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name TEXT,
    dept_id INT,
    salary NUMERIC,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees (emp_id, emp_name, dept_id, salary, hire_date) VALUES
(101, 'Alice', 1, 55000, '2020-01-15'),
(102, 'Bob', 2, 60000, '2019-03-10'),
(103, 'Charlie', 3, 75000, '2021-07-22'),
(104, 'Diana', 3, 80000, '2018-06-01'),
(105, 'Eve', 4, 50000, '2022-02-10'),
(106, 'Frank', 2, 65000, '2021-12-05'),
(107, 'Grace', 4, 52000, '2019-11-30');
