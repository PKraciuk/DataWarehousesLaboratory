use HD
DELETE FROM AreaVisit;
DELETE FROM ZooVisit;
DELETE FROM AnimalInArea;
DELETE FROM Zoo;
DELETE FROM Area;
DELETE FROM Enclosure;
DELETE FROM Animal;
DELETE FROM Species;
DELETE FROM Date;
DELETE FROM Time;
DELETE FROM Junk;

DBCC CHECKIDENT ('Zoo', RESEED, 0);
DBCC CHECKIDENT ('Date', RESEED, 0);
DBCC CHECKIDENT ('Time', RESEED, 0);
DBCC CHECKIDENT ('Enclosure', RESEED, 0);
DBCC CHECKIDENT ('Area', RESEED, 0);
DBCC CHECKIDENT ('Junk', RESEED, 0);
DBCC CHECKIDENT ('Animal', RESEED, 0);
DBCC CHECKIDENT ('ZooVisit', RESEED, 0);
DBCC CHECKIDENT ('AnimalInArea', RESEED, 0);
