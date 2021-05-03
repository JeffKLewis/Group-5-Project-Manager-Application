----------------------------------------------------
--ProjectComments Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='ProjectComments'
   ) 
   DROP TABLE ProjectComments
GO

----------------------------------------------------
--ProjectComments Create Table & Constraints
----------------------------------------------------
CREATE TABLE ProjectComments
(
	ID INT NOT NULL IDENTITY(1,1),
	ProjectID INT NOT NULL,
	UserID INT NOT NULL,
	Comment VARCHAR(MAX) NOT NULL,
	Created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Tombstoned BIT NOT NULL DEFAULT(0),
	TombstonedBy INT,
	TombstonedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE ProjectComments
	ADD CONSTRAINT pk_ProjectComments
	PRIMARY KEY (ID);

ALTER TABLE ProjectComments
	ADD CONSTRAINT fk1_ProjectComments
	FOREIGN KEY (ProjectID)
	REFERENCES Projects(ID);

ALTER TABLE ProjectComments
	ADD CONSTRAINT fk2_ProjectComments
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);

ALTER TABLE ProjectComments
	ADD CONSTRAINT fk3_ProjectComments
	FOREIGN KEY (TombstonedBy)
	REFERENCES Users(ID);

ALTER TABLE ProjectComments
	ADD CONSTRAINT uc1_ProjectComments
	UNIQUE (ID);