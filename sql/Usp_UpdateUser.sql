IF OBJECT_ID('Usp_UpdateUser','P') IS NOT NULL
    DROP PROC Usp_UpdateUser
GO

CREATE PROC Usp_UpdateUser
	@Id INT
	,@FullName NVARCHAR(MAX)
	,@JobRole NVARCHAR(MAX)	
	,@IsActive BIT
	,@IsDeleted BIT
	,@ModifiedBy NVARCHAR(MAX) = 'System'
AS
BEGIN
	UPDATE [dbo].[WsUsers]
	SET [Fullname] = @FullName
		,[JobRole] = @JobRole
		,[ModifiedDate] = GETDATE()
		,[ModifiedBy] = @ModifiedBy
		,[IsActive] = @IsActive
		,[IsDeleted] = @IsDeleted
	WHERE [Id] = @Id
END