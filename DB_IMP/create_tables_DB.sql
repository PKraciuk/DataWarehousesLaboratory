use ZooDB
DROP TABLE AreaVisit
DROP TABLE ZooVisit
DROP TABLE Animal
DROP TABLE Species
DROP TABLE Enclosure
DROP TABLE Area
DROP TABLE Zoo

CREATE TABLE Zoo (
	ID_Zoo INT PRIMARY KEY IDENTITY(1,1),
	Country VARCHAR(30),
	City VARCHAR(30)
    );

CREATE TABLE ZooVisit (                     
	ID_Ticket INT PRIMARY KEY IDENTITY(1,1),
	IsReduced VARCHAR(3),
	ID_Zoo INT FOREIGN KEY REFERENCES Zoo(ID_Zoo),	
	EVALUATION INT,
	Data DATE,
	ArrivalTime TIME

);

CREATE TABLE AREA (
	ID_Area INT PRIMARY KEY IDENTITY(1,1),
	AreaType VARCHAR(30),
	IsCovered VARCHAR(3),
	OpeningDate DATE,
	ID_Zoo INT FOREIGN KEY REFERENCES Zoo(ID_Zoo)
	)
CREATE TABLE AreaVisit (                     
	ID_Ticket INT FOREIGN KEY REFERENCES ZooVisit(ID_Ticket),
	ID_Strefa INT FOREIGN KEY REFERENCES Area(ID_Area)
	);
CREATE TABLE Enclosure (
	ID_Enclosure INT PRIMARY KEY IDENTITY(1,1),
	Size INT,
	ID_Area INT FOREIGN KEY REFERENCES Area(ID_Area),
	OpeningDate DATE
	);
CREATE TABLE Species (
	SpeciesName VARCHAR(30) PRIMARY KEY,
	Size VARCHAR(1),
	Diet VARCHAR(20),
	IfEndangered VARCHAR(5)
	);


CREATE TABLE Animal (
	ID_Animal INT PRIMARY KEY IDENTITY(1,1),
	Sex VARCHAR(1),
	Age INT,
	ID_Enclosure INT FOREIGN KEY REFERENCES Enclosure(ID_Enclosure),
	SpeciesName VARCHAR(30) FOREIGN KEY REFERENCES Species(SpeciesName)
	);






