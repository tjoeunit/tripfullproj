/* 테이블 삭제 */
/* cascade constraints : 외래키 무시하고 그냥 삭제 */
/* purge : 휴지통에 저장되지 않고 바로 삭제 */
drop table activity cascade constraints purge;
drop table flight cascade constraints purge;
drop table hotel cascade constraints purge;
drop table lantrip cascade constraints purge;
drop table story cascade constraints purge;
drop table practice cascade constraints purge;
drop table review cascade constraints purge;
drop table admin cascade constraints purge;
drop table members cascade constraints purge;
drop table payment cascade constraints purge;

/* 시퀀스 삭제 */
drop sequence activity_seq;
drop sequence flight_seq;
drop sequence hotel_seq;
drop sequence lantrip_seq;
drop sequence story_seq;
drop sequence practice_seq;
drop sequence review_seq;
drop sequence members_seq;
drop sequence payment_seq;

commit