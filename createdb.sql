create table V_User(
	ID	varchar(4) NOT NULL,
	email	varchar(30),
	FirstName	varchar(30) NOT NULL,
	LastName	varchar(30) NOT NULL,
	DoB	Date,
	PRIMARY KEY(ID)
);

CREATE TABLE V_Villa (
	VillaId	varchar(10) NOT NULL,
	VillaName	varchar(50) NOT NULL,
	Owner	varchar(4) NOT NULL,
	PRIMARY KEY(VillaId)
);

CREATE TABLE V_Review (
	ReviewId	varchar(5) NOT NULL,
	UserId	varchar(4) NOT NULL,
	VillaId	varchar(10) NOT NULL,
	text	varchar(75),
	Rating	int,
	PRIMARY KEY(ReviewId),
  FOREIGN KEY(UserId) references V_User(ID) ON DELETE CASCADE,
  FOREIGN KEY(VillaId) references V_Villa(VillaId) ON DELETE CASCADE
);

CREATE TABLE V_LikedReviews (
	ReviewId	varchar(5) NOT NULL,
	UserId	varchar(4) NOT NULL,
	PRIMARY KEY(ReviewId,UserId),
  FOREIGN KEY(UserId) references V_User(ID) ON DELETE CASCADE,
  FOREIGN KEY(ReviewId) references V_REVIEW(REVIEWID) ON DELETE CASCADE
);

CREATE TABLE V_manager (
	ManagerId	varchar(4) NOT NULL,
	ManagedBy	varchar(4),
	PRIMARY KEY(ManagerId),
  FOREIGN KEY(ManagerId) references V_User(ID) ON DELETE CASCADE,
  FOREIGN KEY(ManagedBy) references V_manager(ManagerId) ON DELETE CASCADE
);


CREATE TABLE V_owner (
	OwnerId	varchar(4) NOT NULL,
	ContactNumber	varchar(20) NOT NULL,
	ManagedBy	varchar(4),
	PRIMARY KEY(OwnerId),
  FOREIGN KEY(OwnerId) references V_User(ID) ON DELETE CASCADE,
  FOREIGN KEY(ManagedBy) references V_manager(ManagerId) ON DELETE CASCADE
);


CREATE TABLE V_coupon (
	Coupon	varchar(10) NOT NULL,
	VillaId	varchar(10),
	StartDate	Date NOT NULL,
	EndDate	Date NOT NULL,
	Discount	int NOT NULL,
	PRIMARY KEY(Coupon),
  FOREIGN KEY(VillaId) references V_Villa(VillaId) ON DELETE CASCADE
);


CREATE TABLE V_rate (
	RateId	varchar(6) NOT NULL,
	VillaId	varchar(10) NOT NULL,
	StartDate	Date NOT NULL,
	EndDate	Date NOT NULL,
	Rate	Decimal NOT NULL,
  PRIMARY KEY(RateId),
  FOREIGN KEY(VillaId) references V_Villa(VillaId) ON DELETE CASCADE
);


CREATE TABLE V_reservation (
	ReservId	varchar(6) NOT NULL,
	UserId	varchar(4) NOT NULL,
	VillaID	varchar(10) NOT NULL,
	startDate	date NOT NULL,
	endDate	date NOT NULL,
	CouponID	varchar(10),
	Deposit	decimal NOT NULL,
  PRIMARY KEY(ReservId),
  FOREIGN KEY(UserId) references V_User(ID) ON DELETE CASCADE,
  FOREIGN KEY(VillaID) references V_Villa(VillaId) ON DELETE CASCADE
);

create table V_Features(
FeaId varchar(8) NOT NULL,
VillaId varchar(10) NOT NULL,
FeaName varchar(50) NOT NULL,
PRIMARY KEY(FeaId,VillaId),
FOREIGN KEY (VillaId) references V_Villa(VillaId) on delete cascade
);

