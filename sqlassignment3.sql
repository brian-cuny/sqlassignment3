#Brian
#Assignment 3

DROP TABLE IF EXISTS groupsrooms;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS rooms;


CREATE TABLE groups(
 groups_id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
 name varchar(50) NOT NULL
);

CREATE TABLE users(
 users_id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
 name varchar(50) NOT NULL,
 groups_id INTEGER,
 foreign key(groups_id) references groups(groups_id)
);


CREATE TABLE rooms(
 rooms_id INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
 name varchar(50) NOT NULL
);

CREATE TABLE groupsrooms(
 groups_id INTEGER NOT NULL,
 rooms_id INTEGER NOT NULL,
 foreign key(groups_id) references groups(groups_id),
 foreign key(rooms_id) references rooms(rooms_id)
);
 
INSERT INTO groups(name)
VALUES
('IT'),
('Sales'),
('Administration'),
('Operations');
 
INSERT INTO users(name, groups_id)
VALUES
('Modesto', 1),
('Ayine', 1),
('Christopher', 2),
('Cheong woo', 2),
('Saulat', 3),
('Heidy', NULL);

INSERT INTO rooms(name)
VALUES
('101'),
('102'),
('Auditorium A'),
('Auditorium B');

 INSERT INTO groupsrooms(groups_id, rooms_id)
 VALUES
 (1, 1),
 (1, 2),
 (2, 2),
 (2, 3);
 
#Queries
 
#1
SELECT 
 G.name AS `Groups Name`,
 U.name AS `Users Name`
FROM groups AS G
LEFT JOIN users AS U
ON G.groups_id = U.groups_id
ORDER BY G.name, U.name;
 
#2
SELECT
 R.name AS `Rooms Name`,
 G.name AS `Groups Name`
FROM groupsrooms AS GR
RIGHT JOIN rooms AS R
ON R.rooms_id = GR.rooms_id
LEFT JOIN groups AS G
ON G.groups_id = GR.groups_id
ORDER BY `Rooms Name`, `Groups Name`;

#3
SELECT
 U.name AS `Users Name`,
 G.name AS `Groups Name`,
 R.name AS `Rooms Name`
FROM users AS U
LEFT JOIN groups AS G
ON U.groups_id = G.groups_id
LEFT JOIN groupsrooms as GR
ON G.groups_id = GR.groups_id
LEFT JOIN rooms AS R
ON GR.rooms_id = R.rooms_id
ORDER BY U.name, G.name, R.name;