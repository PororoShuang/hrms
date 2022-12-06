CREATE TABLE [dbo].[Admin] (
    [admin_id]      NVARCHAR (450) NOT NULL,
    [admin_pass]    NVARCHAR (MAX) NOT NULL,
    [is_superadmin] BIT            NOT NULL,
    CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED ([admin_id] ASC)
);
