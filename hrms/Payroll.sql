CREATE TABLE [dbo].[Payroll] (
    [payroll_id]   NVARCHAR (450) NOT NULL,
    [staff_id]     NVARCHAR (450) NOT NULL,
    [month_salary] REAL           NOT NULL,
    [overtime_pay] REAL           NOT NULL,
    [kwsp_total]   REAL           NOT NULL,
    [zakat_total]  REAL           NOT NULL,
    CONSTRAINT [PK_Payroll] PRIMARY KEY CLUSTERED ([payroll_id] ASC),
    CONSTRAINT [FK_Payroll_EmployeeDetails_staff_id] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Payroll_staff_id]
    ON [dbo].[Payroll]([staff_id] ASC);
