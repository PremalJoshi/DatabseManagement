USE mydb;

select * from country;
-- Insert queries for country table
INSERT INTO country VALUES(1,'India');
INSERT INTO country VALUES(2,'Pakistan');
INSERT INTO country VALUES(3,'Canada');
INSERT INTO country VALUES(4,'New Zeland');
INSERT INTO country VALUES(5,'Qatar');
INSERT INTO country VALUES(6,'Mexico');
INSERT INTO country VALUES(7,'Oman');
INSERT INTO country VALUES(8,'Australia');
INSERT INTO country VALUES(9,'USA');
INSERT INTO country VALUES(10,'South Africa');

-- Insert Queries for province table
SELECT * FROM province;
INSERT INTO province VALUES(1,'Gujarat',1);
INSERT INTO province VALUES(2,'Maharashtra',1);
INSERT INTO province VALUES(3,'Lahore',2);
INSERT INTO province VALUES(4,'Islamabad',2);
INSERT INTO province VALUES(5,'Quebec',3);
INSERT INTO province VALUES(6,'Nova Scotia',3);
INSERT INTO province VALUES(7,'Auckland',4);
INSERT INTO province VALUES(8,'Nelson',3);
INSERT INTO province VALUES(9,'Doha',5);
INSERT INTO province VALUES(10,'Jalsico',6);
INSERT INTO province VALUES(11,'Sonora',6);
INSERT INTO province VALUES(12,'Wusta',7);
INSERT INTO province VALUES(13,'Dhofar',7);
INSERT INTO province VALUES(14,'Queensland',8);
INSERT INTO province VALUES(15,'Victoria',8);
INSERT INTO province VALUES(16,'California',9);
INSERT INTO province VALUES(17,'Texas',9);
INSERT INTO province VALUES(18,'Gauteng',10);
INSERT INTO province VALUES(19,'Limpopo',10);

-- Insert Queries for city table
SELECT * FROM city;
INSERT INTO city VALUES(1,'Ahmedabad',1),(2,'Karachi',3),
(3,'Montreal',5),(4,'Auckland',7),(5,'Doha',9),(6,'Mexico city',10),(7,'Muscat',12),(8,'Brisbane',14),(9,'Midrand',18), 
(10,'Los Angeles',16);


-- Insert Queries of client table
SELECT * FROM client;
INSERT INTO client VALUES(1,'Shubham','Mevada','shubh.mevada@gmail.com','Pushkar Flats,Paldi',9998755510,1),
(2,'Shivam','Sheth','shiv.sheth@gmail.com','Adani Bunglows',7772256561,2),
(3,'Premal','Joshi','prem.joshi@gmail.com','Sunrise Flats',8523697410,3),
(4,'Nirav','Paneliya','nirav.paneliya@gmail.com','Galaxy Row house',4557422210,4),
(5,'Mihir','Vora','mihir.vora@gmail.com','White Orchid',1001001001,5),
(6,'Smith','Patel','smith.patel@gmail.com','Orchid Bunglows',2201458740,6),
(7,'Bittu','Shah','bittu.shah@gmail.com','Golf out field',4571259631,7),
(8,'Vatsal','Mehta','vatsal.mehta@gmail.com','Watch Dogs',7854123598,8),
(9,'Aaryan','Bhatt','aaryan.bhatt@gmail.com','Red Street',1258472536,9),
(10,'Yash','Mistry','yash.mistry@gmail.com','Shyam Sundar Heights',4785954125,10);

INSERT INTO client VALUES(11,'Shivay','Mehta','shivaym@gmail.com','Rajnagar,chandranagar',9998755519,1),
(12,'Shiv','Shah','shivshah@gmail.com','Pushpak Flats,Maninagar',9998757819,2),
(13,'Saumya','Shah','saumyaS@gmail.com','Luv kush soc, Manekbaug',9398755519,3),
(14,'Nancy','Joshi','nancyJ@gmail.com','Astha apt,Ghatlodia',9788745519,4),
(15,'Rahul','Mehra','RahulM@gmail.com','Reshma Bunglows,Kankaria',9992655519,5),
(16,'Suraj','Panchal','surajPanchal@gmail.com','Sun Bunglows, Thaltej',9998895519,6);

INSERT INTO client VALUES
(17,'Megha','Bhatt','mbhatt@gmail.com','Pushkar Flats,Paldi',9998723519,1),
(18,'Mayur','Patel','mayurpatel45@gmail.com','Saral flats, Jivraj Park',9998723519,5);



-- Insert Queries for order table 
SELECT * FROM orders;
INSERT INTO orders VALUES(1,'1999-05-31',8,5,1),
(2,'1999-08-10',10,5,2),
(3,'2000-12-17',15,5,3),
(4,'1999-02-25',20,5,4),	
(5,'1998-01-20',12,5,5),
(6,'1999-10-25',08,5,6),
(7,'2000-11-27',10,5,7),
(8,'1997-09-30',30,5,8),
(9,'2000-08-14',10,5,9),
(10,'1999-05-10',5,5,10);

INSERT INTO orders VALUES(11,'1998-01-25',12,5,5);


INSERT INTO orders VALUES(12,'1998-01-27',15,5,4),
(13,'1998-01-24',20,5,6),
(14,'2000-11-29',10,5,4),
(15,'2000-11-30',15,5,8),
(16,'2000-11-26',17,5,10);

