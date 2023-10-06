/*
    날짜: 2023/10/02
    이름: 조유빈
    내용: 2장 데이터베이스 기본
*/

//실습1-1
create table User1 (
    ID      VARCHAR2(20),
    NAME    VARCHAR2(20),
    HP      CHAR(13),
    AGE     NUMBER
);
drop table User1;

//실습1-2
insert into User1 values ('A101', '김유신', '010-1234-1111', 25);
insert into User1 values ('A102', '김춘추', '010-1234-2222', 23);
insert into User1 values ('A103', '장보고', '010-1234-3333', 32);
insert into User1 (id, name, age) values ('A104', '강감찬', 45);
insert into User1 (id, name, hp) values ('A105', '이순신', '010-1234-5555');

//실습1-3
select * from User1;
select * from User1 where id='A101';
select * from User1 where name='김춘추';
select * from User1 where age > 30;
select id, name, age from User1;

//실습1-4
update User1 set hp='010-1234-4444' where id='A104';
update User1 set age=51 where id='A105';
update User1 set hp='010-1234-1001', age=27 where id='A101';

//실습1-5
delete from User1 where id='A101';
delete from User1 where id='A102' and age=25;
delete from User1 where age >= 30;

//실습2-1. 기본키 실습
create table USER2 (
    ID      VARCHAR2(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13),
    AGE     NUMBER(2)
);

//실습2-2. 
create table USER3 (
    ID      VARCHAR(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13) UNIQUE,
    AGE     NUMBER(3)
);

insert into USER3 values ('A101', '김유신', '010-1234-1001', 25);
insert into USER3 values ('A102','김춘추', '010-1234-1002', 23);
insert into USER3 values ('A103', '장보고', '010-1234-1003', 33);
insert into USER3 values ('A104', '강감찬', '010-1234-1004', 43); 
insert into USER3 values ('A105', '이순신', '010-1234-1005', 53);

// 실습 2-3.
create table PARENT (
    PID     VARCHAR2(20) PRIMARY KEY,
    NAME    VARCHAR2(20),
    HP      CHAR(13) UNIQUE
);

create table CHILD (
    CID     VARCHAR2(20) PRIMARY KEY, 
    NAME    VARCHAR2(20),
    HP      CHAR(13) UNIQUE,
    PARENT  VARCHAR(20),
    FOREIGN KEY(PARENT) REFERENCES PARENT (PID)
);

insert into parent values ('P101','김서현','010-1234-1001');
insert into parent values ('P102','이성계','010-1234-1002');
insert into parent values ('P103','신사임당','010-1234-1003');

insert into child values ('C101', '김유신', '010-1234-2001', 'P101');
insert into child values ('C102', '이방우', '010-1234-2002', 'P102');
insert into child values ('C103', '이방원', '010-1234-2003', 'P102');
insert into child values ('C104', '이이', '010-1234-2004', 'P103');

//실습 2-4.
create table USER4 (
    NAME    VARCHAR2(20) NOT NULL,
    GENDER  CHAR(1) NOT NULL,
    AGE     INT DEFAULT 1,
    ADDR    VARCHAR2(255)
);
insert into USER4 values ('김유신', 'M', 23, '김해시');
insert into USER4 values ('김춘추', 'M', 21, '경주시');
insert into USER4 (NAME, GENDER, ADDR) values ('신사임당', 'F', '강릉시');
insert into USER4 (NAME, GENDER) values ('이순신', 'M');
insert into USER4 (NAME, GENDER, AGE) values ('정약용', 'M' ,33);

//실습 2-5.
create table USER5 (
    NAME    VARCHAR2(20) NOT NULL,
    GENDER  CHAR(1) NOT NULL CHECK(GENDER IN('M','F')),
    AGE     INT DEFAULT 1 CHECK(AGE > 0 AND AGE < 100),
    ADDR    VARCHAR2(255)
);

insert into USER5 values ('김유신', 'M', 23, '김해시');
insert into USER5 values ('김춘추', 'M', 21, '경주시');
insert into USER5 (NAME, GENDER, ADDR) values ('신사임당', 'F', '강릉시');
insert into USER5 (NAME, GENDER) values ('이순신', 'M');
insert into USER5 (NAME, GENDER, AGE) values ('정약용', 'M' ,33);

// 실습 3-1. 데이터 사전 조회
select * from DICT;

SELECT TABLE_NAME FROM USER_TABLES;

SELECT OWNER, TABLE_NAME FROM ALL_TABLES;

SELECT * FROM DBA_TABLES;

SELECT * FROM DBA_USERS;

// 실습 3-2. 인덱스 조회/생성/삭제
-- 현재 사용자 인덱스 조회
SELECT * FROM USER_INDEXES;

-- 현재 사용자 인덱스 정보 조회
SELECT * FROM USER_IND_COLUMNS;

-- 인덱스 생성
CREATE INDEX IDX_USER1_ID ON USER1(ID);
SELECT * FROM USER_IND_COLUMNS;

-- 인덱스 삭제
DROP INDEX IDX_USER1_ID;
SELECT * FROM USER_IND_COLUMNS;

// 실습 3-3. 뷰 생성 권한 할당
GRANT CREATE VIEW TO scott;

// 실습 3-4. 뷰 생성/조회/삭제
// 뷰 생성
CREATE VIEW VW_USER1 AS (SELECT NAME, HP, AGE FROM USER1);

CREATE VIEW VW_USER2_AGE_UNDER30 AS (
    SELECT * FROM USER2 WHERE AGE < 30
);

SELECT * FROM USER_VIEWS;

// 뷰 조회
SELECT * FROM VW_USER1;
SELECT * FROM VW_USER2_AGE_UNDER30;

// 뷰 삭제
DROP VIEW VW_USER1;
DROP VIEW VW_USER2_AGE_UNDER30;

// 실습 3-5. 시퀀스 실습
CREATE TABLE USER6 (
    SEQ     NUMBER PRIMARY KEY,
    NAME    VARCHAR2(20),
    GENDER  CHAR(1),
    AGE     NUMBER,
    ADDR    VARCHAR2(255)
);

// 실습 3-6. 시퀀스 생성
CREATE SEQUENCE SEQ_USER6 INCREMENT BY 1 START WITH 1;

// 실습 3-7. 시퀀스 값 입력
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '김유신','M', 25, '김해시');
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '김춘추','M', 23, '경주시');
INSERT INTO USER6 VALUES (SEQ_USER6.NEXTVAL, '신사임당','F', 27, '강릉시');

// 실습 4-1. 사용자 생성(system 접속)
alter session set "_oracle_script"=true;
create user mintchoc31 identified by "1234";

// 실습 4-2. 사용자 조회
select * from all_users;
select * from all_users where username='mintchoc31';


// 실습 4-3. 사용자 변경
alert user mintchoc identified by '1q2w3e';
drop user mintchoc31;
drop user mintchoc31 cascade;

// 실습 4-4. role 부여
grant connect, resource to mintchoc31;
grant unlimited tablespace to mintchoc31;