CREATE DATABASE IF NOT EXISTS gadget_management;
USE gadget_managemnet;

CREATE TABLE gadgets(
	id INT AUTO_INCREMENT PRIMARY KEY,
    student_number VARCHAR(20),
    fname VARCHAR(50),
    lname VARCHAR(50),
    id_number VARCHAR(20),
    serial_number VARCHAR(50),
    reciept_id VARCHAR(50),
    time_stamp DATETIME);