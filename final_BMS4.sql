-- Create the final_BMS4 database
CREATE DATABASE IF NOT EXISTS final_BMS4;

-- Use the final_BMS4 database
USE final_BMS4;

-- Drop tables if they already exist to avoid conflicts
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS roles;

-- Create the book table
CREATE TABLE IF NOT EXISTS book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL
);

-- Insert books into the book table
INSERT INTO book (title, author, price) VALUES
('The Seven Habits of Highly Effective People', 'Stephen R. Covey', 15.99),
('Atomic Habits', 'James Clear', 14.50),
('The 48 Laws of Power', 'Robert Greene', 17.25),
('Think and Grow Rich', 'Napoleon Hill', 12.99),
('Rich Dad Poor Dad', 'Robert T. Kiyosaki', 13.75),
('Les Misérables', 'Victor Hugo', 18.00),
('The Art of Thinking Clearly', 'Rolf Dobelli', 16.99),
('12 Rules for Life: An Antidote to Chaos', 'Jordan B. Peterson', 19.25),
('Rita Hayworth and Shawshank Redemption', 'Stephen King', 11.99);

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(50) NOT NULL PRIMARY KEY,
    password VARCHAR(60) NOT NULL,
    enabled TINYINT NOT NULL
);

-- Insert user data into the users table
INSERT INTO users (username, password, enabled) VALUES
('john', '{noop}test123', true),
('mary', '{noop}test123', true),
('susan', '{noop}test123', true),
('james', '{noop}test123', true);

-- Create the authorities table
CREATE TABLE IF NOT EXISTS authorities (
    username VARCHAR(50) NOT NULL,
    authority VARCHAR(50) NOT NULL,
    FOREIGN KEY (username) REFERENCES users(username),
    UNIQUE (username, authority)
);

-- Insert authority data into the authorities table
INSERT INTO authorities (username, authority) VALUES
('john', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_MANAGER'),
('susan', 'ROLE_EMPLOYEE'),
('susan', 'ROLE_MANAGER'),
('susan', 'ROLE_ADMIN'),
('james', 'ROLE_CUSTOMER');

-- Create the members table
CREATE TABLE IF NOT EXISTS members (
    user_id VARCHAR(50) NOT NULL PRIMARY KEY,
    pw CHAR(60) NOT NULL,
    active TINYINT NOT NULL
);

-- Insert member data into the members table
INSERT INTO members (user_id, pw, active) VALUES
('john', '{noop}test123', 1),
('mary', '{noop}test123', 1),
('susan', '{noop}test123', 1),
('james', '{noop}test123', 1);

-- Create the roles table
CREATE TABLE IF NOT EXISTS roles (
    user_id VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES members(user_id),
    UNIQUE (user_id, role)
);

-- Insert role data into the roles table
INSERT INTO roles (user_id, role) VALUES
('john', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_MANAGER'),
('susan', 'ROLE_EMPLOYEE'),
('susan', 'ROLE_MANAGER'),
('susan', 'ROLE_ADMIN'),
('james', 'ROLE_CUSTOMER');