create table V_favourite(
userid varchar(4) not null,
VillaId	varchar(10) NOT NULL,
primary key(userid,villaid),
foreign key (userid) references v_user(id) on delete cascade,
foreign key (Villaid) references v_villa(villaid) on delete cascade);

insert into V_User values
('U1','jack_killer@gmail.com','Jackie','Jones',to_date('02/28/1983','MM/DD/YYYY'));
insert into V_User values
('U2','Hello_macy@yahoo.com','Jessie','Jackson',to_date('03/04/1986','MM/DD/YYYY'));
insert into V_User values
('U3','john_black@hotmail.com','Tommy','Trojan',to_date('04/22/1990','MM/DD/YYYY'));
insert into V_User values
('U4','ny_robert@usc.edu','Niki','Nanjan',to_date('06/10/1980','MM/DD/YYYY'));
insert into V_User values
('U5','cool_andrew@bbc.co.uk','Jalli','Shadan',to_date('11/27/1984','MM/DD/YYYY'));
insert into V_User values
('U6','coryphillip@voa.gov','Houtan','Khandan',to_date('06/06/1966','MM/DD/YYYY'));
insert into V_User values
('U7','DaneilJ@msnbc.com','Naz','Nazi',to_date('04/20/2000','MM/DD/YYYY'));
insert into V_User values
('U8','rohanau@cs.mit.edu','Ab','Bazi',to_date('12/12/1956','MM/DD/YYYY'));
insert into V_User values
('U9','edmorales@houti.com','Ben','Ghazi',to_date('11/10/1973','MM/DD/YYYY'));
insert into V_User values
('U10','danamoon@louti.com','Carlos','Santana',to_date('07/07/1977','MM/DD/YYYY'));
insert into V_User values
('U11','owner1@villa.com','Roberto','Carlos',to_date('05/05/1955','MM/DD/YYYY'));
insert into V_User values
('U12','owner2@villa.com','De','Vilardo',to_date('04/04/1944','MM/DD/YYYY'));
insert into V_User values
('U13','owner3@villa.com','villa','Blanka',to_date('11/11/1974','MM/DD/YYYY'));
insert into V_User values
('U14','ceo@villa.com','nino','bino',to_date('01/01/1991','MM/DD/YYYY'));
insert into V_User values
('U15','manager2@villa.com','Bookish','Morinio',to_date('04/17/1950','MM/DD/YYYY'));
insert into V_Villa values
('Vil1','Fifi','U11');
insert into V_Villa values
('Vil2','Lulu','U12');
insert into V_Villa values
('Vil3','Penny','U13');
insert into V_Villa values
('Vil4','Kiki','U11');
insert into V_Villa values
('Vil5','Vivi','U11');
insert into V_Villa values
('Vil6','Gigi','U11');
insert into V_Villa values
('Vil7','Kitty','U12');
insert into V_Villa values
('Vil8','Ellie','U13');
insert into V_Villa values
('Vil9','Ali','U14');
insert into V_Villa values
('Vil10','Kelley','U12');
insert into V_Villa values
('Vil11','Dori','U12');
insert into V_Villa values
('Vil12','Houti','U13');
insert into V_Review values
('Rev1','U1','Vil1','Poor maintainance considering the price.',2);
insert into V_Review values
('Rev2','U2','Vil3','Boring and Dull',1);
insert into V_Review values
('Rev3','U4','Vil6','Love it!',4);
insert into V_Review values
('Rev4','U2','Vil1','Best vila error',2);
insert into V_Review values
('Rev5','U7','Vil1','Though not clean, has fantastic scenery around it',3);
insert into V_Review values
('Rev6','U5','Vil2','not recommended',1);
insert into V_Review values
('Rev7','U6','Vil1','Good one',4);
insert into V_Review values
('Rev8','U4','Vil4','I gonna rent again and again',5);
insert into V_Review values
('Rev9','U9','Vil3','Good work',5);
insert into V_Review values
('Rev10','U3','Vil9','A must visit villa',5);
insert into V_Review values
('Rev11','U10','Vil8','Nice',1);
insert into V_Review values
('Rev13','U6','Vil7','poor one',1);
insert into V_Review values
('Rev14','U1','Vil7','popular one',4);
insert into V_Review values
('Rev15','U7','Vil3','wanna go back!',5);
insert into V_LikedReviews values
('Rev1','U4');
insert into V_LikedReviews values
('Rev1','U2');
insert into V_LikedReviews values
('Rev1','U3');
insert into V_LikedReviews values
('Rev2','U7');
insert into V_LikedReviews values
('Rev2','U4');
insert into V_LikedReviews values
('Rev3','U8');
insert into V_LikedReviews values
('Rev4','U9');
insert into V_LikedReviews values
('Rev5','U2');
insert into V_LikedReviews values
('Rev5','U4');
insert into V_LikedReviews values
('Rev14','U2');
insert into V_LikedReviews values
('Rev14','U4');
insert into V_LikedReviews values
('Rev14','U6');
insert into V_LikedReviews values
('Rev15','U3');
insert into V_LikedReviews values
('Rev15','U6');
insert into V_LikedReviews values
('Rev15','U7');
insert into V_manager values
('U14',null);
insert into V_manager values
('U15','U14');
insert into V_Owner values
('U11','111-111-1111','U15');
insert into V_Owner values
('U12','222-222-2222','U15');
insert into V_Owner values
('U13','333-333-3333','U15');
insert into V_Owner values
('U14','444-444-4444',NULL);


