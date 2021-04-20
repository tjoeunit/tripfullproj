CREATE TABLE practice (
	practice_no NUMBER NOT NULL,
	practice_title VARCHAR2(300),
	practice_content VARCHAR2(2000)
);

ALTER TABLE practice
	ADD
		CONSTRAINT PK_practice
		PRIMARY KEY (
			practice_no
		);
		
CREATE SEQUENCE practice_seq
increment by 1
start with 1
nocache;

commit