IF OBJECT_ID('Usp_InsertSchedule','P') IS NOT NULL
    DROP PROC Usp_InsertSchedule
GO

CREATE PROC Usp_InsertSchedule	
	@Title NVARCHAR(MAX)
	,@Creator NVARCHAR(MAX)
	,@Description NVARCHAR(MAX) 
	,@Location NVARCHAR(MAX)
	,@TimeStart DATETIME
	,@TimeEnd DATETIME
	,@WsUserId INT	
	,@CreatedBy NVARCHAR(MAX) = 'System'
	,@Id INT OUT
AS
BEGIN
	INSERT INTO [dbo].[Schedules]
	(
      [Title]
      ,[Creator]
      ,[Description]
      ,[Location]
      ,[TimeStart]
      ,[TimeEnd]
      ,[WsUserId]
      ,[CreatedDate]
      ,[CreatedBy]
      ,[ModifiedDate]
      ,[ModifiedBy]
      ,[IsActive]
      ,[IsDeleted]
	) 
	VALUES
	(
		@Title
		,@Creator
		,@Description
		,@Location
		,@TimeStart
		,@TimeEnd
		,@WsUserId
		,GETDATE()
		,@CreatedBy
		,GETDATE()
		,@CreatedBy
		,1
		,0
	)

	SELECT @Id = @@IDENTITY
END
	
GO