insert into V_Rate values
('Rat1','Vil1',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/31/2013','mm/dd/yyyy'),150);
insert into V_Rate values
('Rat2','Vil2',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/31/2013','mm/dd/yyyy'),100);
insert into V_Rate values
('Rat3','Vil3',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/31/2013','mm/dd/yyyy'),200);
insert into V_Rate values
('Rat4','Vil4',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/31/2013','mm/dd/yyyy'),130);
insert into V_Rate values
('Rat5','Vil5',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/31/2013','mm/dd/yyyy'),120);
insert into V_Rate values
('Rat6','Vil6',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/01/2013','mm/dd/yyyy'),140);
insert into V_Rate values
('Rat7','Vil7',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/01/2013','mm/dd/yyyy'),180);
insert into V_Rate values
('Rat8','Vil8',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/01/2013','mm/dd/yyyy'),300);
insert into V_Rate values
('Rat9','Vil9',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/01/2013','mm/dd/yyyy'),80);
insert into V_Rate values
('Rat10','Vil10',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/01/2013','mm/dd/yyyy'),250);
insert into V_Rate values
('Rat11','Vil11',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/01/2013','mm/dd/yyyy'),170);
insert into V_Rate values
('Rat12','Vil12',to_date('01/01/2013','mm/dd/yyyy'),to_date('08/01/2013','mm/dd/yyyy'),110);
insert into V_Rate values
('Rat13','Vil1',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),120);
insert into V_Rate values
('Rat14','Vil2',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),75);
insert into V_Rate values
('Rat15','Vil3',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),160);
insert into V_Rate values
('Rat16','Vil4',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),90);
insert into V_Rate values
('Rat17','Vil5',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),80);
insert into V_Rate values
('Rat18','Vil6',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),100);
insert into V_Rate values
('Rat19','Vil7',to_date('09/01/2013','mm/dd/yyyy'),to_date('01/01/2013','mm/dd/yyyy'),150);
insert into V_Rate values
('Rat20','Vil8',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),200);
insert into V_Rate values
('Rat21','Vil9',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),50);
insert into V_Rate values
('Rat22','Vil10',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),200);
insert into V_Rate values
('Rat23','Vil11',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),120);
insert into V_Rate values
('Rat24','Vil12',to_date('09/01/2013','mm/dd/yyyy'),to_date('12/31/2013','mm/dd/yyyy'),90);
insert into V_Rate values
('Rat25','Vil1',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),180);
insert into V_Rate values
('Rat26','Vil2',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),120);
insert into V_Rate values
('Rat27','Vil3',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),240);
insert into V_Rate values
('Rat28','Vil4',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),150);
insert into V_Rate values
('Rat29','Vil5',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),150);
insert into V_Rate values
('Rat30','Vil6',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),180);
insert into V_Rate values
('Rat31','Vil7',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),250);
insert into V_Rate values
('Rat32','Vil8',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),400);
insert into V_Rate values
('Rat33','Vil9',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),110);
insert into V_Rate values
('Rat34','Vil10',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),320);
insert into V_Rate values
('Rat35','Vil11',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),210);
insert into V_Rate values
('Rat36','Vil12',to_date('01/01/2014','mm/dd/yyyy'),to_date('08/31/2014','mm/dd/yyyy'),140);
insert into V_reservation values
('Res1','U1','Vil1',to_date('02/01/2013','dd/mm/yyyy'),to_date('04/01/2013','dd/mm/yyyy'),null,50);
insert into V_reservation values
('Res2','U7','Vil2',to_date('05/01/2013','dd/mm/yyyy'),to_date('06/01/2013','dd/mm/yyyy'),null,30);
insert into V_reservation values
('Res3','U2','Vil3',to_date('03/02/2013','dd/mm/yyyy'),to_date('07/02/2013','dd/mm/yyyy'),null,60);
insert into V_reservation values
('Res4','U4','Vil4',to_date('04/02/2013','dd/mm/yyyy'),to_date('05/02/2013','dd/mm/yyyy'),null,39);
insert into V_reservation values
('Res5','U4','Vil5',to_date('06/03/2013','dd/mm/yyyy'),to_date('12/03/2013','dd/mm/yyyy'),null,40);
insert into V_reservation values
('Res6','U4','Vil6',to_date('23/04/2013','dd/mm/yyyy'),to_date('25/04/2013','dd/mm/yyyy'),null,42);
insert into V_reservation values
('Res7','U6','Vil7',to_date('29/05/2013','dd/mm/yyyy'),to_date('01/06/2013','dd/mm/yyyy'),null,60);
insert into V_reservation values
('Res8','U10','Vil8',to_date('30/07/2013','dd/mm/yyyy'),to_date('02/08/2013','dd/mm/yyyy'),null,100);
insert into V_reservation values
('Res9','U3','Vil9',to_date('11/08/2013','dd/mm/yyyy'),to_date('12/08/2013','dd/mm/yyyy'),null,24);
insert into V_reservation values
('Res10','U2','Vil10',to_date('19/08/2013','dd/mm/yyyy'),to_date('21/08/2013','dd/mm/yyyy'),null,75);
insert into V_reservation values
('Res11','U5','Vil11',to_date('15/08/2013','dd/mm/yyyy'),to_date('17/08/2013','dd/mm/yyyy'),null,51);
insert into V_reservation values
('Res12','U6','Vil12',to_date('27/08/2013','dd/mm/yyyy'),to_date('28/08/2013','dd/mm/yyyy'),null,33);
insert into V_reservation values
('Res13','U2','Vil1',to_date('01/09/2013','dd/mm/yyyy'),to_date('03/09/2013','dd/mm/yyyy'),null,40);
insert into V_reservation values
('Res14','U5','Vil2',to_date('02/09/2013','dd/mm/yyyy'),to_date('03/09/2013','dd/mm/yyyy'),null,25);
insert into V_reservation values
('Res15','U9','Vil3',to_date('15/09/2013','dd/mm/yyyy'),to_date('20/09/2013','dd/mm/yyyy'),'Coup3',36);
insert into V_reservation values
('Res16','U5','Vil4',to_date('01/10/2013','dd/mm/yyyy'),to_date('03/10/2013','dd/mm/yyyy'),'Coup4',27);
insert into V_reservation values
('Res17','U4','Vil5',to_date('15/10/2013','dd/mm/yyyy'),to_date('16/10/2013','dd/mm/yyyy'),null,24);
insert into V_reservation values
('Res18','U5','Vil6',to_date('02/11/2013','dd/mm/yyyy'),to_date('04/11/2013','dd/mm/yyyy'),null,30);
insert into V_reservation values
('Res19','U10','Vil7',to_date('06/11/2013','dd/mm/yyyy'),to_date('07/11/2013','dd/mm/yyyy'),null,50);
insert into V_reservation values
('Res20','U9','Vil8',to_date('06/11/2013','dd/mm/yyyy'),to_date('10/11/2013','dd/mm/yyyy'),null,60);
insert into V_reservation values
('Res21','U4','Vil9',to_date('10/11/2013','dd/mm/yyyy'),to_date('13/11/2013','dd/mm/yyyy'),null,15);
insert into V_reservation values
('Res22','U4','Vil10',to_date('11/11/2013','dd/mm/yyyy'),to_date('13/11/2013','dd/mm/yyyy'),null,60);
insert into V_reservation values
('Res23','U6','Vil11',to_date('01/12/2013','dd/mm/yyyy'),to_date('04/12/2013','dd/mm/yyyy'),null,40);
insert into V_reservation values
('Res24','U5','Vil12',to_date('23/12/2013','dd/mm/yyyy'),to_date('26/12/2013','dd/mm/yyyy'),null,30);
insert into V_reservation values
('Res25','U7','Vil1',to_date('12/01/2014','dd/mm/yyyy'),to_date('15/01/2014','dd/mm/yyyy'),'Coup1',48);
insert into V_reservation values
('Res26','U9','Vil2',to_date('06/01/2014','dd/mm/yyyy'),to_date('07/01/2014','dd/mm/yyyy'),'Coup2',34);
insert into V_reservation values
('Res27','U6','Vil2',to_date('05/02/2014','dd/mm/yyyy'),to_date('09/02/2014','dd/mm/yyyy'),null,40);
insert into V_reservation values
('Res28','U5','Vil5',to_date('09/02/2014','dd/mm/yyyy'),to_date('15/02/2014','dd/mm/yyyy'),null,50);
insert into V_reservation values
('Res29','U4','Vil8',to_date('18/03/2014','dd/mm/yyyy'),to_date('19/03/2014','dd/mm/yyyy'),null,120);
insert into V_reservation values
('Res30','U2','Vil4',to_date('27/04/2014','dd/mm/yyyy'),to_date('30/04/2014','dd/mm/yyyy'),null,50);
insert into V_reservation values
('Res31','U4','Vil10',to_date('29/05/2014','dd/mm/yyyy'),to_date('01/06/2014','dd/mm/yyyy'),null,96);
insert into V_reservation values
('Res32','U9','Vil12',to_date('28/07/2014','dd/mm/yyyy'),to_date('02/08/2014','dd/mm/yyyy'),null,42);
insert into V_reservation values
('Res33','U9','Vil7',to_date('11/08/2014','dd/mm/yyyy'),to_date('12/08/2014','dd/mm/yyyy'),null,75);
insert into V_reservation values
('Res34','U7','Vil4',to_date('15/08/2014','dd/mm/yyyy'),to_date('21/08/2014','dd/mm/yyyy'),null,50);
insert into V_reservation values
('Res35','U8','Vil8',to_date('13/08/2014','dd/mm/yyyy'),to_date('17/08/2014','dd/mm/yyyy'),null,120);
insert into V_reservation values
('Res36','U3','Vil2',to_date('27/08/2014','dd/mm/yyyy'),to_date('28/08/2014','dd/mm/yyyy'),null,40);
insert into V_reservation values
('Res37','U2','Vil11',to_date('20/06/2014','dd/mm/yyyy'),to_date('23/06/2014','dd/mm/yyyy'),null,70);
insert into V_reservation values
('Res38','U1','Vil2',to_date('28/08/2014','dd/mm/yyyy'),to_date('30/08/2014','dd/mm/yyyy'),null,40);
insert into V_reservation values
('Res39','U9','Vil1',to_date('10/04/2014','dd/mm/yyyy'),to_date('15/04/2014','dd/mm/yyyy'),null,60);
insert into V_reservation values
('Res40','U9','Vil7',to_date('05/02/2014','dd/mm/yyyy'),to_date('09/02/2014','dd/mm/yyyy'),null,75);
insert into V_reservation values
('Res41','U8','Vil7',to_date('09/02/2014','dd/mm/yyyy'),to_date('15/02/2014','dd/mm/yyyy'),null,75);
insert into V_reservation values
('Res42','U5','Vil7',to_date('18/03/2014','dd/mm/yyyy'),to_date('19/03/2014','dd/mm/yyyy'),null,75);
insert into V_reservation values
('Res43','U6','Vil1',to_date('12/05/2014','dd/mm/yyyy'),to_date('13/05/2014','dd/mm/yyyy'),'Coup5',51);
insert into V_Coupon values
('Coup1','Vil1',to_Date('09/01/2013','MM/DD/YYYY'),to_Date('01/31/2014','MM/DD/YYYY'),20);
insert into V_Coupon values
('Coup2','Vil2',to_Date('09/01/2013','MM/DD/YYYY'),to_Date('12/31/2013','MM/DD/YYYY'),15);
insert into V_Coupon values
('Coup3','Vil3',to_Date('09/01/2013','MM/DD/YYYY'),to_Date('12/31/2013','MM/DD/YYYY'),25);
insert into V_Coupon values
('Coup4','Vil4',to_Date('09/01/2013','MM/DD/YYYY'),to_Date('12/31/2013','MM/DD/YYYY'),10);
insert into V_Coupon values
('Coup5','Vil1',to_Date('01/01/2014','MM/DD/YYYY'),to_Date('08/31/2014','MM/DD/YYYY'),15);

