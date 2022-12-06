CREATE TABLE [dbo].[Role] (
    [role_id]      NVARCHAR (450) NOT NULL,
    [role_name]    NVARCHAR (MAX) NOT NULL,
    [date_created] DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([role_id] ASC)
);
