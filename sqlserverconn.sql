create table MEMBER(
id varchar(50) PRIMARY KEY NOT NULL,
passwd varchar(50) NOT NULL,
name varchar(10) NOT NULL,
reg_date datetime NOT NULL,
gender char(2) NOT NULL,
favorite varchar(50)
);

select * from MEMBER;

--drop table MEMBER;

insert into MEMBER(id,passwd,name,reg_date,gender) 
values('admin','1234','관리자',getdate(),'F');

------------------------------------------------------------------------------------
--book 테이블 관련 만들기
create table MAIN_CATEGORY(
code varchar(20) primary key not null,
name varchar(20) not null
);
select * from MAIN_CATEGORY;

--DROP TABLE MAIN_CATEGORY;

create table SUB_CATEGORY(
code varchar(20) primary key not null,
name varchar(20) not null,
main_category_code varchar(20) foreign key references MAIN_CATEGORY (code) 
);
select * from SUB_CATEGORY;

--drop table SUB_CATEGORY;

create table BOOK(
code varchar(20) primary key not null,
subject varchar(40) not null,
writer varchar(40) not null,
publisher varchar(20) not null,
main_category_code varchar(20) foreign key references MAIN_CATEGORY (code),
sub_category_code varchar(20) foreign key references SUB_CATEGORY (code)
);
select * from BOOK;

--drop table BOOK;

---------------------------------------------------------------------------------
-- 카테고리 만들기

insert into MAIN_CATEGORY(code,name) values('100','소설');
insert into MAIN_CATEGORY(code,name) values('200','경영/경제');
insert into MAIN_CATEGORY(code,name) values('300','자기계발');
insert into MAIN_CATEGORY(code,name) values('400','여행');
insert into MAIN_CATEGORY(code,name) values('500','컴퓨터/IT');


insert into SUB_CATEGORY(code,name,main_category_code) values('100-A','한국소설','100');
insert into SUB_CATEGORY(code,name,main_category_code) values('100-B','영미소설','100');
insert into SUB_CATEGORY(code,name,main_category_code) values('100-C','판타지소설','100');

insert into SUB_CATEGORY(code,name,main_category_code) values('200-A','경영일반','200');
insert into SUB_CATEGORY(code,name,main_category_code) values('200-B','경제일반','200');
insert into SUB_CATEGORY(code,name,main_category_code) values('200-C','CEO/리더십','200');

insert into SUB_CATEGORY(code,name,main_category_code) values('300-A','성공/삶의자세','300');
insert into SUB_CATEGORY(code,name,main_category_code) values('300-B','설득/화술/협상','300');
insert into SUB_CATEGORY(code,name,main_category_code) values('300-C','인간간관계','300');

insert into SUB_CATEGORY(code,name,main_category_code) values('400-A','국내여행','400');
insert into SUB_CATEGORY(code,name,main_category_code) values('400-B','해외여행','400');

insert into SUB_CATEGORY(code,name,main_category_code) values('500-A','IT비즈니스','500');
insert into SUB_CATEGORY(code,name,main_category_code) values('500-B','개발/프로그래밍','500');
insert into SUB_CATEGORY(code,name,main_category_code) values('500-C','컴퓨터/앱활용','500');

---------------------------------------------------------------------------------------
--book 만들기

insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-B-1','넛지','리처드 탈러, 캐스선스타인','리더북스','200','200-B');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-B-2','화폐전쟁','쑹훙빈','랜덤하우스코리아','200','200-B');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-B-3','그들이 말하지 않는 23가지','장하준','부키','200','200-B');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-B-4','경제학 콘서트','팀 하포드','웅진지식하우스','200','200-B');

insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-A-1','경영학 콘서트','장영재','비즈니스북스','200','200-A');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-A-2','카르마 경영','이나모리가즈오','서돌','200','200-A');

insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('400-A-1','진짜 서울은 골목 안에 있다','이주화','이른 아침','400','400-A');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('400-A-2','지하철로 떠나는 서울&근교 여행','최미선, 신석교','넥서스BOOKS','400','400-A');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('400-A-3','주말엔 서울여행','유철상','상상출판','400','400-A');