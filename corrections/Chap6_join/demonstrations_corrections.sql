CREATE TABLE salaries (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom varchar(30)
 );

 INSERT INTO salaries(nom)
 VALUES ( 'Alice Johnson'),
('Bob Smith'),
('Charlie Brown'),
('Dana White');

CREATE TABLE projects (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name_project varchar(30)
 );

 INSERT INTO projects
 VALUES (1, 'Phoenix'),
(2,'Apollo'),
(5, 'Odyssey'),
(6, 'Voyager');
