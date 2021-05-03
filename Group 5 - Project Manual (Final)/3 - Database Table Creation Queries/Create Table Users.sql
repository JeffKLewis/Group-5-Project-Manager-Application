----------------------------------------------------
--Users Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='Users'
   ) 
   DROP TABLE Users
GO

----------------------------------------------------
--Users Create Table & Constraints
----------------------------------------------------
CREATE TABLE Users
(
	ID INT NOT NULL IDENTITY(1,1),
	UserName VARCHAR(20) NOT NULL,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Email VARCHAR(40) NOT NULL,
	Password VARCHAR(20) NOT NULL,
	Created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE Users
	ADD CONSTRAINT pk_Users
	PRIMARY KEY (ID);

ALTER TABLE Users
	ADD CONSTRAINT uc1_Users
	UNIQUE (UserName);

ALTER TABLE Users
	ADD CONSTRAINT uc2_Users
	UNIQUE (Email);