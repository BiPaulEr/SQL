CREATE TABLE departments_constraint (
   dept_id bigserial PRIMARY KEY,
   dept varchar(100),
   city varchar(100)
   CONSTRAINT dept_key PRIMARY KEY (dept_id),
   CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

CREATE TABLE employees_constraint (
   emp_id bigserial PRIMARY KEY,
   first_name varchar(100),
   last_name varchar(100),
   salary integer,
   dept_id integer REFERENCES departments_constraint (dept_id),
   CONSTRAINT emp_key PRIMARY KEY (emp_id),
   CONSTRAINT emp_dept_unique UNIQUE (emp_id, dept_id)
);

INSERT INTO departments_constraint (dept, city)
VALUES
    ('Tax', 'Atlanta'),
    ('IT', 'Boston');

INSERT INTO employees_constraint (first_name, last_name, salary, dept_id)
VALUES
    ('Nancy', 'Jones', 62500, 1),
    ('Lee', 'Smith', 59300, 1),
    ('Soo', 'Nguyen', 83000, 2),
    ('Janet', 'King', 95000, 2);
