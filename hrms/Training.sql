CREATE TABLE [dbo].[Training] (
    [training_id]   NVARCHAR (450) NOT NULL,
    [training_name] NVARCHAR (MAX) NOT NULL,
    [start_date]    DATETIME2 (7)  NOT NULL,
    [duration]      INT            NOT NULL,
    CONSTRAINT [PK_Training] PRIMARY KEY CLUSTERED ([training_id] ASC)
);
