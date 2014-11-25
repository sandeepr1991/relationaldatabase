select Distinct V_User.ID, V_User.FirstName,V_User.LastName from V_User,V_reservation,V_coupon
where V_user.ID=V_reservation.UserId and V_reservation.couponid=V_coupon.coupon and V_coupon.Discount>10