USE HD
GO
If (object_id('vETLAreaVisit') is not null) Drop View vETLAreaVisit;
go
CREATE VIEW vETLAreaVisit
AS
SELECT 
	[ID_Ticket] as [ID_Ticket],
	[ID_Strefa] as [ID_Area]
FROM ZooDB.dbo.AreaVisit
go


MERGE INTO AreaVisit as DST
	USING vETLAreaVisit as SRC
		on DST.ID_Ticket = SRC.ID_Ticket
		AND DST.ID_Area = SRC.ID_Area
			WHEN NOT Matched
				THEN
					INSERT
					Values(
					SRC.ID_Ticket,
					SRC.ID_Area
					)
			WHEN Not Matched By Source
				Then
					DELETE
			;

DROP View vETLAreaVisit
