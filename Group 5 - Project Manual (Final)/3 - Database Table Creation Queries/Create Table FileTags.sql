----------------------------------------------------
--FileTags Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='FileTags'
   ) 
   DROP TABLE FileTags
GO

----------------------------------------------------
--FileTags Create Table & Constraints
----------------------------------------------------
CREATE TABLE FileTags
(
	ID INT NOT NULL IDENTITY(1,1),
	TagID INT NOT NULL,
	FileID INT NOT NULL,
	UserID INT NOT NULL,
	Created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Tombstoned BIT NOT NULL DEFAULT(0),
	TombstonedBy INT,
	TombstonedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE FileTags
	ADD CONSTRAINT pk_FileTags
	PRIMARY KEY (ID);

ALTER TABLE FileTags
	ADD CONSTRAINT fk1_FileTags
	FOREIGN KEY (TagID)
	REFERENCES Tags(ID);

ALTER TABLE FileTags
	ADD CONSTRAINT fk2_FileTags
	FOREIGN KEY (FileID)
	REFERENCES Files(ID);

ALTER TABLE FileTags
	ADD CONSTRAINT fk3_FileTags
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);

ALTER TABLE FileTags
	ADD CONSTRAINT fk4_FileTags
	FOREIGN KEY (TombstonedBy)
	REFERENCES Users(ID);

ALTER TABLE FileTags
	ADD CONSTRAINT uc1_FileTags
	UNIQUE (ID);

ALTER TABLE FileTags
	ADD CONSTRAINT uc2_FileTags
	UNIQUE (TagID,FileID);