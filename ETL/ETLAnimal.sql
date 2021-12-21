USE HD
GO
If (object_id('vETLAnimal') is not null) Drop View vETLAnimal;
go

CREATE VIEW vETLAnimal
AS
SELECT 
	[ID_Animal],
	[Age]
FROM ZooDB.dbo.Animal
;
go

Declare @EntryDate datetime; 
SELECT @EntryDate = GETDATE();

MERGE INTO Animal as DST
	USING vETLAnimal as SRC
		ON DST.ID_Animal = SRC.ID_Animal
			WHEN Not Matched
				THEN
					INSERT Values (
					SRC.ID_Animal,
					SRC.Age,
					@EntryDate,
					NULL,
					1
					)
			WHEN Matched 
				AND (SRC.Age <> DST.Age)
			THEN
				UPDATE
				SET DST.IsCurrent = 0,
				DST.ExpiryDate = @EntryDate
			;

GO
Declare @EntryDate datetime; 
SELECT @EntryDate = GETDATE();

INSERT INTO Animal(
	ID_Animal,
	Age,
	EntryDate,
	ExpiryDate,
	IsCurrent
	)
	SELECT 
		ID_Animal,
		Age,
		@EntryDate,
		NULL,
		1
	FROM vETLAnimal
	EXCEPT
	SELECT 
		ID_Animal,
		Age,
		@EntryDate,
		NULL,
		1
	FROM Animal;
	
GO

SELECT * FROM Animal