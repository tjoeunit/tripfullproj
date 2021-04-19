/* 상품 등록시 필요한 영상 url 저장 */
alter table lantrip
	add lantrip_video VARCHAR2(2000); 

/* 이미지 첨부를 위한 경로 저장 */
alter table lantrip
	add lantrip_img_path VARCHAR2(3000); 

/* 썸네일 첨부를 위한 경로 저장 */
alter table lantrip
	add lantrip_thumb_path VARCHAR2(800); 

	select *from lantrip;