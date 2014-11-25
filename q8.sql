create OR REPLACE view v1 as
select V_review.villaid,V_review.userid,count(*) as count1 from V_review, v_likedreviews
  where V_review.reviewid=V_likedreviews.reviewid
  group by (V_review.userid,V_review.villaid)
  order by count1 desc;
CREATE OR REPLACE view v2 as
(select (count(*)) as usercount,userid from
(select * from v1,
(select max(count1)maxcount,villaid from v1
group by v1.villaid)t where v1.villaid=t.villaid and  t.maxcount= v1.count1)
group by userid);

SELECT T.usercount, v_user.id, v_user.firstname, v_user.lastname FROM
(select usercount,userid from v2 where usercount = (select max(usercount) from v2))T,V_USER
WHERE V_USER.id=T.USERID

  