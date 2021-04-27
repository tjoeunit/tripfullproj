ALTER TABLE payment MODIFY payment_bookdate DEFAULT (null);
ALTER TABLE payment MODIFY payment_bookdate varchar2(300);
ALTER TABLE payment MODIFY payment_bookdate DEFAULT (null);
commit