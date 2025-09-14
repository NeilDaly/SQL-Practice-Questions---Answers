/* 


*/

CREATE TABLE orchestras
(
    id SERIAL PRIMARY KEY,
    name varchar(32),
    rating decimal,
    city_origin varchar (32),
    country_origin varchar (32),
    year int
);

CREATE TABLE concerts
(
    id SERIAL PRIMARY KEY,
    city varchar(64),
    country varchar (32),
    year int,
    rating decimal,
    orchestra_id int REFERENCES orchestras
);


CREATE TABLE members
(
    id INT PRIMARY KEY,
    name varchar(64),
    position varchar (32),
    experience int,
    orchestra_id int REFERENCES orchestras,
    wage int
);



INSERT INTO orchestras (name, rating, city_origin, country_origin, year)
VALUES
    ('Greatest Team', '2.0', 'Calgary', 'Canada', '2000'),
    ('Flute & Tie', '3.5', 'Vancounver', 'Canada', '2003'),
    ('6 Strings', '5.0', 'Dublin', 'Ireland', '2005');

SELECT * FROM 
orchestras;

INSERT INTO concerts (city, country, year, rating, orchestra_id)
VALUES
    ('Calgary', 'Canada', '2001', '3.0', '1'),
    ('Vancounver', 'Canada', '2003', '3.5', '2'),
    ('Dublin', 'Ireland', '2005', '4.0', '3');

SELECT * FROM 
concerts;

INSERT INTO members (Id, name, position, experience, orchestra_id, wage)
VALUES
    ('1', 'John Doe', 'Tuba', '2', '1', '1000'),
    ('2', 'Jane Doe', 'Flute', '5', '2', '2000'),
    ('3', 'Bjorn Flooper', 'Guitar', '15', '3', '5000');

SELECT * FROM
members;