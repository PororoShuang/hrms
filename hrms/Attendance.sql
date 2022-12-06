CREATE TABLE [dbo].[Attendance] (
    [attendance_id] NVARCHAR (450) NOT NULL,
    [staff_id]      NVARCHAR (450) NOT NULL,
    [shift_id]      NVARCHAR (450) NOT NULL,
    [start_time]    DATETIME2 (7)  NOT NULL,
    [end_time]      DATETIME2 (7)  NULL,
    [validity]      BIT            NOT NULL,
    [checkInValid]  BIT            NOT NULL,
    [checkOutValid] BIT            NOT NULL,
    [on_leave]      BIT            NOT NULL,
    [leave_id]      NVARCHAR (450) NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_Attendance_shift_id]
    ON [dbo].[Attendance]([shift_id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Attendance_staff_id]
    ON [dbo].[Attendance]([staff_id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Attendance_leave_id]
    ON [dbo].[Attendance]([leave_id] ASC);


GO
ALTER TABLE [dbo].[Attendance]
    ADD CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED ([attendance_id] ASC);


GO
ALTER TABLE [dbo].[Attendance]
    ADD CONSTRAINT [FK_Attendance_EmployeeDetails_staff_id] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]) ON DELETE CASCADE;


GO
ALTER TABLE [dbo].[Attendance]
    ADD CONSTRAINT [FK_Attendance_Shift_shift_id] FOREIGN KEY ([shift_id]) REFERENCES [dbo].[Shift] ([shift_id]) ON DELETE CASCADE;


GO
ALTER TABLE [dbo].[Attendance]
    ADD CONSTRAINT [FK_Attendance_Leave_leave_id] FOREIGN KEY ([leave_id]) REFERENCES [dbo].[Leave] ([leave_id]);
