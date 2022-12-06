CREATE TABLE [dbo].[EmployeeDetails] (
    [employee_id]            NVARCHAR (450) NOT NULL,
    [employee_id_by_company] NVARCHAR (MAX) NULL,
    [employee_name]          NVARCHAR (MAX) NOT NULL,
    [user_id]                NVARCHAR (MAX) NOT NULL,
    [parent_company]         NVARCHAR (450) NOT NULL,
    [staff_role]             NVARCHAR (450) NULL,
    [acc_pass]               NVARCHAR (MAX) NULL,
    [employer_id]            NVARCHAR (450) NULL,
    [employer_name]          NVARCHAR (MAX) NULL,
    [employment_start_date]  DATETIME2 (7)  NULL,
    [year_of_services]       INT            NOT NULL,
    [types_of_wages]         NVARCHAR (MAX) NULL,
    [wages_rate]             REAL           NOT NULL,
    [employement_letter]     BIT            NOT NULL,
    [monthly_deduction]      REAL           NOT NULL,
    CONSTRAINT [PK_EmployeeDetails] PRIMARY KEY CLUSTERED ([employee_id] ASC),
    CONSTRAINT [FK_EmployeeDetails_Company_parent_company] FOREIGN KEY ([parent_company]) REFERENCES [dbo].[Company] ([company_id]) ON DELETE CASCADE,
    CONSTRAINT [FK_EmployeeDetails_EmployeeDetails_employer_id] FOREIGN KEY ([employer_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]),
    CONSTRAINT [FK_EmployeeDetails_Role_staff_role] FOREIGN KEY ([staff_role]) REFERENCES [dbo].[Role] ([role_id])
);


GO
CREATE NONCLUSTERED INDEX [IX_EmployeeDetails_employer_id]
    ON [dbo].[EmployeeDetails]([employer_id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EmployeeDetails_parent_company]
    ON [dbo].[EmployeeDetails]([parent_company] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EmployeeDetails_staff_role]
    ON [dbo].[EmployeeDetails]([staff_role] ASC);
