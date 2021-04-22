/*1. hotel table 수정 : 이미지 업로드 사용하기 위해*/
alter table hotel rename column hotel_img to  hotel_img1;
alter table hotel rename column hotel_thumb to  hotel_img2;
alter table hotel add hotel_img3  VARCHAR2(500);

/*2. hotel 테이블 img 컬럼 2개 삭제 */
alter table hotel
	drop column hotel_img2;
alter table hotel	
	drop column hotel_img3;	

/*3. hotel 테이블 img1 이름 변경*/
alter table hotel
	rename column hotel_img1 to hotel_img; 

/*4. hotel 테이블 video 컬럼 삭제*/
alter table hotel
	drop column flight_video;	