-- Insert Queries for album table 
SELECT * FROM album;
INSERT INTO album VALUES(1,'Aashiqui 2','2005-12-31',1000,5),
(2,'ABCD 2','2010-10-10',1500,2),
(3,'Agent Vinod','2015-07-08',500,7),
(4,'All Is Well','2012-12-01',1200,20),
(5,'Andhudhun','2020-05-05',2000,9),
(6,'Apne','2010-02-14',1500,11),
(7,'Badlapur','2019-10-01',1200,1),
(8,'Bajirao Mastani','2015-12-10',2500,30),
(9,'Bandish Bandits','2014-02-12',1800,45),
(10,'Batla House','2018-09-11',1000,22);



-- Insert Queries for artist table
SELECT * FROM artist; 
INSERT INTO artist VALUES(1,'Amaal','Malik','1991-12-10','Meghdhanush'),
(2,'Jassi','Katyal','1990-10-12','Indian Ocean'),
(3,'Amit','Trivedi','1885-07-01','Parikrama'),
(4,'Ammy','Virk','1885-01-01','Avail'),
(5,'AP',' Dhillon','1990-10-22','Euphoria'),
(6,'Yo Yo','Honey Singh','1989-05-17','Agnee'),
(7,'Asha','Bhosle','1975-01-27','Coshish'),
(8,'B.','Praak','1980-07-18','Cassini Divisionn'),
(9,'Bappi','Lahiri','1965-12-12','Still Waters'),
(10,'Benny','Dayal','1988-04-11','Inner Sanctum');

-- Insert Queries for genre table
SELECT * FROM genre;
INSERT INTO genre VALUES(1,'Rock'),
(2,'Jazz'),
(3,'Pop music'),
(4,'Hip hop'),
(5,'Country Music'),
(6,'Classical'),
(7,'Fol Music'),
(8,'Dance Music'),
(9,'Soul Music'),
(10,'Disco');


-- Insert Queries for tracks table
SELECT * FROM tracks;
INSERT INTO tracks VALUES(1,'Nazm Nazm','3.10mins',500,1,20,1,1),
(2,'Aaj Se Teri','2.55mins',550,2,5,2,2),
(3,'Main tere kabil hoon','4.00mins',500,3,8,3,3),
(4,'Enna Sonna','7.59mins',1200,4,10,4,4),
(5,'Humsafar','5.25mins',660,5,13,5,5),
(6,'Befikar','3.39mins',700,6,15,6,6),
(7,'Jab Tak','4.10mins',800,7,7,7,7),
(8,'Ban ja rani','5.50mins',950,8,12,8,8),
(9,'Lambiyaan','6.31mins',1000,9,25,9,9),
(10,'Yaara','2.12mins',1500,10,15,10,10);

INSERT INTO tracks VALUES
(11,'tera surror','3.10mins',700,5,4,1,4),
(12,'hero','4.00mins',450,3,3,3,2),
(13,'ranjhana','4.00mins',550,7,4,4,6);


-- Insert Queries for reviewer table
SELECT * FROM reviewer;
INSERT INTO reviewer VALUES(1,'Shubham Mevada','shubh.mevada@gmail.com'),
(2,'Shivam Sheth','shiv.sheth@gmail.com'),
(3,'Premal Joshi','prem.joshi@gmail.com'),
(4,'Nirav Paneliya','nirav.paneliya@gmail.com'),
(5,'Mihir Vora','mihir.vora@gmail.com'),
(6,'Smith Patel','smith.patel@gmail.com'),
(7,'Bittu Shah','bittu.shah@gmail.com'),
(8,'Vatsal Mehta','vatsal.mehta@gmail.com'),
(9,'Aaryan Bhatt','aaryan.bhatt@gmail.com'),
(10,'Yash Mistry','yash.mistry@gmail.com');

-- Insert Queries for tracks_has_review table
SELECT * FROM tracks_has_review;
INSERT INTO tracks_has_review VALUES(1,3,'2019-01-22',1,1),
(2,3,'2020-02-14',2,2),
(3,3,'2020-03-18',3,3),
(4,2,'2019-04-28',4,4),
(5,3,'2020-05-11',5,5),
(6,5,'2019-06-01',6,6),
(7,1,'2019-07-30',7,7),
(8,4,'2020-08-03',8,8),
(9,5,'2019-09-29',9,9),
(10,5,'2019-10-31',10,10);

-- Insert Queries for album_has_review table
SELECT * FROM album_has_review;
INSERT INTO album_has_review VALUES(1,5,'2020-02-14',1,1),
(2,4,'2020-02-14',2,2),
(3,5,'2020-03-18',3,3),
(4,2,'2019-04-28',4,4),
(5,1,'2020-05-11',5,5),
(6,3,'2019-06-01',6,6),
(7,5,'2019-07-30',7,7),
(8,4,'2020-08-03',8,8),
(9,3,'2019-09-29',9,9),
(10,5,'2019-10-31',10,10);


-- Inser Queries for Order_items
-- order_item_id, Price, quantity, track_id, album_id, order_id
SELECT * FROM Order_items;
INSERT INTO Order_items VALUES(1,'Aashiqui 2', 500, 1, 1, 3, 10),
(2,'Nazm Nazm', 550, 9, 2, 4, 9),
(3,'Befikar', 500, 8, 3, 5, 8),
(4,'Andhudhun', 1200, 7, 4, 6, 7),
(5,'Bandish Bandits', 660, 6, 5, 7, 6),
(6,'Main tere kabil hoon', 700, 5, 6, 8, 5),
(7,'Yaara', 800, 4, 7, 9, 4),
(8,'Baarfi',950, 3, 8, 2, 3),
(9,'Krishh',1000, 2, 9, 1, 2),
(10,'Ya ali',1500, 1, 10, 3, 1);
INSERT INTO Order_items VALUES
(11,'udta punjab',1500, 12, 2, 3, 11)