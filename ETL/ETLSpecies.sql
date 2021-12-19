USE HD
GO
If (object_id('vETLDimSpeciesData') is not null) Drop View vETLDimSpeciesData;
go
CREATE VIEW vETLDimSpeciesData
AS
SELECT DISTINCT
	[SpeciesName] as [SpeciesName],
	[Size] as [Size],
	[Diet] as [Diet],
	CASE
		WHEN [IfEndangered] = 'TRUE' THEN 1
		ELSE 0
	END AS [IsEndangered]
FROM ZooDB.dbo.Species
go

MERGE INTO Species as DST
	USING vETLDimSpeciesData as SRC
		on DST.SpeciesName = SRC.SpeciesName
		AND DST.Size = SRC.Size
		AND DST.Diet = SRC.Diet
		AND DST.IsEndangered = SRC.IsEndangered
			WHEN NOT Matched
				THEN
					INSERT
					Values(
					SRC.SpeciesName,
					SRC.Size,
					SRC.Diet,
					SRC.IsEndangered
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

DROP View vETLDimSpeciesData

