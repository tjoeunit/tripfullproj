/* 관리자 */
CREATE TABLE admin (
	admin_no NUMBER NOT NULL, /* 관리자번호 */
	admin_id VARCHAR2(30) NOT NULL, /* 관리자아이디 */
	admin_pw VARCHAR2(30) NOT NULL, /* 관리자비밀번호 */
	admin_name VARCHAR2(30)NOT NULL, /* 관리자이름 */
	admin_tel VARCHAR2(30), /* 관리자전화번호 */
	join_date date default sysdate
);

ALTER TABLE admin
	ADD
		CONSTRAINT PK_admin
		PRIMARY KEY (
			admin_id
		);


/*관리자 아이디 생성*/
INSERT INTO admin (admin_no, admin_id, admin_pw, admin_name)
VALUES (admin_seq.nextval, 'admin', '1004', '운영자');

commit