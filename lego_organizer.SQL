CREATE DATABASE lego_organizer;
USE lego_organizer;

CREATE TABLE collectors (
  collector_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL, 
  password VARCHAR(255) NOT NULL
);

CREATE TABLE themes (
  theme_id INT PRIMARY KEY AUTO_INCREMENT,
  theme_name VARCHAR(100) NOT NULL,
  UNIQUE (theme_name) 
);

CREATE TABLE lego_sets (
  set_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  piece_count INT,
  description TEXT,
  theme_id INT,
  added_by_collector_id INT,
  FOREIGN KEY (theme_id) REFERENCES themes(theme_id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (added_by_collector_id) REFERENCES collectors(collector_id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE set_images (
  image_id INT PRIMARY KEY AUTO_INCREMENT,
  set_id INT,
  image_url VARCHAR(255),
  FOREIGN KEY (set_id) REFERENCES lego_sets(set_id) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO collectors (name, email, password) VALUES
('John Doe', 'johndoe@example.com', 'password123'),
('Methila Khandakar', 'khanda@example.com', 'mkh123');

INSERT INTO themes (theme_name) VALUES
('Star Wars'),
('Batman'),
('City');

INSERT INTO lego_sets (name, description, piece_count, theme_id, added_by_collector_id) VALUES
('Police Car','This is a detailed NYPD car set',2430, 1, 1),
('Star Wars', 'A high demand unique set', 3756, 2, 2),

INSERT INTO set_images (set_id, image_url) VALUES
(1, 'https://example.com/images/police_car.jpg'), 
(2, 'https://example.com/images/star_wars.jpg'), 
