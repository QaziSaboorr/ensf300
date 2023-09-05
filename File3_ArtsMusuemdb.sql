DROP DATABASE IF EXISTS ArtsMusuem;
CREATE DATABASE ArtsMusuem; 
USE ArtsMusuem;


DROP TABLE IF EXISTS ART_OBJECT;
CREATE TABLE ART_OBJECT (
	ID_NO					integer not null,
	Artist_name				varchar(50),
	Title			        varchar(50) ,
    Description_			varchar(20) ,
    Year_                   integer,
    Origin                  varchar(20) ,
    Epoch                   varchar(20) ,
	primary key (ID_NO)
);


INSERT INTO ART_OBJECT (ID_NO, Artist_name, Title, Description_,Year_,Origin,Epoch)
VALUES
(1,'Hans Eworth','Mary I','Painting',1554,'England','Renaissance'),
(2,'Gullim Scrotts','Edward VI','Painting',1547,'England','Renaissance'),
(3,'Benedetto Da Rovezzano','Angel Bearing','Sculpture',1524,'Italian','Renaissance'),
(4,null,'Field Armor of King Henry VII','Other',1544,'Italian','Renaissance'),
(5,null,'John The Evangelist','Sculpture',1505,'England','Renaissance'),
(6,'Master of Claude de France','Book of Hours of Mary of England, Queen of France','Other',1495,'France','Renaissance'),
(7,'Pablo Picasso','Still Life With Chair Caning','Painting',1912,'Spanish','Modern'),
(8,'Samuel Van Hoogstraten','Trompe Ioiell still life','Painting',1666,'Dutch','Modern'),
(9,'Pablo Picasso','Composition With Violin','Painting',1912,'France','Modern'),
(10, 'Unrecorded Edgefield Histrict Potter', 'Storage Jar','Other',1846,'America','Modern'),
(11,'Benjamin F.landrum','Jug','Other',1846,'America','Modern'),
(12,null,'Box Lid With a Pheonix','Sculptures',500,'Pakistan','Ancient');


DROP TABLE IF EXISTS PAINTINGS;
CREATE TABLE PAINTINGS(
    Art_Object_ID               integer not null,
    Paint_type                  varchar(10) not null,
    Drawn_on                    varchar(10) not null,
    Style                       varchar(10) not null,
    primary key(Art_Object_ID),
    foreign key(Art_Object_ID) references ART_OBJECT(ID_NO)
);


INSERT INTO PAINTINGS (Art_Object_ID,Paint_type,Drawn_on,Style)
VALUES 
(1,'Oil','Panel','Still'),
(2,'Oil','Panel','Still'),
(7,'Oil','Canvas','Still'),
(8,'Ink','Paper','Abstract'),
(9,'Oil','Paper','Modern');


DROP TABLE IF EXISTS SCULPTURE;
CREATE TABLE SCULPTURE (
    Art_Object_ID               integer,
    Height_cm                   integer,
    Material                    varchar(20),
    Weight_KG                   integer,
    Style                       varchar(20),
    primary key (Art_Object_ID),
    foreign key (Art_Object_ID) references ART_OBJECT(ID_NO)
);


INSERT into SCULPTURE(Art_Object_ID,Height_cm,Material,Weight_KG,Style) VALUES
(3,103,'Bronze',178,'Modelling'),
(5,48,'Terracotta',89,'Carving'),
(12,11,'Silver',20,'Carving');


DROP TABLE IF EXISTS OTHER;
CREATE TABLE OTHER(
    Art_Object_ID           integer not null,
    Type_                   varchar(20)  not null,
    Style                   varchar(20),
    primary key (Art_Object_ID),
    foreign key(Art_Object_ID) references ART_OBJECT(ID_NO)
);


INSERT INTO OTHER(Art_Object_ID,Type_,Style) VALUES

(4,'Armor','Man'),
(6,'Print','Manuscripts'),
(10,'Stonewave','Alkaline-glazed'),
(11,'Stone','Roman');


