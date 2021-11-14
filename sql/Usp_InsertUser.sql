IF OBJECT_ID('Usp_InsertUser','P') IS NOT NULL
    DROP PROC Usp_InsertUser
GO

CREATE PROC Usp_InsertUser
	@FullName NVARCHAR(MAX)
	,@JobRole NVARCHAR(MAX)
	,@CreatedBy NVARCHAR(MAX) = 'System'
	,@Id INT OUT
AS
BEGIN
	INSERT INTO [dbo].[WsUsers]
	(
		[FullName]
		,[JobRole]		
		,[CreatedDate]
		,[CreatedBy]
		,[ModifiedDate]
		,[ModifiedBy]
		,[IsActive]
		,[IsDeleted]
	) 
	VALUES
	(
		@FullName
		,@JobRole		
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