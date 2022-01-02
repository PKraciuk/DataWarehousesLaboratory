USE HD
GO
If (object_id('vETLAreaVisit') is not null) Drop View vETLAreaVisit;
go
DELETE FROM AreaVisit
go
INSERT INTO AreaVisit
SELECT * FROM ZooDB.dbo.AreaVisit