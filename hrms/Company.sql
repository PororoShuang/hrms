CREATE TABLE [dbo].[Company] (
    [company_id]    NVARCHAR (450) NOT NULL,
    [company_name]  NVARCHAR (MAX) NOT NULL,
    [date_created]  DATETIME2 (7)  NOT NULL,
    [current_admin] NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED ([company_id] ASC),
    CONSTRAINT [FK_Company_Admin_current_admin] FOREIGN KEY ([current_admin]) REFERENCES [dbo].[Admin] ([admin_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Company_current_admin]
    ON [dbo].[Company]([current_admin] ASC);
