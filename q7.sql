select * from(
select V_reservation.Villaid,sum(V_reservation.enddate-V_reservation.startdate)
from V_reservation
where extract(year from V_reservation.startdate) = 2014
GROUP BY V_reservation.villaid
Order BY sum(V_reservation.enddate-V_reservation.startdate) desc)
where rownum<=1