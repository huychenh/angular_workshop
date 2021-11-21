IF OBJECT_ID('Usp_UpdateSchedule','P') IS NOT NULL
    DROP PROC Usp_UpdateSchedule
GO

CREATE PROC Usp_UpdateSchedule
	@Id INT
	,@Title NVARCHAR(MAX)
	,@Creator NVARCHAR(MAX)
	,@Description NVARCHAR(MAX) 
	,@Location NVARCHAR(MAX)
	,@TimeStart DATETIME
	,@TimeEnd DATETIME
	,@WsUserId INT
	,@IsActive BIT
	,@IsDeleted BIT
	,@ModifiedBy NVARCHAR(MAX) = 'System'
AS
BEGIN
	UPDATE [dbo].[Schedules]
	SET [Title] = @Title
		,[Creator] = @Creator
		,[Description] = @Description
		,[Location] = @Location
		,[TimeStart] = @TimeStart
		,[TimeEnd] = @TimeEnd
		,[WsUserId] = @WsUserId
		,[ModifiedDate] = GETDATE()
		,[ModifiedBy] = @ModifiedBy
		,[IsActive] = @IsActive
		,[IsDeleted] = @IsDeleted
	WHERE [Id] = @Id
END