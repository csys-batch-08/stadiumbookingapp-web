create table users(
	userid NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1,
    name  varchar2(25) not null,
    username varchar2(15) not null unique,
    role  varchar2(10) default 'User',
    password varchar2(15) not null,
    email varchar2(30) not null unique,
    phoneNumber number(10) not null UNIQUE,
    primary key(userid)
);
commit;
ALTER TABLE users
ADD wallet number(30) default 0;

desc users;
ALTER TABLE users
ADD profilePic varchar2(4000) default 'defultImg.jpg';

update users set wallet=0;
select * from wallet_details;
select wallet from users where userid=53;
delete wallet_details where walletid=81;
Update users set wallet=20000 where userid=121;
Insert into Users (name,username,password,email,phonenumber) values('Chandler Bing','Chandler@10','Monica@c7',9897923434);

select * from users order by userid;
select userid,name,username,role,password,email,phonenumber,to_char(wallet,'99,000,000') from users where userid=53;
desc users;
select MATCH_ID,SPORTSID,STADIUM_NAME,LOCATION,to_char(MATCH_DATE,'yyyy-mm-dd'),to_char(MATCH_TIME,'HH:MI'),TEAMA,TEAMB,TEAMALOGO,TEAMBLOGO,TOTALSEATS,AVAILABLESEATS, ,SECONDCLASS_SEATS_PRICE from match_info order by match_date desc;
		Select WALLETID,USERID,AMOUNT,TRANSACTION_DATE from wallet_details where USERID=64;
create table match_info(
match_id    NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1,
sportsId int not null,
stadium_name varchar2(30) not null,
location varchar2(50) not null,
match_date date not null,
match_time TIMESTAMP WITH TIME ZONE,
teamA varchar2(15) not null,
teamB varchar2(15) not null,
teamAlogo varchar(1000)  ,
teamBlogo varchar2(1000)  ,
totalseats int not null,
availableSeats int not null,
firstClass_Seats_price int not null,
secondClass_seats_price int null,
primary key(match_id),
FOREIGN KEY(sportsId) REFERENCES sports_info(sportsId)
);

desc match_info;
--ALTER TABLE match_info
--ADD match_summary varchar2(200);

