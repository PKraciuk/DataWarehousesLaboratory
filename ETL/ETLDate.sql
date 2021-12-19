use HD
go
DELETE FROM Date;

DBCC CHECKIDENT ('Date', RESEED, 0);

-- Fill DimDates Lookup Table
-- Step a: Declare variables use in processing
Declare @StartDate date; 
Declare @EndDate date;

-- Step b:  Fill the variable with values for the range of years needed
SELECT @StartDate = '2019-01-01', @EndDate = '2021-12-31';

-- Step c:  Use a while loop to add dates to the table
Declare @DateInProcess datetime = @StartDate;

While @DateInProcess <= @EndDate
	Begin
	--Add a row into the date dimension table for this date
		Insert Into [dbo].[Date]
		( [dateUQ],
		  [Day],
		  [Month],
		  [Year],
		  [DayOfWeek],
		  [IfWeekend],
		  [IfHoliday]
		)
		Values ( 
		  @DateInProcess -- [Date]
		  , Cast (Day(@DateInProcess) as varchar(2))
		  , Cast( Month(@DateInProcess) as int) -- [MonthNo]
		  , Cast( Year(@DateInProcess) as varchar(4)) -- [Year]
		  , Cast( DATEPART(dw, @DateInProcess) as int) -- [DayOfWeekNo]
		  , CASE
				WHEN DATEPART(dw, @DateInProcess) = 1 THEN 1
				WHEN DATEPART(dw, @DateInProcess) = 7 THEN 1
				ELSE 0
			END
		  , 0
		);  
		Set @DateInProcess = DateAdd(d, 1, @DateInProcess);
	End
go
If (object_id('swieta') is not null) DROP TABLE swieta
CREATE TABLE swieta(data DATETIME PRIMARY KEY, swieto VARCHAR(500));

insert into dbo.swieta ("data", "swieto") values ('2019-01-01', 'Nowy Rok');
insert into dbo.swieta ("data", "swieto") values ('2019-01-06', 'Œwiêto Trzech Króli'); 
insert into dbo.swieta ("data", "swieto") values ('2019-05-01', 'Œwiêto Pracy');
insert into dbo.swieta ("data", "swieto") values ('2019-05-03', 'Œwiêto Konstytucji 3 Maja');
insert into dbo.swieta ("data", "swieto") values ('2019-08-15', 'Œwiêto Wniebowziêcia Najœwiêtszej Marii Panny');
insert into dbo.swieta ("data", "swieto") values ('2019-11-01', 'Uroczystoœæ Wszystkich Œwiêtych');
insert into dbo.swieta ("data", "swieto") values ('2019-11-02', 'Zaduszki');
insert into dbo.swieta ("data", "swieto") values ('2019-11-11', 'Narodowe Œwiêto Niepodleg³oœci');
insert into dbo.swieta ("data", "swieto") values ('2019-12-24', 'Wigilia Bo¿ego Narodzenia');
insert into dbo.swieta ("data", "swieto") values ('2019-12-25', 'Bo¿e Narodzenie');
insert into dbo.swieta ("data", "swieto") values ('2019-12-26', 'Drugi dzieñ œwi¹t Bo¿ego Narodzenia');
insert into dbo.swieta ("data", "swieto") values ('2019-12-31', 'Sylwester');

insert into dbo.swieta ("data", "swieto") values ('2020-01-01', 'Nowy Rok');
insert into dbo.swieta ("data", "swieto") values ('2020-01-06', 'Œwiêto Trzech Króli'); 
insert into dbo.swieta ("data", "swieto") values ('2020-05-01', 'Œwiêto Pracy');
insert into dbo.swieta ("data", "swieto") values ('2020-05-03', 'Œwiêto Konstytucji 3 Maja');
insert into dbo.swieta ("data", "swieto") values ('2020-08-15', 'Œwiêto Wniebowziêcia Najœwiêtszej Marii Panny');
insert into dbo.swieta ("data", "swieto") values ('2020-11-01', 'Uroczystoœæ Wszystkich Œwiêtych');
insert into dbo.swieta ("data", "swieto") values ('2020-11-02', 'Zaduszki');
insert into dbo.swieta ("data", "swieto") values ('2020-11-11', 'Narodowe Œwiêto Niepodleg³oœci');
insert into dbo.swieta ("data", "swieto") values ('2020-12-24', 'Wigilia Bo¿ego Narodzenia');
insert into dbo.swieta ("data", "swieto") values ('2020-12-25', 'Bo¿e Narodzenie');
insert into dbo.swieta ("data", "swieto") values ('2020-12-26', 'Drugi dzieñ œwi¹t Bo¿ego Narodzenia');
insert into dbo.swieta ("data", "swieto") values ('2020-12-31', 'Sylwester');

