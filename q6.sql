select * from(
with t as (select V_VIlla.villaid,V_VIlla.owner, avg(V_review.rating) as rating from V_review,V_Villa
where  V_Villa.villaid=V_review.villaid
group by (V_Villa.villaid,V_Villa.owner)
order by avg(V_review.rating) desc)
select t.rating,t.owner,V_user.firstname,V_user.lastname from t,V_user where V_User.id=t.owner)
where rownum <= 3
