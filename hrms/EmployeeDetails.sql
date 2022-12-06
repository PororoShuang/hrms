CREATE TABLE [dbo].[EmployeeDetails] (
    [employee_id]            NVARCHAR (450) NOT NULL,
    [employee_id_by_company] NVARCHAR (MAX) NULL,
    [employee_name]          NVARCHAR (MAX) NOT NULL,
    [user_id]                NVARCHAR (MAX) NOT NULL,
    [parent_company]         NVARCHAR (450) NOT NULL,
    [staff_role]             NVARCHAR (450) NULL,
    [acc_pass]               NVARCHAR (MAX) NULL,
    [employer_id]            NVARCHAR (450) NULL,
    [employment_start_date]  DATETIME2 (7)  NULL,
    [types_of_wages]         NVARCHAR (MAX) NULL,
    [wages_rate]             REAL           NOT NULL,
    [employement_letter]     BIT            NOT NULL,
    [monthly_deduction]      REAL           NOT NULL,
    [bank_name]              NVARCHAR (MAX) NULL,
    [bank_no]                NVARCHAR (MAX) NULL,
    [dob]                    DATETIME2 (7)  NULL,
    [email]                  NVARCHAR (MAX) NULL,
    [epf_no]                 NVARCHAR (MAX) NULL,
    [gender]                 NVARCHAR (MAX) NULL,
    [ic_no]                  NVARCHAR (MAX) NULL,
    [itax_no]                NVARCHAR (MAX) NULL,
    [nationality]            NVARCHAR (MAX) NULL,
    [phone_no]               NVARCHAR (MAX) NULL,
    [sosco_no]               NVARCHAR (MAX) NULL,
    [asp_id]                 NVARCHAR (MAX) NULL,
    [profileImg_path]        NVARCHAR (MAX) NULL,
    [is_active]              BIT            NULL,
    [religion]               NVARCHAR (MAX) NULL,
    [paidLeaveHourLeft]      INT            NOT NULL,
    [sickLeaveHourLeft]      INT            NOT NULL,
    [sickLeaveOnBargain]     INT            NOT NULL,
    [paidLeaveOnBargain]     INT            NOT NULL,
    [leaveUpdate]            DATETIME2 (7)  NOT NULL,
    [uuid]                   NVARCHAR (MAX) NULL
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


GO
ALTER TABLE [dbo].[EmployeeDetails]
    ADD CONSTRAINT [PK_EmployeeDetails] PRIMARY KEY CLUSTERED ([employee_id] ASC);


GO
ALTER TABLE [dbo].[EmployeeDetails]
    ADD CONSTRAINT [FK_EmployeeDetails_Company_parent_company] FOREIGN KEY ([parent_company]) REFERENCES [dbo].[Company] ([company_id]) ON DELETE CASCADE;


GO
ALTER TABLE [dbo].[EmployeeDetails]
    ADD CONSTRAINT [FK_EmployeeDetails_EmployeeDetails_employer_id] FOREIGN KEY ([employer_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]);


GO
ALTER TABLE [dbo].[EmployeeDetails]
    ADD CONSTRAINT [FK_EmployeeDetails_Role_staff_role] FOREIGN KEY ([staff_role]) REFERENCES [dbo].[Role] ([role_id]);
