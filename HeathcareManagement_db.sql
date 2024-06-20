create database demo
use demo


--- TABLE CREATION


create table specialization
(
	SPEC_ID int not null,
	Title varchar(255) not null,
	Primary key(SPEC_ID)
);


create table Doctor
(
	DOC_ID int Not Null,
	Name varchar(255) not null,
	contact_number varchar(50),
	Specialization_ID int not null,
	Primary key(DOC_ID),
	foreign key(Specialization_ID) references specialization(SPEC_ID)
);

create table patient
(
	PAT_ID int Not Null,
	Name varchar(255) not null,
	Phone_number varchar(50),
	Waiting_list varchar(255) not null,
	primary Key(PAT_ID)
);

create table clinic
(
	Clinic_ID int not null,
	States varchar(255),
	City varchar(255),
	Street varchar(255),
	Phone_number varchar(255) not null,
	Open_hour time,
	Close_hour time,
	Primary Key(Clinic_ID)
);

create table appointments
(
	APOINT_ID int not null,
	Recurrence varchar(255),
	Time_slot varchar(255),
	date varchar(255),
	Entertained varchar(255),
	Patient_ID int not null,
	Clinic_ID int not null,
	Doctor_ID int not null,
	SPID int not null
	foreign key(Patient_ID) references patient(PAT_ID),
	foreign key(Clinic_ID) references clinic(Clinic_ID),
	foreign key(Doctor_ID) references doctor(DOC_ID),
foreign key(SPID) references specialization(SPEC_ID),
	Primary key(APOINT_ID),
);

create table waitingList
(
	Ticket int not null,
	Arrival_time time,
	Date date,
	Patient_ID int not null,
	foreign key(Patient_ID) references patient(PAT_ID),
);


create table assignment
(
	Clinic_ID int not null,
	Doc_ID int not null,
	Time_slot varchar(50),
	Working_day varchar(50),
	foreign key(Clinic_ID) references clinic(Clinic_ID),
	foreign key(Doc_ID) references doctor(DOC_ID)
);

create table Working_days
(
	DayNum int not null,
	primary key(DayNum),
	Day varchar(20) not null
);


create table AAssignment
(
	Clinic_ID int not null,
	Doc_ID int not null,
	Time_slot varchar(50),
	DayNumber int not null,
	foreign key(DayNumber) references Working_days(DayNum),
	foreign key(Clinic_ID) references clinic(Clinic_ID),
	foreign key(Doc_ID) references doctor(Doc_ID),
);



-- DATA INSERTION


insert into specialization
values
	(1, 'Radiology'),
	(2, 'Cardiology'),
	(3, 'Oncology'),
	(4, 'Surgery')



insert into Doctor
values
	(101, 'AHMED' ,'092-22981' ,1),
	(102, 'SHAYAAN' ,'092-22982' ,4),
	(103, 'DAYAAN' ,'092-22983' ,3),
	(104, 'HISHAAM' ,'092-22984' ,1),
	(105, 'HAMMAD' ,'092-22985' ,4),
	(106, 'RAHEEM' ,'092-22986' ,3),
	(107, 'UZAIR' ,'092-22987' ,2)



insert into patient
values
	(19,'HAMZA','090-12300','No'),
	(20,'HASAN','090-12401','No'),
	(21,'TALHA','090-12502','No'),
	(22,'TAHA','090-12603','No'),
	(23,'RIMSHA','090-12704','No'),
	(24,'AREEBA','090-12805','No'),
	(25,'EEMAN','090-12906','No'),
	(26,'AIZAA','090-13007','No'),
	(27,'MANAAL','090-13108','No')




insert into clinic
values
	(99,'PUNJAB','LAHORE','A','000-67123','09:00AM','10:00PM'),
	(98,'SINDH','KARACHI','G','000-67124','10:00AM','11:00PM'),
	(97,'PUNJAB','SIALKOT','G','000-67125','08:00AM','10:00PM'),
	(96,'PUNJAB','MULTAN','F','000-67126','09:00AM','09:00PM'),
	(95,'KPK','PESHAWAR','E','000-67127','11:00AM','10:00PM')





