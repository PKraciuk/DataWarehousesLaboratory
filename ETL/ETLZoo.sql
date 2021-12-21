USE HD
GO
If (object_id('vETLDimZooData') is not null) Drop View vETLDimZooData;
go
CREATE VIEW vETLDimZooData
AS
SELECT DISTINCT
	[ID_Zoo] as [ID_Zoo],
	[City] as [City],
	[Country] as [Country]
FROM ZooDB.dbo.Zoo
go

MERGE INTO Zoo as DST
	USING vETLDimZooData as SRC
		on DST.Country = SRC.Country
		AND DST.City = SRC.City
			WHEN NOT Matched
				THEN
					INSERT
					Values(
					SRC.Country,
					SRC.City
					)
			;

DROP View vETLDimZooData
