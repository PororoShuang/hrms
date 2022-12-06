CREATE TABLE [dbo].[TrainingProgress] (
    [staff_id]      NVARCHAR (450) NOT NULL,
    [training_id]   NVARCHAR (450) NOT NULL,
    [completion]    BIT            NOT NULL,
    [duration_left] INT            NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_TrainingProgress_training_id]
    ON [dbo].[TrainingProgress]([training_id] ASC);


GO
ALTER TABLE [dbo].[TrainingProgress]
    ADD CONSTRAINT [PK_TrainingProgress] PRIMARY KEY CLUSTERED ([staff_id] ASC, [training_id] ASC);


GO
ALTER TABLE [dbo].[TrainingProgress]
    ADD CONSTRAINT [FK_TrainingProgress_EmployeeDetails_staff_id] FOREIGN KEY ([staff_id]) REFERENCES [dbo].[EmployeeDetails] ([employee_id]) ON DELETE CASCADE;


GO
ALTER TABLE [dbo].[TrainingProgress]
    ADD CONSTRAINT [FK_TrainingProgress_Training_training_id] FOREIGN KEY ([training_id]) REFERENCES [dbo].[Training] ([training_id]) ON DELETE CASCADE;
