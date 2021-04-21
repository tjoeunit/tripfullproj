/* 랜트립에서 영상을 추가해야해서 랜트립 상품 등록 시 필요한 영상url 컬럼, 카테고리 컬럼 생성*/
alter table lantrip
	drop column lantrip_img;

alter table lantrip
	add lantrip_img1 VARCHAR2(2000)
	add lantrip_img2 VARCHAR2(2000)
	add lantrip_img3 VARCHAR2(2000)
	add lantrip_img4 VARCHAR2(2000)
	add lantrip_img5 VARCHAR2(2000);

/* 흠 */	
select *from LANTRIP;
delete from lantrip where lantrip_price >= 20000;

