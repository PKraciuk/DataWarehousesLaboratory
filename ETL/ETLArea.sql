USE HD
GO
If (object_id('vETLDimAreaData') is not null) Drop View vETLDimAreaData;
go
CREATE VIEW vETLDimAreaData
AS
SELECT 
	[AreaType] as [AreaType],
	CASE
		WHEN [IsCovered] = 'TAK' THEN 1
		ELSE 0
	END AS [IsCovered]
FROM ZooDB.dbo.Area
go

MERGE INTO Area as DST
	USING vETLDimAreaData as SRC
		ON DST.AreaType = SRC.AreaType
		AND DST.IsCovered = SRC.IsCovered
			WHEN NOT Matched
				THEN
					INSERT
					Values(
					SRC.AreaType,
					SRC.IsCovered
					)
			;

DROP View vETLDimAreaData

