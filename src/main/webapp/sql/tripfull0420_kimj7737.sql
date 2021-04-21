--CKEditor 이미지 업로드를 위한 테이블 생성
--따로 jsp 파일 만들어야 함 (practice.jsp 참고)


/* 흠 */
CREATE TABLE story_CKEditor (
	story_CKEditor_no NUMBER NOT NULL,
	story_CKEditor_title VARCHAR2(300),
	story_CKEditor_content clob    /* story_content 대체 가능할 것 같음 */
);

ALTER TABLE CKEditor
	ADD
		CONSTRAINT PK_story_CKEditor
		PRIMARY KEY (
			story_CKEditor_no
		);
		
CREATE SEQUENCE story_CKEditor_seq
increment by 1
start with 1
nocache;

commit