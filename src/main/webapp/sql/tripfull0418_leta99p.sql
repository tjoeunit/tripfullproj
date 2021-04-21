/* 가입된 회원정보 모두 삭제 (데이터 존재 시 변경불가) */
delete from members;

/* members_zipcode 컬럼 데이터타입 varchar2(30)으로 변경 */
alter table members modify members_zipcode VARCHAR2(30);

/* members_birth 컬럼 삭제 (사용하지 않음) */
alter table members drop column members_birth;

/* members_regdate 가입일 오라클에서 자동 입력되도록 설정 */
alter table members modify members_regdate default sysdate;

commit
