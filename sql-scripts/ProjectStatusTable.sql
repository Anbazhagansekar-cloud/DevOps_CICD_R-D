-- Create the ProjectStatusTable if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'ProjectStatusTable')
BEGIN
    CREATE TABLE ProjectStatusTable
    (
        ProjectID INT IDENTITY(1,1) PRIMARY KEY,   -- Unique ID for each project
        ProjectName NVARCHAR(100) NOT NULL,        -- Name of the project
        Status NVARCHAR(50) NOT NULL,              -- Current status of the project
        StartDate DATE,                            -- The start date of the project
        EndDate DATE,                              -- The expected or actual end date of the project
        LastUpdated DATETIME DEFAULT GETDATE()     -- The last updated timestamp
    );

    PRINT 'ProjectStatusTable has been created successfully.';
END
ELSE
BEGIN
    PRINT 'ProjectStatusTable already exists.';
END
