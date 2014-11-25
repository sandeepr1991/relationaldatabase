select avg(extract (year from CURRENT_DATE) - extract (year from V_User.DoB)) 
from V_user,V_reservation 
where V_user.ID=V_reservation.UserId and (extract (month from V_reservation.startDate) in ('9','10','11','12')) and extract (year from V_reservation.startDate)='2013'