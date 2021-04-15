/* 멤버 */
CREATE TABLE members (
	members_no NUMBER NOT NULL, /* 멤버번호 */
	members_id VARCHAR2(30), /* 멤버아이디 */
	members_pw VARCHAR2(30), /* 멤버비밀번호 */
	members_name VARCHAR2(30), /* 멤버이름 */
	members_tel VARCHAR2(30), /* 멤버전화번호 */
	members_birth DATE, /* 멤버생일 */
	members_email VARCHAR2(30), /* 멤버이메일 */
	members_regdate DATE, /* 멤버가입일 */
	members_outdate DATE, /* 멤버탈퇴일 */
	members_gender VARCHAR2(30), /* 멤버성별 */
	members_zipcode NUMBER, /* 멤버우편번호 */
	members_address VARCHAR2(200), /* 멤버주소 */
	members_address_detail VARCHAR2(200) /* 멤버주소상세 */
);

ALTER TABLE members
	ADD
		CONSTRAINT PK_members
		PRIMARY KEY (
			members_no
		);

/* 여행스토리 */
CREATE TABLE story (
	story_no NUMBER NOT NULL, /* 여행스토리번호 */
	members_no NUMBER, /* 멤버번호 */
	story_title VARCHAR2(100), /* 여행스토리제목 */
	story_content VARCHAR2(2000), /* 여행스토리내용 */
	story_imgname VARCHAR2(500), /* 여행스토리사진이름 */
	story_imgorigin VARCHAR2(500), /* 여행스토리사진원본이름 */
	story_imgsize VARCHAR2(500), /* 여행스토리사진크기 */
	story_re_ref NUMBER, /* 여행스토리댓글REF */
	story_re_lev NUMBER, /* 여행스토리댓글LEV */
	story_re_seq NUMBER, /* 여행스토리댓글SEQ */
	story_cnt NUMBER, /* 여행스토리조회수 */
	story_date DATE /* 여행스토리작성일 */
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

/* 항공 */
CREATE TABLE flight (
	flight_no NUMBER NOT NULL, /* 항공번호 */
	flight_title VARCHAR2(100), /* 항공제목 */
	flight_content VARCHAR2(2000), /* 항공내용 */
	flight_img VARCHAR2(500), /* 항공그림 */
	flight_thumb VARCHAR2(500), /* 항공썸네일 */
	flight_price NUMBER, /* 항공가격 */
	flight_departure VARCHAR2(30), /* 항공출발지 */
	flight_arrival VARCHAR2(30) /* 항공도착지 */
);

ALTER TABLE flight
	ADD
		CONSTRAINT PK_flight
		PRIMARY KEY (
			flight_no
		);

/* 숙박 */
CREATE TABLE hotel (
	hotel_no NUMBER NOT NULL, /* 숙박번호 */
	hotel_title VARCHAR2(100), /* 숙박제목 */
	hotel_content VARCHAR2(2000), /* 숙박내용 */
	hotel_img VARCHAR2(500), /* 숙박그림 */
	hotel_thumb VARCHAR2(500), /* 숙박썸네일 */
	hotel_category VARCHAR2(30), /* 숙박구분 */
	hotel_price NUMBER, /* 숙박가격 */
	hotel_area VARCHAR2(30) /* 숙박지역 */
);

ALTER TABLE hotel
	ADD
		CONSTRAINT PK_hotel
		PRIMARY KEY (
			hotel_no
		);

/* 액티비티 */
CREATE TABLE activity (
	activity_no NUMBER NOT NULL, /* 액티비티번호 */
	activity_title VARCHAR2(100), /* 액티비티제목 */
	activity_content VARCHAR2(2000), /* 액티비티내용 */
	activity_img VARCHAR2(500), /* 액티비티그림 */
	activity_thumb VARCHAR2(500), /* 액티비티썸네일 */
	activity_category VARCHAR2(30), /* 액티비티구분 */
	activity_price NUMBER, /* 액티비티가격 */
	activity_area VARCHAR2(30), /* 액티비티지역 */
	activity_enddate DATE /* 액티비티사용기한 */
);

ALTER TABLE activity
	ADD
		CONSTRAINT PK_activity
		PRIMARY KEY (
			activity_no
		);

/* 랜선여행 */
CREATE TABLE lantrip (
	lantrip_no NUMBER NOT NULL, /* 랜선여행번호 */
	lantrip_title VARCHAR2(100), /* 랜선여행제목 */
	lantrip_content VARCHAR2(2000), /* 랜선여행내용 */
	lantrip_img VARCHAR2(500), /* 랜선여행그림 */
	lantrip_thumb VARCHAR2(500), /* 랜선여행썸네일 */
	lantrip_price NUMBER, /* 랜선여행가격 */
	lantrip_area VARCHAR2(30) /* 랜선여행지역 */
);

ALTER TABLE lantrip
	ADD
		CONSTRAINT PK_lantrip
		PRIMARY KEY (
			lantrip_no
		);

/* 결제 */
CREATE TABLE payment (
	payment_no NUMBER NOT NULL, /* 결제번호 */
	members_no NUMBER, /* 멤버번호 */
	flight_no NUMBER, /* 항공번호 */
	hotel_no NUMBER, /* 숙박번호 */
	activity_no NUMBER, /* 액티비티번호 */
	lantrip_no NUMBER, /* 랜선여행번호 */
	payment_bookdate DATE, /* 결제예약일 */
	payment_quantity NUMBER, /* 결제수량 */
	payment_price NUMBER, /* 결제가격 */
	payment_date DATE /* 결제완료일 */
);

ALTER TABLE payment
	ADD
		CONSTRAINT PK_payment
		PRIMARY KEY (
			payment_no
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_members_TO_payment
		FOREIGN KEY (
			members_no
		)
		REFERENCES members (
			members_no
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_flight_TO_payment
		FOREIGN KEY (
			flight_no
		)
		REFERENCES flight (
			flight_no
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_hotel_TO_payment
		FOREIGN KEY (
			hotel_no
		)
		REFERENCES hotel (
			hotel_no
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_activity_TO_payment
		FOREIGN KEY (
			activity_no
		)
		REFERENCES activity (
			activity_no
		);

ALTER TABLE payment
	ADD
		CONSTRAINT FK_lantrip_TO_payment
		FOREIGN KEY (
			lantrip_no
		)
		REFERENCES lantrip (
			lantrip_no
		);

/* 리뷰 */
CREATE TABLE review (
	review_no NUMBER NOT NULL, /* 리뷰번호 */
	members_no NUMBER, /* 멤버번호 */
	flight_no NUMBER, /* 항공번호 */
	hotel_no NUMBER, /* 숙박번호 */
	activity_no NUMBER, /* 액티비티번호 */
	lantrip_no NUMBER, /* 랜선여행번호 */
	review_title VARCHAR2(100), /* 리뷰제목 */
	review_content VARCHAR2(2000), /* 리뷰내용 */
	review_star NUMBER, /* 리뷰별점 */
	review_date DATE /* 리뷰작성일 */
);

ALTER TABLE review
	ADD
		CONSTRAINT PK_review
		PRIMARY KEY (
			review_no
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_members_TO_review
		FOREIGN KEY (
			members_no
		)
		REFERENCES members (
			members_no
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_flight_TO_review
		FOREIGN KEY (
			flight_no
		)
		REFERENCES flight (
			flight_no
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_hotel_TO_review
		FOREIGN KEY (
			hotel_no
		)
		REFERENCES hotel (
			hotel_no
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_activity_TO_review
		FOREIGN KEY (
			activity_no
		)
		REFERENCES activity (
			activity_no
		);

ALTER TABLE review
	ADD
		CONSTRAINT FK_lantrip_TO_review
		FOREIGN KEY (
			lantrip_no
		)
		REFERENCES lantrip (
			lantrip_no
		);

/* 시퀀스 */
CREATE SEQUENCE members_seq
increment by 1
start with 1
nocache;

CREATE SEQUENCE flight_seq
increment by 1
start with 1
nocache;

CREATE SEQUENCE hotel_seq
increment by 1
start with 1
nocache;

CREATE SEQUENCE activity_seq
increment by 1
start with 1
nocache;

CREATE SEQUENCE lantrip_seq
increment by 1
start with 1
nocache;

CREATE SEQUENCE payment_seq
increment by 1
start with 1
nocache;

CREATE SEQUENCE review_seq
increment by 1
start with 1
nocache;

CREATE SEQUENCE story_seq
increment by 1
start with 1
nocache;

/*관리자 아이디 생성*/
INSERT INTO members (members_no, members_id, members_pw, members_name)
VALUES (members_seq.nextval, 'admin', '1004', '운영자');

commit