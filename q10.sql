CREATE OR REPLACE VIEW V1 AS
SELECT R1.*
FROM v_RESERVATION R1, V_RESERVATION R2
WHERE (R2.STARTDATE > R1.STARTDATE
AND R2.STARTDATE < R1.ENDDATE)
UNION
SELECT R1.*
FROM V_RESERVATION R1, V_RESERVATION R2
WHERE (R2.STARTDATE > R1.STARTDATE
AND R2.STARTDATE < R1.ENDDATE);

CREATE OR REPLACE VIEW V2 AS
SELECT V1.USERID, COUNT(*) AS COUNT1
FROM V1
GROUP BY V1.USERID;

SELECT V2.userID, V2.COUNT1, V_USER.FirstNAME, V_USER.LastNAME
FROM V2, V_USER 
WHERE V2.USERID=V_USER.id
AND V2.COUNT1 > '1';

