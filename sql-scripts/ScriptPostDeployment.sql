-- Post-Deployment Script for Project Management Database

-- 1. Insert sample data into the ProjectStatusTable (optional)
PRINT 'Inserting sample data into ProjectStatusTable...';

INSERT INTO ProjectStatusTable (ProjectName, Status, StartDate, EndDate)
VALUES 
('Cloud Migration', 'In Progress', '2025-01-01', '2025-12-31'),
('API Integration', 'Pending', '2025-03-01', '2025-09-30'),
('Customer Portal Update', 'Completed', '2024-06-01', '2024-12-15');

PRINT 'Sample data inserted successfully into ProjectStatusTable.';

-- 2. Create a non-clustered index for faster queries on Status column
PRINT 'Creating non-clustered index on Status column...';

CREATE NONCLUSTERED INDEX IX_ProjectStatus_Status
ON ProjectStatusTable (Status);

PRINT 'Index IX_ProjectStatus_Status created successfully.';

-- 3. Add a foreign key relationship between ProjectStatusTable and another table (if applicable)
-- For this example, we assume there's a related `ProjectDetails` table (just an example)

-- PRINT 'Creating foreign key relationship with ProjectDetails table...';

-- ALTER TABLE ProjectStatusTable
-- ADD CONSTRAINT FK_ProjectStatus_ProjectDetails
-- FOREIGN KEY (ProjectID) REFERENCES ProjectDetails (ProjectID);

-- Uncomment and modify the above code if a relationship exists.

-- 4. Set default value for any new columns (if applicable)
PRINT 'Setting default values for new columns...';

-- Example for setting a default value for the Status column in ProjectStatusTable (if applicable)
-- This is just a placeholder. Adjust the column name and value based on your database schema.

-- ALTER TABLE ProjectStatusTable
-- ADD CONSTRAINT DF_Status_Default
-- DEFAULT 'Not Started' FOR Status;

-- 5. Perform any database optimizations (optional)
PRINT 'Performing database optimization tasks...';

-- Example of updating statistics for better query performance
UPDATE STATISTICS ProjectStatusTable;

PRINT 'Database optimization completed.';

-- 6. Log completion of post-deployment tasks
PRINT 'Post-deployment tasks completed successfully!';
