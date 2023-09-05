---------------------------------1-------------------------------

SELECT * FROM ART_OBJECT;
--Primary key of this table is the foreign key.
SELECT * FROM PAINTINGS;
--Foreign key for this table is refferd from Art_Object Table
SELECT * FROM SCULPTURE;
--Foreign key for this table is refferd from Art_Object Table
SELECT * FROM OTHER;
--Foreign key for this table is refferd from Art_Object Table
SELECT * FROM PERMANENTCOLLECTION;
--Foreign key for this table is refferd from Art_Object Table
SELECT * FROM BORROWED;
--Foreign key for this table is refferd from Art_Object Table
SELECT * FROM EXHIBITIONS;
--Foreign key for this table is refferd from Art_Object Table

---------------------------------2-------------------------------

SELECT Name_ FROM ARTIST 
WHERE 
Date_born < 1800;

---------------------------------3-------------------------------

SELECT Cost_$ FROM PERMANENTCOLLECTION
ORDER BY Cost_$;

---------------------------------4-------------------------------

SELECT Artist_name FROM ART_OBJECT
WHERE 
ID_NO IN 
(SELECT Art_Object_ID FROM PERMANENTCOLLECTION
WHERE Cost_$>100000);

---------------------------------5-------------------------------

SELECT Title, Epoch,Type_,Style 
FROM
ART_OBJECT 
JOIN OTHER
ON Art_Object_ID = ID_NO;

---------------------------------6-------------------------------

CREATE TABLE update_trigger (
    message_ VARCHAR(100)
);

DELIMITER $$
CREATE 
    TRIGGER my_update BEFORE UPDATE 
    ON ART_OBJECT
    FOR EACH ROW BEGIN
        INSERT INTO update_trigger VALUES('ARTS OBJECT UPDATED');
        END $$

DELIMITER ; --The delimiters and triggers were changed and created in terminal using MYSQL

UPDATE ART_OBJECT 
SET 
Description_ = 'Other' 
WHERE Description_ != 'Painting' AND Description_!= 'Sculpture' AND Description_ != 'Other';

---------------------------------7-------------------------------

CREATE TABLE delete_trigger (
    message_ VARCHAR(100)
);

DELIMITER $$
CREATE 
    TRIGGER my_delete BEFORE DELETE
    ON ART_OBJECT
    FOR EACH ROW BEGIN
        INSERT INTO delete_trigger VALUES('ARTS OBJECT Deleted');
        END $$

DELIMITER ; --The delimiters and triggers were changed and created in terminal using MYSQL

DELETE FROM ART_OBJECT 
WHERE Description_ != 'Other' AND Description_ != 'Painting' AND Description_!= 'Sculpture';

--------------------------------END------------------------------