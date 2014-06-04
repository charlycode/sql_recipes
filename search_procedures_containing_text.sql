--Gets the list of stored procedures that contains certain bunch of text
USE [DB_NAME];

SELECT 
	OBJECT_NAME(id) 
FROM syscomments 
WHERE [text] LIKE '%pattern_to_find%' 
AND OBJECTPROPERTY(id, 'IsProcedure') = 1 
GROUP BY OBJECT_NAME(id);
