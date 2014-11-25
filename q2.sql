select count(*) as number_of_villas,V_user.id,V_user.firstname,v_user.lastname from  V_User,V_Villa
where V_User.ID=V_Villa.owner
group by (V_User.ID,V_user.firstname,V_user.lastname)
Order by count(*)


