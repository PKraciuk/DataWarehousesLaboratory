USE ZooDB

DELETE FROM AreaVisit
DBCC CHECKIDENT ('ZooVisit', RESEED, 0);
DELETE FROM ZooVisit
DBCC CHECKIDENT ('Animal', RESEED, 0);
DELETE FROM Animal
DBCC CHECKIDENT ('Enclosure', RESEED, 0);
DELETE FROM Enclosure
DBCC CHECKIDENT ('Area', RESEED, 0);
DELETE FROM Area
DBCC CHECKIDENT ('Zoo', RESEED, 0);
DELETE FROM Zoo
DELETE FROM Species
SET DATEFORMAT dmy ;

BULK INSERT dbo.Zoo FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\T1\Zoo.bulk' WITH (FIELDTERMINATOR=',')
BULK INSERT dbo.Species FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\T1\gatunek.bulk' WITH (FIELDTERMINATOR=',')
BULK INSERT dbo.Area FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\T1\strefa.bulk' WITH (FIELDTERMINATOR=',')
BULK INSERT dbo.Animal FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\T1\zwierze.bulk' WITH (FIELDTERMINATOR=',')
BULK INSERT dbo.Enclosure FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\T1\wybieg.bulk' WITH (FIELDTERMINATOR=',')
BULK INSERT dbo.ZooVisit FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\T1\odwiedziny_zoo.bulk' WITH (FIELDTERMINATOR=',')
BULK INSERT dbo.AreaVisit FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\T1\odwiedziny_strefy.bulk' WITH (FIELDTERMINATOR=',')

If (object_id('GroupSize') is not null) Drop Table GroupSize;
CREATE TABLE dbo.GroupSize(ID_Ticket INT, GroupSize INT);
BULK INSERT dbo.GroupSize FROM 'C:\Users\user\Documents\HD-WH IMP\DB_IMP\T1\liczebnosc_grupy.bulk' WITH (FIELDTERMINATOR=',')

