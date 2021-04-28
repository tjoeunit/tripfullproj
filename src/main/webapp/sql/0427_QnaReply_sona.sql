-- QNA 댓글 기능 추가를 위한 테이블 생성

CREATE TABLE QNAREPLY(
	QREPLY_NO		NUMBER NOT NULL, 	/* 댓글 번호 */
	MEMBERS_ID	VARCHAR2(300),			/* 멤버 아이디(작성자) */
	QNA_NO			NUMBER,						/* QNA 게시글 번호 */
	QREPLY_TEXT	VARCHAR2(3000),			/* 댓글 내용 */
	QREPLY_DATE	DATE default sysdate	/* 댓글 작성일 */
);

ALTER TABLE QNAREPLY
	ADD
		CONSTRAINT PK_QNAREPLY
		PRIMARY KEY (
			QREPLY_NO
		);
		
-- 게시글이 삭제될 때 댓글도 삭제될 수 있도록 외래키 설정
ALTER TABLE QNAREPLY 
	ADD
		CONSTRAINT FK_QNA
		FOREIGN KEY (QNA_NO)
		REFERENCES QNA(QNA_NO);