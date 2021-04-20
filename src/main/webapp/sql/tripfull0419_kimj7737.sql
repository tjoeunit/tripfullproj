--story table 수정 : CKEditor 사용하기 위해

alter table story drop (story_imgname,story_imgorigin,story_imgsize);

alter table story add (storyFilename VARCHAR2(200), storyUploadFile VARCHAR2(2000), CKEditorFuncNum VARCHAR2(500));


--story_date을 default로 오늘 날짜 입력되도록 설정
alter table story modify story_date default sysdate;
