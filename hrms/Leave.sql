CREATE TABLE [dbo].[Leave] (
    [leave_id]        NVARCHAR (450) NOT NULL,
    [staff_id]        NVARCHAR (450) NOT NULL,
    [approval_status] NVARCHAR (MAX) NULL,
    [approved_by]     NVARCHAR (450) NULL,
    [date_created]    DATETIME2 (7)  NOT NULL,
    [leave_start]     DATETIME2 (7)  NOT NULL,
    [leave_end]       DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Leave] PRIMARY KEY CLUSTERED ([leave_id] ASC),
    CONSTRAINT [FK_Leave_EmployeeDetails_approved_by] FOREIGN KEY ([approved_by]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]),
    CONSTRAINT [FK_Leave_EmployeeDetails_staff_id] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Leave_approved_by]
    ON [dbo].[Leave]([approved_by] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Leave_staff_id]
    ON [dbo].[Leave]([staff_id] ASC);
