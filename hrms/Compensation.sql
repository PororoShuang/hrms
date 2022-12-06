CREATE TABLE [dbo].[Compensation] (
    [comp_id]        INT            IDENTITY (1, 1) NOT NULL,
    [user_id]        NVARCHAR (450) NOT NULL,
    [comp_type]      NVARCHAR (MAX) NULL,
    [comp_desc]      NVARCHAR (MAX) NULL,
    [date_applied]   DATETIME2 (7)  NOT NULL,
    [approved_by]    NVARCHAR (MAX) NULL,
    [status]         NVARCHAR (MAX) NULL,
    [reject_reason]  NVARCHAR (MAX) NULL,
    [date_completed] DATETIME2 (7)  NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_Compensation_user_id]
    ON [dbo].[Compensation]([user_id] ASC);


GO
ALTER TABLE [dbo].[Compensation]
    ADD CONSTRAINT [PK_Compensation] PRIMARY KEY CLUSTERED ([comp_id] ASC);


GO
ALTER TABLE [dbo].[Compensation]
    ADD CONSTRAINT [FK_Compensation_EmployeeDetails_user_id] FOREIGN KEY ([user_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]) ON DELETE CASCADE;
