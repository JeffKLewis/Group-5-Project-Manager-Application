----------------------------------------------------
--Tags Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='Tags'
   ) 
   DROP TABLE Tags
GO

----------------------------------------------------
--Tags Create Table & Constraints
----------------------------------------------------
CREATE TABLE Tags
(
	ID INT NOT NULL IDENTITY(1,1),
	Tag VARCHAR(20) NOT NULL
);

ALTER TABLE Tags
	ADD CONSTRAINT pk_Tags
	PRIMARY KEY (ID);

ALTER TABLE Tags
	ADD CONSTRAINT uc1_Tags
	UNIQUE (ID);

ALTER TABLE Tags
	ADD CONSTRAINT uc2_Tags
	UNIQUE (Tag);