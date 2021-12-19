use HD

DELETE FROM Time;
DBCC CHECKIDENT ('Time', RESEED, 0);

go

insert into dbo.Time("Hour", "TimeOfTheDay") values (0, 'Noc');
insert into dbo.Time("Hour", "TimeOfTheDay") values (1, 'Noc');
insert into dbo.Time("Hour", "TimeOfTheDay") values (2, 'Noc');
insert into dbo.Time("Hour", "TimeOfTheDay") values (3, 'Noc');
insert into dbo.Time("Hour", "TimeOfTheDay") values (4, 'Noc');
insert into dbo.Time("Hour", "TimeOfTheDay") values (5, 'Noc');
insert into dbo.Time("Hour", "TimeOfTheDay") values (6, 'Rano');
insert into dbo.Time("Hour", "TimeOfTheDay") values (7, 'Rano');
insert into dbo.Time("Hour", "TimeOfTheDay") values (8, 'Rano');
insert into dbo.Time("Hour", "TimeOfTheDay") values (9, 'Przedpoludnie');
insert into dbo.Time("Hour", "TimeOfTheDay") values (10, 'Przedpoludnie');
insert into dbo.Time("Hour", "TimeOfTheDay") values (11, 'Przedpoludnie');
insert into dbo.Time("Hour", "TimeOfTheDay") values (12, 'Przedpoludnie');
insert into dbo.Time("Hour", "TimeOfTheDay") values (13, 'Popoludnie');
insert into dbo.Time("Hour", "TimeOfTheDay") values (14, 'Popoludnie');
insert into dbo.Time("Hour", "TimeOfTheDay") values (15, 'Popoludnie');
insert into dbo.Time("Hour", "TimeOfTheDay") values (16, 'Popoludnie');
insert into dbo.Time("Hour", "TimeOfTheDay") values (17, 'Popoludnie');
insert into dbo.Time("Hour", "TimeOfTheDay") values (18, 'Wieczor');
insert into dbo.Time("Hour", "TimeOfTheDay") values (19, 'Wieczor');
insert into dbo.Time("Hour", "TimeOfTheDay") values (20, 'Wieczor');
insert into dbo.Time("Hour", "TimeOfTheDay") values (21, 'Wieczor');
insert into dbo.Time("Hour", "TimeOfTheDay") values (22, 'Wieczor');
insert into dbo.Time("Hour", "TimeOfTheDay") values (23, 'Wieczor');
