IF OBJECT_ID('Usp_InsertTask','P') IS NOT NULL
    DROP PROC Usp_InsertTask
GO

CREATE PROC Usp_InsertTask
	@Title NVARCHAR(MAX)
	,@Description NVARCHAR(MAX)	
	,@Status NVARCHAR(100) = 'New'	
	,@CreatedBy NVARCHAR(MAX) = 'System'	
	,@Id INT OUT
AS
BEGIN
	INSERT INTO [dbo].[Tasks]
	(
		[Title]
		,[Description]
		,[Status]
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
		,@Status
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