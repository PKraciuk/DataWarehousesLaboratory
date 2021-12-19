USE HD
DBCC CHECKIDENT ('AnimalInArea', RESEED, 1);
go
If (object_id('vETLAnimalInArea') is not null) Drop View vETLAnimalInArea;

go
DELETE del
FROM AnimalInArea del
JOIN Animal an
ON an.ID=del.ID_Animal
WHERE an.isCurrent=0



go
CREATE VIEW vETLAnimalInArea
AS 
SELECT 
ST2.ID_Enclosure,
ST1.SpeciesName,
ST3.ID_Area,
ST5.ID,
ST5.isCurrent
	
FROM ZooDB.dbo.Animal AS ST1
JOIN ZooDB.dbo.Enclosure AS ST2 ON ST2.ID_Enclosure=ST1.ID_Enclosure
JOIN Area AS ST3 ON ST3.ID_Area=ST2.ID_Area
JOIN Animal AS ST5 ON (ST5.ID_Animal=ST1.ID_Animal AND ST5.isCurrent=1)
WHERE ST5.isCurrent=1
go
MERGE INTO AnimalInArea as DST
	USING vETLAnimalInArea as SRC
		ON DST.ID_Enclosure = SRC.ID_Enclosure
		AND DST.SpeciesName = SRC.SpeciesName
		AND DST.ID_Area = SRC.ID_Area
		AND DST.ID_Animal = SRC.ID
		WHEN Not Matched
				THEN					
					INSERT
					Values (
						  SRC.ID_Enclosure,
						  SRC.SpeciesName,
						  SRC.ID_Area,
						  SRC.ID
					)


			;
go
SELECT * FROM AnimalInArea




