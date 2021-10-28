IF OBJECT_ID('Usp_InsertTask','P') IS NOT NULL
    DROP PROC Usp_InsertTask
GO

CREATE PROC Usp_InsertTask
	@Title NVARCHAR(MAX)
	,@Description NVARCHAR(MAX)	
	,@CreatedBy NVARCHAR(MAX) = 'System'	
	,@Id INT OUT
AS
BEGIN
	INSERT INTO [dbo].[Tasks]
	(
		[Title]
		,[Description]
		,[CreatedDate]
		,[CreatedBy]
		,[ModifiedDate]
		,[ModifiedBy]
		,[IsActive]
		,[IsDeleted]) 
	VALUES
	(
		@Title
		,@Description
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