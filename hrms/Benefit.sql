CREATE TABLE [dbo].[Benefit] (
    [benefit_id]   NVARCHAR (450) NOT NULL,
    [user_id]      NVARCHAR (450) NOT NULL,
    [benefit_desc] NVARCHAR (MAX) NULL,
    [benefit_type] NVARCHAR (MAX) NULL,
    [start_date]   DATETIME2 (7)  NOT NULL,
    [end_date]     DATETIME2 (7)  NOT NULL,
    [days]         INT            NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_Benefit_user_id]
    ON [dbo].[Benefit]([user_id] ASC);


GO
ALTER TABLE [dbo].[Benefit]
    ADD CONSTRAINT [PK_Benefit] PRIMARY KEY CLUSTERED ([benefit_id] ASC);


GO
ALTER TABLE [dbo].[Benefit]
    ADD CONSTRAINT [FK_Benefit_EmployeeDetails_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]) ON DELETE CASCADE;
