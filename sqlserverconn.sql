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
code int identity(1, 1) primary key not null,
name varchar(20) not null
);
select * from MAIN_CATEGORY;

--DROP TABLE MAIN_CATEGORY;

create table SUB_CATEGORY(
code int identity(1, 1) primary key not null,
name varchar(20) not null,
main_code int foreign key references MAIN_CATEGORY (code) 
);
select * from SUB_CATEGORY;

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


---------------------------------------------------------------------------------
-- list 관련 테이블 

create table LIST_BOOK (
list_code int identity(1, 1) primary key not null,
book int foreign key references BOOK (code)
);
select * from LIST_BOOK;
--drop table LIST_BOOK;

create table LIST_TABLE (
id varchar(50) foreign key references MEMBER (id),
list_code int foreign key references LIST_BOOK (list_code)
);

--인덱스 생성
create clustered index LIST on LIST_TABLE (id,list_code);
---------------------------------------------------------------------------------
-- 카테고리 만들기

insert into MAIN_CATEGORY(name) values('소설');
insert into MAIN_CATEGORY(name) values('경영/경제');
insert into MAIN_CATEGORY(name) values('자기계발');
insert into MAIN_CATEGORY(name) values('여행');
insert into MAIN_CATEGORY(name) values('컴퓨터/IT');


insert into SUB_CATEGORY(name,main_code) values('한국소설',1);
insert into SUB_CATEGORY(name,main_code) values('영미소설',1);
insert into SUB_CATEGORY(name,main_code) values('판타지소설',1);

insert into SUB_CATEGORY(name,main_code) values('경영일반',2);
insert into SUB_CATEGORY(name,main_code) values('경제일반',2);
insert into SUB_CATEGORY(name,main_code) values('CEO/리더십',2);

insert into SUB_CATEGORY(name,main_code) values('성공/삶의자세',3);
insert into SUB_CATEGORY(name,main_code) values('설득/화술/협상',3);
insert into SUB_CATEGORY(name,main_code) values('인간간관계',3);

insert into SUB_CATEGORY(name,main_code) values('국내여행',4);
insert into SUB_CATEGORY(name,main_code) values('해외여행',4);

insert into SUB_CATEGORY(name,main_code) values('IT비즈니스',5);
insert into SUB_CATEGORY(name,main_code) values('개발/프로그래밍',5);
insert into SUB_CATEGORY(name,main_code) values('컴퓨터/앱활용',5);

---------------------------------------------------------------------------------------
--book 만들기

insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('넛지','리처드 탈러, 캐스선스타인','리더북스',2,5);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('화폐전쟁','쑹훙빈','랜덤하우스코리아',2,5);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('그들이 말하지 않는 23가지','장하준','부키',2,5);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('경제학 콘서트','팀 하포드','웅진지식하우스',2,5);

insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('경영학 콘서트','장영재','비즈니스북스',2,4);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('카르마 경영','이나모리가즈오','서돌',2,4);

insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('진짜 서울은 골목 안에 있다','이주화','이른 아침',4,10);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('지하철로 떠나는 서울&근교 여행','최미선, 신석교','넥서스BOOKS',4,10);
insert into BOOK(subject,writer,publisher,main_code,sub_code) 
values('주말엔 서울여행','유철상','상상출판',4,10);