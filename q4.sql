select v_user.id,v_user.firstname, v_user.lastname
from
(select * from(
select userid,sum(deposit) from v_reservation
where extract(year from v_reservation.startdate)=2013
group by userid
order by sum(deposit) desc)
where rownum<=3)t,v_user
where t.userid= v_user.id