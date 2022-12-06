CREATE TABLE [dbo].[Attendance] (
    [attendance_id] NVARCHAR (450) NOT NULL,
    [staff_id]      NVARCHAR (450) NOT NULL,
    [shift_id]      NVARCHAR (450) NOT NULL,
    [start_time]    DATETIME2 (7)  NOT NULL,
    [end_time]      DATETIME2 (7)  NULL,
    [validity]      BIT            NOT NULL,
    CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED ([attendance_id] ASC),
    CONSTRAINT [FK_Attendance_EmployeeDetails_staff_id] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Attendance_Shift_shift_id] FOREIGN KEY ([shift_id]) REFERENCES [dbo].[Shift] ([shift_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Attendance_shift_id]
    ON [dbo].[Attendance]([shift_id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Attendance_staff_id]
    ON [dbo].[Attendance]([staff_id] ASC);
