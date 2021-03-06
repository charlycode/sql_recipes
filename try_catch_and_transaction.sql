USE [DB_NAME];

--SET TRANSACTION ISOLATION LEVEL [ISOLATION_LEVEL_NAME];
SET NOCOUNT ON;
DECLARE @ERROR_STATE INT, @ERROR_SEVERITY INT, @ERROR_MESSAGE NVARCHAR(2048) 
BEGIN TRANSACTION
BEGIN TRY

	--The t-sql code to execute goes here

	
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	--If the above statements fails, we rollback the transaction. Feel free to add your own logic here.
	ROLLBACK TRANSACTION;
	SELECT
         @ERROR_STATE = ERROR_STATE()
        ,@ERROR_SEVERITY = ERROR_SEVERITY()
        ,@ERROR_MESSAGE  = ERROR_MESSAGE();
	RAISERROR (@ERROR_MESSAGE, @ERROR_SEVERITY, @ERROR_STATE);
END CATCH;