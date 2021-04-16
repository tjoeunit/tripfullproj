--story table 수정 : CKEditor 사용하기 위해

CREATE TABLE story (
	story_no NUMBER NOT NULL, /* 여행스토리번호 */
	members_no NUMBER, /* 멤버번호 */
	story_title VARCHAR2(100), /* 여행스토리제목 */
	story_content VARCHAR2(2000), /* 여행스토리내용 */
	story_re_ref NUMBER, /* 여행스토리댓글REF */
	story_re_lev NUMBER, /* 여행스토리댓글LEV */
	story_re_seq NUMBER, /* 여행스토리댓글SEQ */
	story_cnt NUMBER, /* 여행스토리조회수 */
	story_date DATE, /* 여행스토리작성일 */
	storyFileAttachPath VARCHAR2(300), /*여행스토리 첨부파일경로*/
	storyFilename VARCHAR2(200), /*여행스토리 첨부파일이름*/
	storyUploadFile VARCHAR2(2000), /*여행스토리 첨부파일*/
	CKEditorFuncNum VARCHAR2(500) /*여행스토리 ckeditor번호*/
);

ALTER TABLE story
	ADD
		CONSTRAINT PK_story
		PRIMARY KEY (
			story_no
		);

ALTER TABLE story
	ADD
		CONSTRAINT FK_members_TO_story
		FOREIGN KEY (
			members_no
		)
		REFERENCES members (
			members_no
		);