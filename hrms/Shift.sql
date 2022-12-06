CREATE TABLE [dbo].[Shift] (
    [shift_id]         NVARCHAR (450) NOT NULL,
    [shift_start]      DATETIME2 (7)  NOT NULL,
    [shift_end]        DATETIME2 (7)  NOT NULL,
    [overtime_min]     INT            NOT NULL,
    [qr_code]          NVARCHAR (MAX) NULL,
    [payrate_id]       NVARCHAR (450) NULL,
    [overtime_rate_id] NVARCHAR (450) NULL,
    CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED ([shift_id] ASC),
    CONSTRAINT [FK_Shift_Payrate_overtime_rate_id] FOREIGN KEY ([overtime_rate_id]) REFERENCES [dbo].[Payrate] ([payrate_id]),
    CONSTRAINT [FK_Shift_Payrate_payrate_id] FOREIGN KEY ([payrate_id]) REFERENCES [dbo].[Payrate] ([payrate_id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Shift_overtime_rate_id]
    ON [dbo].[Shift]([overtime_rate_id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Shift_payrate_id]
    ON [dbo].[Shift]([payrate_id] ASC);
