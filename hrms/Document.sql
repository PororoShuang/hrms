CREATE TABLE [dbo].[Document] (
    [document_id]   NVARCHAR (450) NOT NULL,
    [owner_id]      NVARCHAR (450) NOT NULL,
    [document_name] NVARCHAR (MAX) NOT NULL,
    [date_created]  DATETIME2 (7)  NOT NULL,
    [expiry_date]   DATETIME2 (7)  NOT NULL,
    [notify_date]   DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED ([document_id] ASC),
    CONSTRAINT [FK_Document_EmployeeDetails_owner_id] FOREIGN KEY ([owner_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Document_owner_id]
    ON [dbo].[Document]([owner_id] ASC);
