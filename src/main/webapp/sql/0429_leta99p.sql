alter table payment modify payment_bookdate varchar2(300);
alter table payment modify payment_bookdate default(null);

alter table payment drop constraint fk_activity_to_payment;
alter table payment drop constraint fk_flight_to_payment;
alter table payment drop constraint fk_hotel_to_payment;
alter table payment drop constraint fk_lantrip_to_payment;
alter table payment drop constraint fk_members_to_payment;

alter table payment add flight_title varchar2(600);
alter table payment add hotel_title varchar2(600);
alter table payment add activity_title varchar2(600);
alter table payment add lantrip_title varchar2(600);
alter table payment add product_category varchar2(600);
