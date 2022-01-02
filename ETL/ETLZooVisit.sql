USE HD

If (object_id('WeathersTemp') is not null) Drop Table WeathersTemp;
CREATE TABLE dbo.WeathersTemp(ID_Zoo INT FOREIGN KEY REFERENCES Zoo(ID_Zoo), date DATE, temp INT, WasRaining varchar(3));
go
SET DATEFORMAT dmy ;
BULK INSERT dbo.WeathersTemp
    FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\Excel\pogoda_zoo1.csv'
    WITH
    (
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

BULK INSERT dbo.WeathersTemp
    FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\Excel\pogoda_zoo2.csv'
    WITH
    (
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

BULK INSERT dbo.WeathersTemp
    FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\Excel\pogoda_zoo3.csv'
    WITH
    (
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
    )

/* NA TYM ETAPIE POBRANE SA DANE Z EXCELA, TERAZ CZAS NA ICH KONWERSJE ( TAK/NIE -> 1/0, TEMPERATURA -> PRZEDZIA£ TEMP) */
If (object_id('vETLDimTempData') is not null) Drop View vETLDimTempData;
go
CREATE VIEW vETLDimTempData
AS
SELECT DISTINCT
	[ID_Zoo] as [ID_Zoo],
	[date] as [date],
	CASE
		WHEN [Temp] <5 THEN 'Bardzo Niska'
		WHEN [Temp] BETWEEN 5 AND 10 THEN 'Niska'
		WHEN [Temp] BETWEEN 11 AND 15 THEN 'Srednia'
		WHEN [Temp] BETWEEN 16 AND 20 THEN 'Wysoka' 
		ELSE 'Bardzo Wysoka'
	END AS [Temp],
	CASE	
		WHEN [WasRaining] = 'TAK' THEN 1
		ELSE 0
	END AS [WasRaining]
FROM WeathersTemp
go


If (object_id('vZooVisit') is not null) Drop View vZooVisit;
go
CREATE VIEW vZooVisit
AS
SELECT DISTINCT
	[ID_Ticket] as [ID_Ticket],
	CASE
		WHEN [IsReduced] = 'TAK' THEN 1
		ELSE 0
	END AS [IsReduced],
	[ID_Zoo] as [ID_Zoo],
	[EVALUATION] as [EVALUATION],
	[Data] as [Data],
	[ArrivalTime] as [ArrivalTime]
FROM ZooDB.dbo.ZooVisit


go
CREATE VIEW vETLZooVisit
AS 
SELECT
    ID_Ticket,
	ID_Zoo,
	ID_Date,
	ID_Time,
	ID_Junk,
	GrpSize
FROM
	(SELECT
		
	    ID_Ticket = ST1.ID_Ticket,
		ID_Zoo=ST1.ID_Zoo,
		ID_Date=ST2.ID_Date,
		ID_Time=ST3.ID_Time,
		ID_Junk=ST4.ID_Junk,
		GrpSize=ST5.GroupSize


	FROM vZooVisit AS ST1

	JOIN Date AS ST2 ON ST1.Data = ST2.dateUQ
	JOIN Time AS ST3 ON ST3.Hour = DATEPART(HOUR, ST1.ArrivalTime)
	JOIN Junk AS ST4 ON (ST4.Evaluation = ST1.EVALUATION AND ST4.ReducedTicket=ST1.IsReduced )
	JOIN vETLDimTempData as Tmp ON (ST2.dateUQ = Tmp.date AND tmp.ID_Zoo = ST1.ID_Zoo AND tmp.Temp=ST4.Temperature AND tmp.WasRaining=ST4.WasRaining )
	JOIN ZooDB.dbo.GroupSize as ST5 ON ST5.ID_Ticket = ST1.ID_Ticket
	
	) AS X
GO



MERGE INTO ZooVisit as DST
	USING vETLZooVisit as SRC
		ON DST.ID_Ticket = SRC.ID_Ticket
		WHEN Not Matched
				THEN
					INSERT
					Values (						  
						  SRC.ID_Zoo,
						  SRC.ID_Date,
						  SRC.ID_Time,
						  SRC.ID_Junk,
						  SRC.GrpSize
					)
		WHEN Not Matched By Source
				Then
					DELETE
			;

			

	

If (object_id('vETLZooVisit') is not null) Drop view vETLZooVisit;
Drop View vETLDimTempData;
Drop View vZooVisit;
Drop Table WeathersTemp;
/*
DELETE FROM ZooVisit
DBCC CHECKIDENT ('ZooVisit', RESEED, 0);
*/
