----------------------------------------------------
--ProjectTags Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='ProjectTags'
   ) 
   DROP TABLE ProjectTags
GO

----------------------------------------------------
--ProjectTags Create Table & Constraints
----------------------------------------------------
CREATE TABLE ProjectTags
(
	ID INT NOT NULL IDENTITY(1,1),
	TagID INT NOT NULL,
	ProjectID INT NOT NULL,
	UserID INT NOT NULL,
	Created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Tombstoned BIT NOT NULL DEFAULT(0),
	TombstonedBy INT,
	TombstonedDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE ProjectTags
	ADD CONSTRAINT pk_ProjectTags
	PRIMARY KEY (ID);

ALTER TABLE ProjectTags
	ADD CONSTRAINT fk1_ProjectTags
	FOREIGN KEY (TagID)
	REFERENCES Tags(ID);

ALTER TABLE ProjectTags
	ADD CONSTRAINT fk2_ProjectTags
	FOREIGN KEY (ProjectID)
	REFERENCES Projects(ID);

ALTER TABLE ProjectTags
	ADD CONSTRAINT fk3_ProjectTags
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);

ALTER TABLE ProjectTags
	ADD CONSTRAINT fk4_ProjectTags
	FOREIGN KEY (TombstonedBy)
	REFERENCES Users(ID);

ALTER TABLE ProjectTags
	ADD CONSTRAINT uc1_ProjectTags
	UNIQUE (ID);

ALTER TABLE ProjectTags
	ADD CONSTRAINT uc2_ProjectTags
	UNIQUE (TagID,ProjectID);