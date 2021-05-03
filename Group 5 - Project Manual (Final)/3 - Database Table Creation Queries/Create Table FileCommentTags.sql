----------------------------------------------------
--FileCommentTags Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='FileCommentTags'
   ) 
   DROP TABLE FileCommentTags
GO

----------------------------------------------------
--FileCommentTags Create Table & Constraints
----------------------------------------------------
CREATE TABLE FileCommentTags
(
	ID INT NOT NULL IDENTITY(1,1),
	TagID INT NOT NULL,
	FileCommentID INT NOT NULL,
	UserID INT NOT NULL,
	Created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Tombstoned BIT NOT NULL DEFAULT(0),
	TombstonedBy INT,
	TombstonedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE FileCommentTags
	ADD CONSTRAINT pk_FileCommentTags
	PRIMARY KEY (ID);

ALTER TABLE FileCommentTags
	ADD CONSTRAINT fk1_FileCommentTags
	FOREIGN KEY (TagID)
	REFERENCES Tags(ID);

ALTER TABLE FileCommentTags
	ADD CONSTRAINT fk2_FileCommentTags
	FOREIGN KEY (FileCommentID)
	REFERENCES FileComments(ID);

ALTER TABLE FileCommentTags
	ADD CONSTRAINT fk3_FileCommentTags
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);

ALTER TABLE FileCommentTags
	ADD CONSTRAINT fk4_FileCommentTags
	FOREIGN KEY (TombstonedBy)
	REFERENCES Users(ID);

ALTER TABLE FileCommentTags
	ADD CONSTRAINT uc1_FileCommentTags
	UNIQUE (ID);

ALTER TABLE FileCommentTags
	ADD CONSTRAINT uc2_FileCommentTags
	UNIQUE (TagID,FileCommentID);