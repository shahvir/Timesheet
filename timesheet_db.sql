DROP DATABASE timesheet;
CREATE DATABASE timesheet;
USE timesheet;
CREATE TABLE employee(
	employee_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
	first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    user_name VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
	UNIQUE(first_name,last_name)
    );
CREATE TABLE client(
	client_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
	first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(50),
    UNIQUE(first_name,last_name)
    );
    
CREATE TABLE project(
	project_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	name VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(50) NOT NULL,
	client_first_name VARCHAR(50) REFERENCES client(first_name) ON DELETE CASCADE ON UPDATE CASCADE,
    client_last_name VARCHAR(50) REFERENCES client(last_name) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE schedule(
	schedule_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	employee_id INT REFERENCES employee(employee_id),
    project_id INT REFERENCES project(project_id),
	date DATE NOT NULL,
    hour double NOT NULL
    );

