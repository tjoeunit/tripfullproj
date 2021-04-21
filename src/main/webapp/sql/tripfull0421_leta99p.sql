/* 1. flight 테이블 img 컬럼 삭제 */
alter table flight
	drop column flight_img;

/* 2. flight 테이블 img 컬럼 5개 추가 */
alter table flight
	add flight_img1 VARCHAR2(2000)
	add flight_img2 VARCHAR2(2000)
	add flight_img3 VARCHAR2(2000)
	add flight_img4 VARCHAR2(2000)
	add flight_img5 VARCHAR2(2000);

/* 3. flight 테이블 video 컬럼 추가 */
alter table flight
	add flight_video VARCHAR2(2000);
	
/* 4. flight 테이블 price 컬럼 타입 변경*/
alter table flight modify flight_price VARCHAR2(100);

