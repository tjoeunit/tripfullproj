-- story 사용하지 않는 칼럼 삭제 (댓글, 이미지)
alter table story drop (story_re_ref, story_re_lev, story_re_seq, story_imgname, story_imgorigin, story_imgsize);

-- story_content 칼럼 데이터 유형 변경
alter table story drop (story_content);    			/* 삭제 후 */
alter table story add (story_content clob); 		/* 재생성 */

-- story_writer 컬럼 추가 (아이디)
alter table story add (story_writer varchar2(100));

-- 게시 날짜 story_date의 default 값으로 오늘 날짜가 입력되도록 설정
alter table story modify story_date default sysdate;

-- 조회수 story_cnt의 default 값을 0으로 설정
alter table story modify story_cnt default 0;