insert into dbo.swieta ("data", "swieto") values ('2021-01-01', 'Nowy Rok');
insert into dbo.swieta ("data", "swieto") values ('2021-01-06', 'Œwiêto Trzech Króli'); 
insert into dbo.swieta ("data", "swieto") values ('2021-05-01', 'Œwiêto Pracy');
insert into dbo.swieta ("data", "swieto") values ('2021-05-03', 'Œwiêto Konstytucji 3 Maja');
insert into dbo.swieta ("data", "swieto") values ('2021-08-15', 'Œwiêto Wniebowziêcia Najœwiêtszej Marii Panny');
insert into dbo.swieta ("data", "swieto") values ('2021-11-01', 'Uroczystoœæ Wszystkich Œwiêtych');
insert into dbo.swieta ("data", "swieto") values ('2021-11-02', 'Zaduszki');
insert into dbo.swieta ("data", "swieto") values ('2021-11-11', 'Narodowe Œwiêto Niepodleg³oœci');
insert into dbo.swieta ("data", "swieto") values ('2021-12-24', 'Wigilia Bo¿ego Narodzenia');
insert into dbo.swieta ("data", "swieto") values ('2021-12-25', 'Bo¿e Narodzenie');
insert into dbo.swieta ("data", "swieto") values ('2021-12-26', 'Drugi dzieñ œwi¹t Bo¿ego Narodzenia');
insert into dbo.swieta ("data", "swieto") values ('2021-12-31', 'Sylwester');

insert into dbo.swieta ("data", "swieto") values ('2019-04-21', 'Wielkanoc');			
insert into dbo.swieta ("data", "swieto") values ('2019-04-22', 'Poniedzia³ek Wielkanocny');	
insert into dbo.swieta ("data", "swieto") values ('2019-06-09', 'Zielone Œwi¹tki');			
insert into dbo.swieta ("data", "swieto") values ('2019-06-20', 'Bo¿e Cia³o');	

insert into dbo.swieta ("data", "swieto") values ('2020-04-12', 'Wielkanoc');			
insert into dbo.swieta ("data", "swieto") values ('2020-04-13', 'Poniedzia³ek Wielkanocny');	
insert into dbo.swieta ("data", "swieto") values ('2020-05-31', 'Zielone Œwi¹tki');			
insert into dbo.swieta ("data", "swieto") values ('2020-06-11', 'Bo¿e Cia³o');	

insert into dbo.swieta ("data", "swieto") values ('2021-04-04', 'Wielkanoc');			
insert into dbo.swieta ("data", "swieto") values ('2021-04-05', 'Poniedzia³ek Wielkanocny');	
insert into dbo.swieta ("data", "swieto") values ('2021-05-23', 'Zielone Œwi¹tki');			
insert into dbo.swieta ("data", "swieto") values ('2021-06-03', 'Bo¿e Cia³o');	

go
If (object_id('vETLDates') is not null) Drop View vETLDates;
go
go
CREATE View vETLDates
AS
SELECT
		  ST1.[dateUQ],
		  ST1.[Day],
		  ST1.[Month],
		  ST1.[Year],
		  ST1.[DayOfWeek],
		  ST1.[IfWeekend],
		  CASE
			WHEN ST2.swieto is not null THEN 1
			ELSE 0
		END AS [IfHoliday]
FROM Date as ST1
JOIN swieta AS ST2 on ST2.data=ST1.dateUQ

go
MERGE INTO Date as DST
	USING vETLDates as SRC
		ON DST.dateUQ = SRC.dateUQ
			WHEN Matched -- when dates match...
			THEN -- update WorkingDay, Holiday and BeforeHolidayDay columns
				UPDATE
				SET DST.IfHoliday = SRC.IfHoliday
			;

	DROP View vETLDates