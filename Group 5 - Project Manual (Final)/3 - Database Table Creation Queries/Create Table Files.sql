----------------------------------------------------
--Files Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='Files'
   ) 
   DROP TABLE Files
GO

----------------------------------------------------
--Files Create Table & Constraints
----------------------------------------------------
CREATE TABLE Files
(
	ID INT NOT NULL IDENTITY(1,1),
	ResourceName VARCHAR(MAX) NOT NULL,
	ResourceType VARCHAR(MAX) NOT NULL,
	ResourceLocation VARCHAR(MAX) NOT NULL,
	ResourceTitle VARCHAR(100),
	ResourceDescription VARCHAR(MAX),
	ProjectID INT NOT NULL,
	UserID INT NOT NULL,
	Created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Tombstoned BIT NOT NULL DEFAULT(0),
	TombstonedBy INT,
	TombstonedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE Files
	ADD CONSTRAINT pk_Files
	PRIMARY KEY (ID);

ALTER TABLE Files
	ADD CONSTRAINT fk1_Files
	FOREIGN KEY (ProjectID)
	REFERENCES Projects(ID);

ALTER TABLE Files
	ADD CONSTRAINT fk2_Files
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);

ALTER TABLE Files
	ADD CONSTRAINT uc1_Files
	UNIQUE (ID);

ALTER TABLE Files
	ADD CONSTRAINT uc2_Files
	UNIQUE (ResourceName,ProjectID);

ALTER TABLE Files
	ADD CONSTRAINT uc3_Files
	UNIQUE (ResourceLocation,ProjectID);

ALTER TABLE Files
	ADD CONSTRAINT uc4_Files
	UNIQUE (ResourceTitle,ProjectID);