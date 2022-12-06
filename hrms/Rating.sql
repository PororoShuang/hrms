CREATE TABLE [dbo].[Rating] (
    [rating_id]   NVARCHAR (450) NOT NULL,
    [staff_rated] NVARCHAR (450) NOT NULL,
    [rated_by]    NVARCHAR (450) NULL,
    [rating]      INT            NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_Rating_rated_by]
    ON [dbo].[Rating]([rated_by] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Rating_staff_rated]
    ON [dbo].[Rating]([staff_rated] ASC);


GO
ALTER TABLE [dbo].[Rating]
    ADD CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED ([rating_id] ASC);


GO
ALTER TABLE [dbo].[Rating]
    ADD CONSTRAINT [FK_Rating_EmployeeDetails_rated_by] FOREIGN KEY ([rated_by]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]);


GO
ALTER TABLE [dbo].[Rating]
    ADD CONSTRAINT [FK_Rating_EmployeeDetails_staff_rated] FOREIGN KEY ([staff_rated]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]) ON DELETE CASCADE;
