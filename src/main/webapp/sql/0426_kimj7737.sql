-- 댓글 기능 추가를 위한 테이블 생성

CREATE TABLE REPLY(
    REPLY_NO NUMBER NOT NULL,		/* 댓글 번호 */
	MEMBERS_ID VARCHAR2(300),			/* 멤버 아이디 (작성자) */
    STORY_NO NUMBER,						/* 댓글달린 게시글 번호 */
	REPLY_TEXT VARCHAR2(3000),			/* 댓글 내용 */
	REPLY_DATE DATE default sysdate	/* 댓글 작성일 */
);

ALTER TABLE REPLY
	ADD
		CONSTRAINT PK_REPLY
		PRIMARY KEY (
			REPLY_NO
		);
		
CREATE SEQUENCE REPLY_SEQ
increment by 1
start with 1
nocache;


-- 게시글이 삭제될 때 댓글도 삭제될 수 있도록 외래키 설정
alter table reply add constraint fk_story
foreign key(story_no) references story(story_no); 