CREATE TABLE departments (
   dept_id bigserial PRIMARY KEY,
   dept varchar(100),
   city varchar(100)
);

CREATE TABLE employees (
   emp_id bigserial PRIMARY KEY,
   first_name varchar(100),
   last_name varchar(100),
   salary integer,
   dept_id integer REFERENCES departments (dept_id)
);

INSERT INTO departments (dept, city)
VALUES
    ('Tax', 'Atlanta'),
    ('IT', 'Boston');

INSERT INTO employees (first_name, last_name, salary, dept_id)
VALUES
    ('Nancy', 'Jones', 62500, 1),
    ('Lee', 'Smith', 59300, 1),
    ('Soo', 'Nguyen', 83000, 2),
    ('Janet', 'King', 95000, 2);