DROP TABLE IF EXISTS PERMANENTCOLLECTION;
CREATE TABLE PERMANENTCOLLECTION(
    Art_Object_ID           integer not null,
    Date_acquired_          DATE,
    Status_                 varchar(20) not null,
    Cost_$                  integer not null,
    primary key(Art_Object_ID),
    foreign key(Art_Object_ID) references ART_OBJECT(ID_NO)
);


INSERT INTO PERMANENTCOLLECTION(Art_Object_ID,Date_acquired_,Status_,Cost_$) VALUES
(1,'2002-10-10','Dislay',200000),
(2,'2022-10-10','Display',540000),
(3,'2022-06-24','Loan',29500),
(4,'2021-08-19','Stored',42000),
(5,'2020-07-05','Stored',59600),
(6,'2022-10-10','Display',5000),
(12,'2018-12-07','Loan',12600);


DROP TABLE IF EXISTS BORROWED;
CREATE TABLE BORROWED(
    Art_Object_ID       integer,
    DateBorrowed        DATE,
    DateReturned        DATE,
    Collectionborrowedfrom varchar(30),
    primary key(Art_Object_ID),
    foreign key (Art_Object_ID) references ART_OBJECT(ID_NO)
);


INSERT INTO BORROWED(Art_Object_ID,DateBorrowed,DateReturned,Collectionborrowedfrom) VALUES 
(7,'2015-04-10','2018-06-29',null),
(8,'2017-01-19','2017-03-01',null),
(9,'2020-03-21','2021-12-12',null),
(10,'2022-04-20','2022-05-06',null),
(11,'2021-11-09','2022-08-17',null);


DROP TABLE IF EXISTS EXHIBITIONS;
CREATE TABLE EXHIBITIONS(
    Art_Object_ID       integer,
    Name_               varchar(50),
    StartDate        Date,
    EndDate          Date,
    primary key(Art_Object_ID),
    foreign key (Art_Object_ID) references ART_OBJECT(ID_NO)       
);

INSERT INTO EXHIBITIONS(Art_Object_ID,Name_,StartDate,EndDate) VALUES 
(1,'The tudors:Art and Majesty in Renaissance England','2022-10-10','2023-01-08'),
(2,'The tudors:Art and Majesty in Renaissance England','2022-10-10','2023-01-08'),
(6,'The tudors:Art and Majesty in Renaissance England','2022-10-10','2023-01-08');


DROP TABLE IF EXISTS ARTIST;
CREATE TABLE ARTIST(
    Art_Object_ID                   integer,
    Name_                           varchar(50),
    Date_born                       integer,
    Date_Died                       integer,
    Country_of_Origin               varchar(50),
    Epoch                          varchar(12),
    Mainstyle                       varchar(10),
    Description_                    varchar(14),
    primary key(Art_Object_ID),
    foreign key(Art_Object_ID) references ART_OBJECT(ID_NO)
    
);


INSERT INTO ARTIST (Art_Object_ID,Name_,Date_born,Date_Died,Country_of_Origin,Epoch,Mainstyle,Description_) VALUES
(1,"Hans Eworth",1520,1574,'Netherlands','Renaissance','Painting','Canvas'),
(2,'Gullim Scrotts', 1518,1562,'France','Renaissance','Painting','Canvas'),
(3,'Benedetto Da Rovezzano',1474,1552,'Italy','Renaissance','Sculpture','Bronze'),
(6,'Master of Claude De France',1503,1561,'France','Renaissance','Literature','Paper'),
(7,'Pablo Picasso',1881,1973,'Spain','Modern','Painting','Carving'),
(8,'Samuel Van Hoogstraten',1627,1678,'Netherlands','Modern','Painting','Still life'),
(9,'Pablo Picasso',1881,1973,'Spain','Modern','Painting','Carving'),
(10,'Unrecorded Edgefield Histrict Potter',1808,1868,'America','Modern','Sculpture','Jar');
