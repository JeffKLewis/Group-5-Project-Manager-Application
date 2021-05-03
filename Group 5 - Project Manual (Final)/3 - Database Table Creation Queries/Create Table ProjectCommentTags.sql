----------------------------------------------------
--ProjectCommentTags Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='ProjectCommentTags'
   ) 
   DROP TABLE ProjectCommentTags
GO

----------------------------------------------------
--ProjectCommentTags Create Table & Constraints
----------------------------------------------------
CREATE TABLE ProjectCommentTags
(
	ID INT NOT NULL IDENTITY(1,1),
	TagID INT NOT NULL,
	ProjectCommentID INT NOT NULL,
	UserID INT NOT NULL,
	Created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Tombstoned BIT NOT NULL DEFAULT(0),
	TombstonedBy INT,
	TombstonedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE ProjectCommentTags
	ADD CONSTRAINT pk_ProjectCommentTags
	PRIMARY KEY (ID);

ALTER TABLE ProjectCommentTags
	ADD CONSTRAINT fk1_ProjectCommentTags
	FOREIGN KEY (TagID)
	REFERENCES Tags(ID);

ALTER TABLE ProjectCommentTags
	ADD CONSTRAINT fk2_ProjectCommentTags
	FOREIGN KEY (ProjectCommentID)
	REFERENCES ProjectComments(ID);

ALTER TABLE ProjectCommentTags
	ADD CONSTRAINT fk3_ProjectCommentTags
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);

ALTER TABLE ProjectCommentTags
	ADD CONSTRAINT fk4_ProjectCommentTags
	FOREIGN KEY (TombstonedBy)
	REFERENCES Users(ID);

ALTER TABLE ProjectCommentTags
	ADD CONSTRAINT uc1_ProjectCommentTags
	UNIQUE (ID);

ALTER TABLE ProjectCommentTags
	ADD CONSTRAINT uc2_ProjectCommentTags
	UNIQUE (TagID,ProjectCommentID);