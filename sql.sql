-- Create the final_BMS database
CREATE DATABASE IF NOT EXISTS final_BMS;

-- Use the final_BMS database
USE final_BMS;

-- Create the book table
CREATE TABLE IF NOT EXISTS book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL
);

-- Insert the books with real information
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


DROP TABLE IF EXISTS `authorities`;
DROP TABLE IF EXISTS `users`;


CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Insert user data
INSERT INTO users (username, password, enabled) VALUES
('john', '{noop}test123', true),
('mary', '{noop}test123', true),
('susan', '{noop}test123', true),
('james', '{noop}test123', true);






-- Drop tables if they exist
DROP TABLE IF EXISTS authorities;


--
-- Table structure for table `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Inserting data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('john','ROLE_EMPLOYEE'),
('mary','ROLE_EMPLOYEE'),
('mary','ROLE_MANAGER'),
('susan','ROLE_EMPLOYEE'),
('susan','ROLE_MANAGER'),
('susan','ROLE_ADMIN'),
('james','ROLE_CUSTOMER');


DROP TABLE IF EXISTS `roles`;
DROP TABLE IF EXISTS `members`;


--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `user_id` varchar(50) NOT NULL,
  `pw` char(68) NOT NULL,
  `active` tinyint NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `members`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: https://www.luv2code.com/generate-bcrypt-password
--
-- Default passwords here are: fun123
--

INSERT INTO `members`
VALUES
('john','{noop}test123',1),
('mary','{noop}test123',1),
('susan','{noop}test123',1),
('james','{noop}test123',1);


--
-- Table structure for table `authorities`
--

CREATE TABLE `roles` (
  `user_id` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `authorities5_idx_1` (`user_id`,`role`),
  CONSTRAINT `authorities5_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `members` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Inserting data for table `roles`
--

INSERT INTO `roles`
VALUES
('john','ROLE_EMPLOYEE'),
('mary','ROLE_EMPLOYEE'),
('mary','ROLE_MANAGER'),
('susan','ROLE_EMPLOYEE'),
('susan','ROLE_MANAGER'),
('susan','ROLE_ADMIN'),
('james','ROLE_CUSTOMER');
