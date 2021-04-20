--hotel table 수정 : 이미지 업로드 사용하기 위해
alter table hotel rename column hotel_img to  hotel_img1;
alter table hotel rename column hotel_thumb to  hotel_img2;
alter table hotel add hotel_img3  VARCHAR2(500); 
