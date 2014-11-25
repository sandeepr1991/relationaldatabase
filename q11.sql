create or replace view book2013 as
select v_reservation.villaid,count(v_reservation.villaid) as count2013 from v_reservation
where (extract(year from v_reservation.startdate) = 2013 or extract(year from v_reservation.enddate) = 2013) and (extract (month from v_reservation.startdate) in (1,2,3,4,5,6,7,8) or extract (month from v_reservation.enddate) in (1,2,3,4,5,6,7,8))
group by v_reservation.villaid;

create or replace view book2014 as
select v_reservation.villaid,count(v_reservation.villaid) as count2014 from v_reservation
where (extract(year from v_reservation.startdate) = 2014 or extract(year from v_reservation.enddate) = 2014) and (extract (month from v_reservation.startdate) in (1,2,3,4,5,6,7,8) or extract (month from v_reservation.enddate) in (1,2,3,4,5,6,7,8))
group by v_reservation.villaid;


select * from book2013;
select * from book2014;


select unique v_user.id, v_user.firstname, v_user.lastname from V_User,v_villa,
(select book2014.villaid from book2013,book2014
where book2013.villaid=book2014.villaid and book2014.count2014 > book2013.count2013) t
where t.villaid=v_villa.villaid and v_villa.owner=v_user.id
