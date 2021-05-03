----------------------------------------------------
--AppPermissions Drop Existing Table
----------------------------------------------------
IF EXISTS (
	SELECT 1 
	  FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE' 
       AND TABLE_NAME='AppPermissions'
   ) 
   DROP TABLE AppPermissions
GO

----------------------------------------------------
--AppPermissions Create Table & Constraints
----------------------------------------------------
CREATE TABLE AppPermissions
(
	ID INT NOT NULL IDENTITY(1,1),
	UserID INT NOT NULL,
	PRM_ProjectsView BIT NOT NULL DEFAULT(1),
	PRM_ProjectsCreate BIT NOT NULL DEFAULT(1),
	PRM_AppAdmin BIT NOT NULL DEFAULT(0)
);

ALTER TABLE AppPermissions
	ADD CONSTRAINT pk_AppPermissions
	PRIMARY KEY (ID);

ALTER TABLE AppPermissions
	ADD CONSTRAINT fk1_AppPermissions
	FOREIGN KEY (UserID)
	REFERENCES Users(ID);

ALTER TABLE AppPermissions
	ADD CONSTRAINT uc1_AppPermissions
	UNIQUE (ID);

ALTER TABLE AppPermissions
	ADD CONSTRAINT uc2_AppPermissions
	UNIQUE (UserID);