use HD

DROP TABLE AreaVisit
DROP TABLE ZooVisit
DROP TABLE AnimalInArea
DROP TABLE Zoo
DROP TABLE Area
DROP TABLE Enclosure
DROP TABLE Species
DROP TABLE Date
DROP TABLE Time
DROP TABLE Junk
DROP TABLE Animal

CREATE TABLE Zoo (
	ID_Zoo INT PRIMARY KEY IDENTITY(1,1),
	Country VARCHAR(30),
	City VARCHAR(30)
    );

CREATE TABLE Date (
	ID_Date INT PRIMARY KEY IDENTITY,
	dateUQ date unique,
	Day INT,
	Month VARCHAR(10),
	MonthNo INT,
	Year INT,
	DayOfWeek INT,
	IfWeekend VARCHAR(1),
	IfHoliday VARCHAR(1)
	);

CREATE TABLE Time (
	ID_Time INT PRIMARY KEY IDENTITY,
	Hour INT,
	TimeOfTheDay VARCHAR(20)
	);

CREATE TABLE Junk (
	ID_Junk INT PRIMARY KEY IDENTITY,
	Temperature VARCHAR(20),
	WasRaining VARCHAR(1),
	Evaluation INT, 
	ReducedTicket VARCHAR(1)
	);

CREATE TABLE ZooVisit (                      /*FAKT 1*/
	ID_Ticket INT PRIMARY KEY IDENTITY(1,1),
	ID_Zoo INT FOREIGN KEY REFERENCES Zoo(ID_Zoo),
	ID_Data INT FOREIGN KEY REFERENCES Date(ID_Date),
	ID_Time INT FOREIGN KEY REFERENCES Time(ID_Time),
	ID_Junk INT FOREIGN KEY REFERENCES Junk(ID_Junk),
	GroupSize INT
	);


CREATE TABLE Area (
	ID_Area INT PRIMARY KEY IDENTITY,
	AreaType VARCHAR(20),
	IsCovered VARCHAR(1)
	);


CREATE TABLE AreaVisit (                      /* FAKT 2 */
	ID_Ticket INT FOREIGN KEY REFERENCES ZooVisit(ID_Ticket),
	ID_Area INT FOREIGN KEY REFERENCES Area(ID_Area)
	);

CREATE TABLE Enclosure (
	ID_Enclosure INT PRIMARY KEY IDENTITY,
	SizeCategory VARCHAR(20)
	);
CREATE TABLE Species (
	SpeciesName VARCHAR(30) PRIMARY KEY,
	Size VARCHAR(1),
	Diet VARCHAR(20),
	IsEndangered VARCHAR(1)
	);

CREATE TABLE Animal (
	ID INT PRIMARY KEY IDENTITY(1,1),
	ID_Animal INT,
	Age INT,
	EntryDate datetime not null,
	ExpiryDate datetime,
	isCurrent VARCHAR(1)
	);

CREATE TABLE AnimalInArea (                        /* FAKT 3 */
	ID_AnimalInArea INT PRIMARY KEY IDENTITY,
	ID_Enclosure INT FOREIGN KEY REFERENCES Enclosure(ID_Enclosure),
	SpeciesName VARCHAR(30) FOREIGN KEY REFERENCES Species(SpeciesName),
	ID_Area INT FOREIGN KEY REFERENCES AREA(ID_Area) ,
	ID_Animal INT FOREIGN KEY REFERENCES Animal(ID)
	);



