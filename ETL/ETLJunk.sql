use HD

DELETE FROM Junk;
DBCC CHECKIDENT ('Junk', RESEED, 0);

INSERT INTO [dbo].[Junk] 
SELECT t,i,e,r
FROM 
	  (
		VALUES 
			  ('Bardzo Niska'),
			  ('Niska'),
			  ('Srednia'),
			  ('Wysoka'),
			  ('Bardzo Wysoka')
	  ) 
	AS Temperature(t)
	
	, (
		VALUES 
			  (0)
			, (1)
	  ) 
	AS WasRaining(i)

	, (
		VALUES 
			  (0)
			, (1)
			, (2)
			, (3)
			, (4)
			, (5)
			, (6)
			, (7)
			, (8)
			, (9)
			, (10)

	  ) AS Evaluation(e)

	  , (
		VALUES 
			  (0)
			, (1)
	  ) 
	AS ReducedTicket(r);



