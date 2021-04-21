/*hotel table 수정 : 이미지 업로드 사용하기 위해*/
alter table hotel rename 
	column hotel_img to  hotel_img1;
alter table hotel rename 
	column hotel_thumb to  hotel_img2;
alter table hotel 
	add hotel_img3  VARCHAR2(500); 

/* 3. flight 테이블 hotel_thumb 컬럼 추가 */	
alter table hotel 
	add hotel_thumb  VARCHAR2(500); 	
	
/* 4. hotel 테이블 video 컬럼 추가 */
alter table hotel
	add flight_video VARCHAR2(2000);	
	

	
	

