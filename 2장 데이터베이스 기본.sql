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
