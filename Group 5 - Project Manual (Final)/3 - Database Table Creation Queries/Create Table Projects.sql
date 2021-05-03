----------------------------------------------------
--Projects Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='Projects'
   ) 
   DROP TABLE Projects
GO

----------------------------------------------------
--Projects Create Table & Constraints
----------------------------------------------------
CREATE TABLE Projects
(
	ID INT NOT NULL IDENTITY(1,1),
	ProjectName VARCHAR(100) NOT NULL,
	ProjectDescription VARCHAR(MAX),
	UserID INT NOT NULL,
	Created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ThemeColor VARCHAR(6) NOT NULL,
	Tombstoned BIT NOT NULL DEFAULT(0),
	TombstonedBy INT,
	TombstonedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE Projects
	ADD CONSTRAINT pk_Projects
	PRIMARY KEY (ID);

ALTER TABLE Projects
	ADD CONSTRAINT fk1_Projects
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);
	
ALTER TABLE Projects
	ADD CONSTRAINT uc1_Projects
	UNIQUE (ID);

ALTER TABLE Projects
	ADD CONSTRAINT uc2_Projects
	UNIQUE (ProjectName);