select * from match_info order by match_date  desc;
select * from users order by userid;
select SYSTIMESTAMP from dual;
insert into match_info(sportsId,stadium_name, location,match_date, match_time,teamA,teamB,teamAlogo, teamBlogo, totalseats, availableSeats, firstClass_Seats_price, secondClass_seats_price) values(100,Wankhede,Mumbai,Mumbai,01-01-70 07:30:00.000000000 PM ASIA/CALCUTTA ,CSK,MI,https://i2.wp.com/iplnews.site/wp-content/uploads/2020/09/csk-transparent-png-by-iplnews-1.png?fit=555%2C555&ssl=1,https://iconape.com/wp-content/png_logo_vector/mumbai-indians-logo.png,300,150,2000,900);
commit;
select * from match_info where lower(teama) like 'c%' or teamb like 'm%';
update match_info set availableSeats=availableSeats-4 where match_id=2;
 
 --availableSeats=100
 update match_info set availableSeats=100 where match_id=81;
 
delete match_info where match_id=161;
update match_info set match_date=match_date+1;
select  round(to_date(to_char(match_date,'yyyy-mm-dd'), 'yyyy-mm-dd')- sysdate) as matchDate  from match_info;

select stadium_name,location, round(to_char(match_date,'yyyy-mm-dd'),teamA,teamB,teamAlogo,teamBlogo,totalseats,availableseats from match_info;
drop table match_info;

CREATE SEQUENCE match_id
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 1000;

drop sequence match_id;

select * from match_info;
update match_info set match_date=match_date+1;
delete from match_info where match_id=141;
select to_char(match_time,'HH:MI') from match_info;
select match_id,sportsid, stadium_name,location,to_char(match_date,'dd-mm-yyyy') as match_date, to_char(match_time,'HH:MI') as match_time,teamA,teamB,teamAlogo,teamBlogo,firstclass_seats_price,secondclass_seats_price,totalseats,availableseats from match_info;

select MATCH_ID,SPORTSID,STADIUM_NAME,LOCATION,to_char(MATCH_DATE,'yyyy-mm-dd'),to_char(MATCH_TIME,'HH:MI'),TEAMA,TEAMB,TEAMALOGO,TEAMBLOGO,TOTALSEATS,AVAILABLESEATS,FIRSTCLASS_SEATS_PRICE,SECONDCLASS_SEATS_PRICE from match_info where teama like 'C%' or teamb like 'C%'; 
create table sports_info(



sportsId  NUMBER GENERATED ALWAYS AS IDENTITY START WITH 100 ,
sportsName varchar2(50) not null,
eventName varchar2(40) not null,
primary key(sportsId)
);

desc sports_info;
drop table sports_info;
commit;
insert into sports_info(sportsName,eventName) values('Cricket','ICC World Cup'); 
CREATE SEQUENCE sportsId
MINVALUE 10
START WITH 10
INCREMENT BY 10
CACHE 1000;
drop sequence sportsId;

select * from sports_info;
drop table sports_info;

update sports_info set sportsid=103 where sportsid=121;
delete sports_info  where sportsid=140;
select FindSportsId(Sportsname,eventname) as SporstId from sports_info;

select sportsid from sports_info where sportsname='Cricket' and eventname='IPL';
select FindSportsId('Cricket','IPL') as SporstId from sports_info where rownum <2;
select * from sports_info;

Exec function 
---------------------------------
CREATE OR REPLACE Function FindSportsId
   ( sports_Name IN sports_info.sportsName%type,
  event_Name IN sports_info.eventName%type )
   RETURN number
IS
   sports_Id number;
   cursor spId is
   SELECT sportsId
     FROM sports_info
     WHERE sportsName = sports_Name and eventName=event_Name;
     
BEGIN
   open spId;
   fetch spId into sports_Id;
   close spId;
RETURN sports_Id;
END;
/
---------------------------



----------------------------------------

CREATE OR REPLACE FUNCTION get_sportsId(
    sports_name in sports_info.sportsname%type;
    event_name in sports_info.eventname%type;
) 
RETURN NUMBER
IS
    sports_id NUMBER := 0;
BEGIN
    
    SELECT sportsid
    INTO sports_id
    FROM sports_info 
    WHERE sportsname = sports_name and eventname=event_name;
    RETURN sports_id ;
END;
/


Exec function get_sportsId('Cricket','IPL');
--seat detalis

create table seat_details(
ticketId NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1,
userid int not null,
ticket_numbers varchar(100) not null,
match_id   int not null,
seatclass varchar(50) not null,
Totalpirce int not null,
seatcount int not null,
FOREIGN KEY(userid) REFERENCES users(userid),
FOREIGN KEY(match_id) REFERENCES match_info(match_id),
primary key(ticketId)
);

desc seat_details;
select * from seat_details;

delete from seat_details where match_id=141;
insert into seat_details(userid,ticket_numbers,match_id,seatclass,Totalpirce,seatcount) values(56,'B1,B2,B3',4,'Second Class',2700,3);
	delete  seat_details where ticketid=102;
drop table seat_details;
commit;
ALTER TABLE seat_details
ADD Status varchar(255) default 'Booked'; 
update match_info set availableSeats=availableSeats+3 where match_id=2;

select wallet from users;

 create table wallet_details(
walletId NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1 primary key ,
userId int not null,
amount number(30) default 0,
FOREIGN KEY(userid) REFERENCES users(userid)
);

desc wallet_details;

drop table wallet_details;
select to_char(Transaction_Date,'dd-mm-yyyy HH:MI:SS') from wallet_details;
select * from wallet_details;

ALTER TABLE wallet_details
add  Transaction_Date timestamp default systimestamp;

select sysdate+90 from dual;
delete from wallet_details where walletid=42 ;
update wallet_details set amount=20000 where userid=121;

create table stadium_detalis(
stadium_id NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1,
stadium_name varchar(50),
stadium_img varchar(3000),
primary key(stadium_id)
);

desc stadium_detalis;
drop  table stadium_detalis;
insert into stadium_detalis (stadium_name,stadium_img) values ('Chepauk','https://resize.indiatvnews.com/en/resize/oldbucket/715_-/sportscricket/IndiaTv7ebb19_ma.jpg'); 
insert into stadium_detalis (stadium_name,stadium_img) values ('Wankhede','https://assets.architecturaldigest.in/photos/60082844a28465f75014be44/16:9/w_1280,c_limit/ipl-2018-wankhede-stadium-mumbai-indians-chennai-superkings-1366x768.jpg');
insert into stadium_detalis (stadium_name,stadium_img) values('Jawaharlal nehru','https://images.indianexpress.com/2020/03/jln-stadium.jpg');
insert into stadium_detalis (stadium_name,stadium_img) values('Chinnaswamy','https://www.deccanherald.com/sites/dh/files/articleimages/2021/04/28/chinnaswamy-dh-979646-1619549852.jpg');
insert into stadium_detalis (stadium_name,stadium_img) values('Eden Garden','https://www.india.com/wp-content/uploads/2018/08/16-kolkata-eden-gardens-3-1.jpg');
insert into stadium_detalis (stadium_name,stadium_img) values('Indira Gandhi Athletic','https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2017/09/20/Pictures/_6ae70e06-9def-11e7-ba2d-20fa1b34073f.jpg');

update stadium_detalis set stadium_img='Chepauk.jpg' where stadium_name='Chepauk';

delete from stadium_detalis where stadium_id=41; 
select * from stadium_detalis;

drop table Ratings;

create table Ratings(
reviewID NUMBER GENERATED ALWAYS AS IDENTITY START WITH 1,
userId int not null,
reviews varchar2(4000),
ratings number(2,1), 
stadium_id int not null,
primary key(reviewId),
FOREIGN KEY(userid) REFERENCES users(userid),
foreign key(stadium_id) references stadium_detalis(stadium_id)
);

desc Ratings;
select * from ratings;


commit;
create table Betting(
betId int primary key,
betAmount not null,
matchId int not null,
userId int not null,
sportsId int not null,
FOREIGN KEY(userid) REFERENCES users(userid),
FOREIGN KEY(match_id) REFERENCES match_info(match_id),
FOREIGN KEY(sportsId) REFERENCES sports_info(sportsId)
);








 