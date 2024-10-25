CREATE TABLE salary_import (
    employee_id bigserial,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    department VARCHAR(100),
    salary NUMERIC(10,2),
    hire_date DATE
);

COPY salary_import 
FROM 'C:/Users/PaulE/SQL/import/Salary/salary_import.csv' 
WITH (FORMAT CSV, DELIMITER '|', QUOTE ',', HEADER ON);