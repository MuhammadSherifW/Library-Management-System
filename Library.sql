IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = N'Lib')
CREATE DATABASE Lib;

IF  EXISTS (SELECT name FROM master.sys.databases WHERE name = N'Lib')
USE Lib;


if NOT exists (select * from sysobjects where name='employees' and xtype='U')
CREATE TABLE employees
(
	ssn INT PRIMARY KEY IDENTITY(1,1),
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	phone INT NOT NULL,
	salary INT NOT NULL,
	start_date  DATE NOT NULL 


);


if NOT exists (select * from sysobjects where name='members' and xtype='U')
CREATE TABLE members
(
	memb_id INT PRIMARY KEY IDENTITY(1,1),
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	phone INT NOT NULL,
	start_date  DATE NOT NULL , 
	expired_date DATE NOT NULL 

);


if NOT exists (select * from sysobjects where name='publishers' and xtype='U')
CREATE TABLE publishers
(
	pub_id INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(50) NOT NULL,
	country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	street VARCHAR(50) NOT NULL,
	phone INT NOT NULL,

);


if NOT exists (select * from sysobjects where name='books' and xtype='U')
CREATE TABLE books
(
	book_id INT PRIMARY KEY IDENTITY(1,1),
	pub_id INT NOT NULL,
	name VARCHAR(50) NOT NULL,
	author VARCHAR(50) NOT NULL,
	price INT NOT NULL,
	quantity INT NOT NULL,
	pages INT NOT NULL,

	constraint fk_books_publishers FOREIGN KEY  (pub_id)
		REFERENCES publishers (pub_id) 
		ON UPDATE CASCADE
		ON DELETE CASCADE
	

);

if NOT exists (select * from sysobjects where name='borrowing' and xtype='U')
CREATE TABLE borrowing
(
	pur_id INT PRIMARY KEY IDENTITY(1,1),
	memb_id INT NOT NULL ,
	book_id INT NOT NULL ,
	start_date  DATE NOT NULL , 
	return_date DATE NOT NULL , 
	state BIT NOT NULL ,
	constraint fk_borrowing_members FOREIGN KEY  (memb_id)
		REFERENCES members (memb_id) 
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	
	constraint fk_borrowing_books FOREIGN KEY  (book_id)
		REFERENCES books (book_id) 
		ON UPDATE CASCADE
		ON DELETE CASCADE
	
);