insert into appointments
values


	(111, 'Daily', '11:00AM', '12-3-2022','NO',19, 99,101,1),						
	(112, 'Monthly', '12:00AM', '12-3-2022','NO',20,98,102,2),
	(113, 'Weekly', '10:00AM', '12-3-2022','NO',21,97,103,3),
	(114, 'Daily', '12:00PM', '12-3-2022','NO',22,96,104,4),
	(115, 'Monthly', '1:00PM', '12-3-2022','NO',23,95,105,1),
	(116, 'Weekly', '11:00AM', '15-3-2022','NO',24,99,106,2),
	(117, 'Daily', '12:00AM', '15-3-2022','NO',25,98,107,3),
	(118, 'Monthly', '10:00AM', '15-3-2022','NO',26,97,101,4),
	(119, 'Weekly', '11:00AM', '15-3-2022','NO',27,96,102,1),
	(120, 'Daily', '11:00AM', '12-4-2022','NO',19,95,102,2),
	(121, 'Weekly', '10:00AM', '12-4-2022','NO',20,99,103,3),
	(122, 'Daily', '12:00PM', '12-4-2022','NO',21,98,104,4),
	(123, 'Monthly', '1:00PM', '12-4-2022','NO',22,97,105,1),
	(124, 'Monthly', '9:00AM', '22-3-2022','NO',23,96,106,2),
	(125, 'Weekly', '10:00AM', '22-3-2022','NO',24,95,107,3),
	(126, 'Daily', '10:00AM', '22-3-2022','NO',25,99,101,4),
	(127, 'Monthly', '11:00AM', '22-3-2022','NO',26,98,102,1),
	(128, 'Weekly', '10:00AM', '22-3-2022','NO',27,97,103,2),
	(129, 'Weekly', '09:00AM', '22-4-2022','NO',19,96,104,3),
	(130, 'Daily', '11:00AM', '17-4-2022','NO',20,95,105,4),
	(131, 'Monthly', '11:00AM', '17-4-2022','NO',21,99,106,1),
	(132, 'Daily', '2:00PM', '17-4-2022','NO',22,98,107,2),
	(133, 'Monthly', '1:00PM', '17-4-2022','NO',23,97,101,3),
	(134, 'Daily', '4:00PM', '11-5-2022','NO',24,96,102,4),
	(135, 'Weekly', '11:00AM', '11-5-2022','NO',25,95,103,1),
	(136, 'Daily', '11:00AM', '11-5-2022','NO',26,99,104,2),
	(137, 'Monthly', '11:00AM', '11-5-2022','NO',27,98,105,3),
	(138, 'Daily', '2:00PM', '11-5-2022','NO',19,97,106,4),
	(139, 'Weekly', '3:00PM', '29-5-2022','NO',20,96,107,1),
	(140, 'Monthly', '11:00AM', '29-5-2022','NO',21,95,101,2),
	(141, 'Monthly', '12:00PM', '29-5-2022','NO',22,99,102,3),
	(142, 'Weekly', '11:00AM', '29-5-2022','NO',23,98,103,4),
	(143, 'Daily', '5:00PM', '29-5-2022','NO',24,97,104,1),
	(144, 'Weekly', '8:00PM', '29-5-2022','NO',25,96,105,2),
	(145, 'Monthly', '4:00PM', '29-5-2022','NO',26,95,106,3),
	(146, 'Weekly', '12:00PM', '29-5-2022','NO',27,99,107,4)





insert into assignment
values

	(99, 101, '8:00AM', 'Monday'),
	(98, 102, '8:00AM', 'Monday'),
	(97, 103, '9:00AM', 'Monday'),
	(96, 104, '9:00AM', 'Tuesday'),
	(95, 105, '8:00AM', 'Tuesday'),
	(99, 106, '10:00AM', 'Wednesday'),
	(98, 107, '11:00AM', 'Wednesday'),
	(97, 101, '3:00PM', 'Wednesday'),
	(96, 102, '8:00AM', 'Wednesday'),
	(95, 103, '8:00AM', 'Wednesday'),
	(99, 104, '9:00AM', 'Friday'),
	(98, 105, '10:00AM', 'Friday'),
	(97, 106, '2:00PM', 'Friday'),
	(96, 107, '4:00PM', 'Friday')



insert into Working_days
values

	(1, 'Monday'),
	(2, 'Tuesday'),
	(3, 'Wednesday'),
	(4, 'Thursday'),
	(5, 'Friday'),
	(6, 'Satureday')

	
insert into assignment
values

	(99, 101, '11:00AM', 1),
	(98, 102, '11:00AM', 1),
	(97, 103, '10:00AM', 2),
	(96, 104, '10:00AM', 1),
	(95, 105, '12:00PM', 3),
	(99, 106, '10:00AM', 4),
	(98, 107, '11:00AM', 4),
	(97, 101, '3:00PM', 2),
	(96, 102, '8:00PM', 5),
	(95, 103, '8:00PM', 5),
	(99, 104, '12:00PM', 3),
	(98, 105, '10:00AM', 1),
	(97, 106, '2:00PM', 2),
	(96, 107, '4:00PM', 2)



-- QUERIES


-------------------------------------------------------------------------------------------


-- Query no. 1
-- All patients with appointments on a certain clinic X (weekly, monthly, daily)

