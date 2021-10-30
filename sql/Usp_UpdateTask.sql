IF OBJECT_ID('Usp_UpdateTask','P') IS NOT NULL
    DROP PROC Usp_UpdateTask
GO

CREATE PROC Usp_UpdateTask
	@Id INT
	,@Title NVARCHAR(MAX)
	,@Description NVARCHAR(MAX)
	,@Status NVARCHAR(100) = 'New'	
	,@IsActive BIT
	,@IsDeleted BIT
	,@ModifiedBy NVARCHAR(MAX) = 'System'
AS
BEGIN
	UPDATE [dbo].[Tasks]
	SET [Title] = @Title
		,[Description] = @Description	
		,[Status] = @Status
		,[ModifiedDate] = GETDATE()
		,[ModifiedBy] = @ModifiedBy
		,[IsActive] = @IsActive
		,[IsDeleted] = @IsDeleted
	WHERE [Id] = @Id
END