insert into V_Features values
('Fea1','Vil1','swimming pool');
insert into V_Features values
('Fea1','Vil2','swimming pool');
insert into V_Features values
('Fea1','Vil3','swimming pool');
insert into V_Features values
('Fea2','Vil1','Jacuzzi');
insert into V_Features values
('Fea2','Vil11','Jacuzzi');
insert into V_Features values
('Fea2','Vil12','Jacuzzi');
insert into V_Features values
('Fea2','Vil4','Jacuzzi');

insert into V_Features values
('Fea3','Vil7','billiard table');
insert into V_Features values
('Fea4','Vil3','Xbox 360');
insert into V_Features values
('Fea4','Vil5','Xbox 360');
insert into V_Features values
('Fea4','Vil7','Xbox 360');

insert into V_Features values
('Fea5','Vil3','board games');
insert into V_Features values
('Fea5','Vil7','board games');
insert into V_Features values
('Fea5','Vil9','board games');
insert into V_Features values
('Fea5','Vil10','board games');

insert into V_Features values
('Fea6','Vil7','pets allowed');
insert into V_Features values
('Fea6','Vil6','pets allowed');
insert into V_Features values
('Fea6','Vil8','pets allowed');

insert into v_favourite values('U1','Vil2');
insert into v_favourite values('U1','Vil4');
insert into v_favourite values('U2','Vil8');
insert into v_favourite values('U3','Vil10');
insert into v_favourite values('U3','Vil3');
insert into v_favourite values('U3','Vil7');
insert into v_favourite values('U4','Vil10');
insert into v_favourite values('U4','Vil4');
insert into v_favourite values('U5','Vil1');
insert into v_favourite values('U6','Vil3');
insert into v_favourite values('U7','Vil4');
insert into v_favourite values('U7','Vil2');
insert into v_favourite values('U7','Vil12');
insert into v_favourite values('U8','Vil2');
insert into v_favourite values('U8','Vil9');
insert into v_favourite values('U9','Vil6');
insert into v_favourite values('U10','Vil11');
insert into v_favourite values('U11','Vil12');
insert into v_favourite values('U13','Vil1');
insert into v_favourite values('U14','Vil2');





