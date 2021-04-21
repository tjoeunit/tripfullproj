/* 랜트립에서 영상을 추가해야해서 랜트립 상품 등록 시 필요한 영상url 컬럼, 카테고리 컬럼 생성*/

alter table lantrip
	add lantrip_video VARCHAR2(2000);