select p.Name ,a.Recurrence , a.date
from appointments A

JOIN patient P
on A.Patient_ID = P.PAT_ID

where a.Clinic_ID = 95 and a.entertained='NO'


-------------------------------------------------------------------------------------------



-- Query no. 2
-- All patients with appointments related to a certain specialty on all clinics (weekly, monthly, daily)

select P.Name , A.Recurrence , A.date, S.title
from appointments A

JOIN patient P
on A.Patient_ID = P.PAT_ID

join specialization S
on S.SPEC_ID = A.SPID

where a.SPID = 2 and a.entertained='NO'


-------------------------------------------------------------------------------------------



-- Query no. 3
-- All patient appointments with a certain set of doctors (weekly, monthly, daily)

select P.Name, A.Recurrence, A.date, D.Name
from appointments A

JOIN patient P
on A.Patient_ID = P.PAT_ID

JOIN Doctor D
on D.DOC_ID = A.Doctor_ID

where A.Doctor_ID in (101,102,103)

order by Doctor_ID


-------------------------------------------------------------------------------------------



-- Query no. 4
-- All appointments or assignments on clinic(s) within a certain time

select A.APOINT_ID, D.Name,P.Name, A.Clinic_ID, A.time_slot
from appointments A

join assignment Ass 
on A.time_slot = Ass.time_slot and A.Clinic_ID = Ass.Clinic_ID and A.Doctor_ID = Ass.Doc_ID

join doctor D
on D.DOC_ID = A.Doctor_ID

join patient P
on P.PAT_ID = A.Patient_ID

where A.time_slot in('11:00PM','1:00PM','11:00AM')


-------------------------------------------------------------------------------------------



-- Query no. 5
-- Doctors of same specialty with overlapping assignments on clinic (weekly, monthly, daily)

Select D.Name, A.Clinic_ID, D.Specialization_ID, A.time_slot, A.dayNumber
from Doctor D

join AAssignment A
on D.DOC_ID = A.Doc_ID

join Doctor D1
on D.Specialization_ID = D1.Specialization_ID

-- checking overlapping
join AAssignment A1
on A.Time_slot = A1.Time_slot

where A.DayNumber = A1.DayNumber and D.DOC_ID != D1.DOC_ID and A.Time_slot = A1.Time_slot and D.Specialization_ID = D1.Specialization_ID

group by d.Name, A.Clinic_ID, D.Specialization_ID, A.Time_slot, A.DayNumber
order by DayNumber


-------------------------------------------------------------------------------------------



-- Query no. 6
-- Doctors with least number of appointments on a clinic(s) (weekly, monthly, daily)

Select D.Name, D.DOC_ID
from Doctor D 

where DOC_ID in 
(

select top 3 A.Doctor_ID
from appointments A
group by A.Doctor_ID
order by count(A.Doctor_ID) asc

)

-------------------------------------------------------------------------------------------


-----Extra Queries-----

-- Query no. 7
-- Query to fetch data of Clinics who have time from 09:00AM To 10:00PM

select Clinic_ID, concat(Street,', ',city,', ',states) as 'Address',Phone_number
from clinic
where open_hour='09:00AM' and close_hour='10:00PM' 

-------------------------------------------------------------------------------------------


-- Query no. 8
--Query to data of Surgery Specialization

select A.APOINT_ID, A.Clinic_ID, A.date
from appointments A
join specialization S
on A.SPID = S.SPEC_ID
where S.title = 'Surgery'


-------------------------------------------------------------------------------------------


-- Query no. 9
-- Query to fetch the specialty who has highest number of doctors

select * 
from specialization
where SPEC_ID = (select top 1 specialization_ID from Doctor group by Specialization_ID order by count(Specialization_ID) desc)


-------------------------------------------------------------------------------------------



-- Query no. 10
--Query to Doctor's Appointment on Specific Day on Specific clinic

select D.Name, C.Clinic_ID, S.title, WD.Day, A.time_slot
from doctor D

join AAssignment A
on A.Doc_ID = D.DOC_ID

join clinic C
on A.Clinic_ID = C.Clinic_ID

join Working_days WD
on WD.DayNum = a.DayNumber

join specialization S
on d.Specialization_ID = S.SPEC_ID

where WD.Day = 'Thursday'





-------------------------------------------------------------------------------------------


-- Query no. 11
--Query to get the patients data who's recurrence are daily and are not entertained

select P.PAT_ID, P.Name, p.Phone_number, A.APOINT_ID, A.date 
from patient P
join appointments A
on P.PAT_ID = A.Patient_ID
where A.Recurrence = 'Daily' and entertained = 'NO'

-------------------------------------------------------------------------------------------