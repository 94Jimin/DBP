-- 테이블 리스트 
select * from information_schema.tables;

-- 컬럼 상세 정보 
select * from information_schema.columns
where table_name = 'SUB_CATEGORY'
order by 5;

--기본키 확인
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE OBJECTPROPERTY(OBJECT_ID(CONSTRAINT_NAME), 'ISPRIMARYKEY') = 1 AND TABLE_NAME = 'SUB_CATEGORY';

-------------------------------------

create table MEMBER(
id varchar(50) PRIMARY KEY NOT NULL,
passwd varchar(60) NOT NULL,
name varchar(20) NOT NULL,
reg_date datetime NOT NULL,
gender char(2) NOT NULL,
favorite varchar(50)
);
select * from MEMBER;
--drop table MEMBER;

insert into MEMBER values('admin','$2a$10$QxYtHTU2SRnLC.g1g8.E6ucImfLpigsmCxNF3BiSyUU7gDnrkpf52','관리자',getdate(),'M','');

------------------------------------------------------------------------------------
--book 테이블 관련 만들기
create table MAIN_CATEGORY(
code int primary key not null,
name varchar(20) not null
);
select * from MAIN_CATEGORY;
--alter table MAIN_CATEGORY alter column code int not null;
--DROP TABLE MAIN_CATEGORY;

create table SUB_CATEGORY(
code int primary key not null,
name varchar(20) not null,
main_code int foreign key references MAIN_CATEGORY (code) 
);
select * from SUB_CATEGORY;
--alter table SUB_CATEGORY alter column code int not null;
--drop table SUB_CATEGORY;

create table BOOK(
code int identity(1, 1) primary key not null,
subject varchar(40) not null,
writer varchar(40) not null,
publisher varchar(20) not null,
main_code int foreign key references MAIN_CATEGORY (code),
sub_code int foreign key references SUB_CATEGORY (code)
);
select * from BOOK;
--drop table BOOK;
select top(3) * from BOOK where main_code=2;
select * from Book where code=2;


---------------------------------------------------------------------------------
-- list 관련 테이블 

--create table LIST_BOOK (
--list_num int identity(1,1) primary key not null,
--list_code varchar(30) not null,
--book_code int foreign key references BOOK (code)
--);
--select * from LIST_BOOK;
----drop table LIST_BOOK;
--select * from LIST_BOOK where book_code=?;
--select list_code from LIST_BOOK where book_code=1;
--insert into LIST_BOOK(list_code,book_code) values ('admin_1',1);
--insert into LIST_BOOK(list_code,book_code) values ('admin_2',1);
--insert into LIST_BOOK(list_code,book_code) values ('admin_2',2);
--insert into LIST_BOOK(list_code,book_code) values ('admin_1',3);

--create table LIST (
--id varchar(50) foreign key references MEMBER (id),
--list_num int foreign key references LIST_BOOK (list_num)
--);
----인덱스 생성
--create clustered index LIST_TABLE on LIST (id,list_num);
--select * from LIST;
----drop table LIST;
--select * from LIST where id='admin' order by list_num;
--insert into LIST values('admin',1);
--insert into LIST values('admin',2);
--insert into LIST values('admin',3);
--insert into LIST values('admin',4);

create table LIST (
id varchar(50) foreign key references MEMBER (id),
list_code varchar(30) not null,
book_code int foreign key references BOOK (code)
);
--인덱스 생성
create clustered index LIST_TABLE on LIST (id,list_code,book_code);
select * from LIST;
--drop table LIST;
select list_code from LIST where id='admin' order by list_code;
select distinct list_code from LIST where id='admin' order by list_code;
select book_code from LIST where list_code='admin_1';
insert into LIST values('admin','admin_1',1);
insert into LIST values('admin','admin_2',1);
insert into LIST values('admin','admin_2',2);
insert into LIST values('admin','admin_1',3);

---------------------------------------------------------------------------------
-- 카테고리 만들기

insert into MAIN_CATEGORY(code,name) values(100,'소설');
insert into MAIN_CATEGORY(code,name) values(200,'경영/경제');
insert into MAIN_CATEGORY(code,name) values(300,'자기계발');
insert into MAIN_CATEGORY(code,name) values(400,'여행');
insert into MAIN_CATEGORY(code,name) values(500,'컴퓨터/IT');


insert into SUB_CATEGORY(code,name,main_code) values(110,'한국소설',100);
insert into SUB_CATEGORY(code,name,main_code) values(120,'영미소설',100);
insert into SUB_CATEGORY(code,name,main_code) values(130,'판타지소설',100);

insert into SUB_CATEGORY(code,name,main_code) values(210,'경영일반',200);
insert into SUB_CATEGORY(code,name,main_code) values(220,'경제일반',200);
insert into SUB_CATEGORY(code,name,main_code) values(230,'CEO/리더십',200);

insert into SUB_CATEGORY(code,name,main_code) values(310,'성공/삶의자세',300);
insert into SUB_CATEGORY(code,name,main_code) values(320,'설득/화술/협상',300);
insert into SUB_CATEGORY(code,name,main_code) values(330,'인간간관계',300);

insert into SUB_CATEGORY(code,name,main_code) values(410,'국내여행',400);
insert into SUB_CATEGORY(code,name,main_code) values(420,'해외여행',400);

insert into SUB_CATEGORY(code,name,main_code) values(510,'IT비즈니스',500);
insert into SUB_CATEGORY(code,name,main_code) values(520,'개발/프로그래밍',500);
insert into SUB_CATEGORY(code,name,main_code) values(530,'컴퓨터/앱활용',500);

---------------------------------------------------------------------------------------
--book 만들기

insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('넛지','리처드 탈러, 캐스선스타인','리더북스',200,220);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('화폐전쟁','쑹훙빈','랜덤하우스코리아',200,220);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('그들이 말하지 않는 23가지','장하준','부키',200,220);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('경제학 콘서트','팀 하포드','웅진지식하우스',200,220);

insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('경영학 콘서트','장영재','비즈니스북스',200,210);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('카르마 경영','이나모리가즈오','서돌',200,210);

insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('진짜 서울은 골목 안에 있다','이주화','이른 아침',400,410);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('지하철로 떠나는 서울&근교 여행','최미선, 신석교','넥서스BOOKS',400,410);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('주말엔 서울여행','유철상','상상출판',400,410);