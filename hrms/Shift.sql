CREATE TABLE [dbo].[Shift] (
    [shift_id]     NVARCHAR (450) NOT NULL,
    [shift_start]  DATETIME2 (7)  NOT NULL,
    [shift_end]    DATETIME2 (7)  NOT NULL,
    [qr_code]      NVARCHAR (MAX) NULL,
    [payrate_id]   NVARCHAR (450) NULL,
    [parent_shift] NVARCHAR (450) NULL,
    [is_overtime]  BIT            NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_Shift_parent_shift]
    ON [dbo].[Shift]([parent_shift] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Shift_payrate_id]
    ON [dbo].[Shift]([payrate_id] ASC);


GO
ALTER TABLE [dbo].[Shift]
    ADD CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED ([shift_id] ASC);


GO
ALTER TABLE [dbo].[Shift]
    ADD CONSTRAINT [FK_Shift_Shift_parent_shift] FOREIGN KEY ([parent_shift]) REFERENCES [dbo].[Shift] ([shift_id]);


GO
ALTER TABLE [dbo].[Shift]
    ADD CONSTRAINT [FK_Shift_Payrate_payrate_id] FOREIGN KEY ([payrate_id]) REFERENCES [dbo].[Payrate] ([payrate_id]);
