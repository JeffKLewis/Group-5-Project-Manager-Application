----------------------------------------------------
--ProjectPermissions Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='ProjectPermissions'
   ) 
   DROP TABLE ProjectPermissions
GO

----------------------------------------------------
--ProjectPermissions Create Table & Constraints
----------------------------------------------------
CREATE TABLE ProjectPermissions
(
	ID INT NOT NULL IDENTITY(1,1),
	UserID INT NOT NULL,
	ProjectID INT NOT NULL,
	PRM_CommentsView BIT NOT NULL DEFAULT(1),
	PRM_CommentsCreate BIT NOT NULL DEFAULT(1),
	PRM_CommentsDeleteOwn BIT NOT NULL DEFAULT(1),
	PRM_CommentsDeleteOther BIT NOT NULL DEFAULT(0),
	PRM_FilesView BIT NOT NULL DEFAULT(1),
	PRM_FilesCreate BIT NOT NULL DEFAULT(1),
	PRM_FilesDeleteOwn BIT NOT NULL DEFAULT(1),
	PRM_FilesDeleteOther BIT NOT NULL DEFAULT(0),
	PRM_ProjectAdmin BIT NOT NULL DEFAULT(0)
);

ALTER TABLE ProjectPermissions
	ADD CONSTRAINT pk_ProjectPermissions
	PRIMARY KEY (ID);

ALTER TABLE ProjectPermissions
	ADD CONSTRAINT fk1_ProjectPermissions
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);

ALTER TABLE ProjectPermissions
	ADD CONSTRAINT fk2_ProjectPermissions
	FOREIGN KEY (ProjectID)
	REFERENCES Projects(ID);

ALTER TABLE ProjectPermissions
	ADD CONSTRAINT uc1_ProjectPermissions
	UNIQUE (ID);

ALTER TABLE ProjectPermissions
	ADD CONSTRAINT uc2_ProjectPermissions
	UNIQUE (UserID,ProjectID);