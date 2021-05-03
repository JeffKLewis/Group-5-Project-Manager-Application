----------------------------------------------------
--FileComments Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='FileComments'
   ) 
   DROP TABLE FileComments
GO

----------------------------------------------------
--FileComments Create Table & Constraints
----------------------------------------------------
CREATE TABLE FileComments
(
	ID INT NOT NULL IDENTITY(1,1),
	FileID INT NOT NULL,
	UserID INT NOT NULL,
	Comment VARCHAR(MAX) NOT NULL,
	Created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Tombstoned BIT NOT NULL DEFAULT(0),
	TombstonedBy INT,
	TombstonedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE FileComments
	ADD CONSTRAINT pk_FileComments
	PRIMARY KEY (ID);

ALTER TABLE FileComments
	ADD CONSTRAINT fk1_FileComments
	FOREIGN KEY (FileID)
	REFERENCES Files(ID);

ALTER TABLE FileComments
	ADD CONSTRAINT fk2_FileComments
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);

ALTER TABLE FileComments
	ADD CONSTRAINT fk3_FileComments
	FOREIGN KEY (TombstonedBy)
	REFERENCES Users(ID);

ALTER TABLE FileComments
	ADD CONSTRAINT uc1_FileComments
	UNIQUE (ID);