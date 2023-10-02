/*
    ��¥: 2023/10/02
    �̸�: ������
    ����: 2�� �����ͺ��̽� �⺻
*/

//�ǽ�1-1
create table User1 (
    ID      VARCHAR2(20),
    NAME    VARCHAR2(20),
    HP      CHAR(13),
    AGE     NUMBER
);
drop table User1;

//�ǽ�1-2
insert into User1 values ('A101', '������', '010-1234-1111', 25);
insert into User1 values ('A102', '������', '010-1234-2222', 23);
insert into User1 values ('A103', '�庸��', '010-1234-3333', 32);
insert into User1 (id, name, age) values ('A104', '������', 45);
insert into User1 (id, name, hp) values ('A105', '�̼���', '010-1234-5555');

//�ǽ�1-3
select * from User1;
select * from User1 where id='A101';
select * from User1 where name='������';
select * from User1 where age > 30;
select id, name, age from User1;

//�ǽ�1-4
update User1 set hp='010-1234-4444' where id='A104';
update User1 set age=51 where id='A105';
update User1 set hp='010-1234-1001', age=27 where id='A101';

//�ǽ�1-5
delete from User1 where id='A101';
delete from User1 where id='A102' and age=25;
delete from User1 where age >= 30;
