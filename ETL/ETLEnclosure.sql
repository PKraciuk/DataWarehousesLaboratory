USE HD
GO

If (object_id('vETLDimEnclosureData') is not null) Drop View vETLDimEnclosureData;
go
CREATE VIEW vETLDimEnclosureData
AS
SELECT DISTINCT
	[ID_Enclosure] as [ID_Enclosure],
	CASE
		WHEN [Size] >= 20 THEN 'L'
		WHEN [Size] BETWEEN 10 AND 20 THEN 'M'
		ELSE 'S'
	END AS [Size]
FROM ZooDB.dbo.Enclosure
go

MERGE INTO Enclosure as DST
	USING vETLDimEnclosureData as SRC
		ON DST.ID_Enclosure = SRC.ID_Enclosure
			WHEN NOT Matched
				THEN
					INSERT
					Values(
					SRC.Size
					)
;

SELECT * FROM Enclosure


