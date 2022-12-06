CREATE TABLE [dbo].[Payrate] (
    [payrate_id]        NVARCHAR (450) NOT NULL,
    [payrate_name]      NVARCHAR (MAX) NOT NULL,
    [payrate_type]      NVARCHAR (MAX) NOT NULL,
    [salary_multiplier] REAL           NOT NULL,
    [hourly_multiplier] REAL           NOT NULL,
    [flat_increase]     REAL           NOT NULL,
    CONSTRAINT [PK_Payrate] PRIMARY KEY CLUSTERED ([payrate_id] ASC)
);
