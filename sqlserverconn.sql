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
values('admin','1234','������',getdate(),'F');

------------------------------------------------------------------------------------
--book ���̺� ���� �����
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
-- ī�װ� �����

insert into MAIN_CATEGORY(code,name) values('100','�Ҽ�');
insert into MAIN_CATEGORY(code,name) values('200','�濵/����');
insert into MAIN_CATEGORY(code,name) values('300','�ڱ���');
insert into MAIN_CATEGORY(code,name) values('400','����');
insert into MAIN_CATEGORY(code,name) values('500','��ǻ��/IT');


insert into SUB_CATEGORY(code,name,main_category_code) values('100-A','�ѱ��Ҽ�','100');
insert into SUB_CATEGORY(code,name,main_category_code) values('100-B','���̼Ҽ�','100');
insert into SUB_CATEGORY(code,name,main_category_code) values('100-C','��Ÿ���Ҽ�','100');

insert into SUB_CATEGORY(code,name,main_category_code) values('200-A','�濵�Ϲ�','200');
insert into SUB_CATEGORY(code,name,main_category_code) values('200-B','�����Ϲ�','200');
insert into SUB_CATEGORY(code,name,main_category_code) values('200-C','CEO/������','200');

insert into SUB_CATEGORY(code,name,main_category_code) values('300-A','����/�����ڼ�','300');
insert into SUB_CATEGORY(code,name,main_category_code) values('300-B','����/ȭ��/����','300');
insert into SUB_CATEGORY(code,name,main_category_code) values('300-C','�ΰ�������','300');

insert into SUB_CATEGORY(code,name,main_category_code) values('400-A','��������','400');
insert into SUB_CATEGORY(code,name,main_category_code) values('400-B','�ؿܿ���','400');

insert into SUB_CATEGORY(code,name,main_category_code) values('500-A','IT����Ͻ�','500');
insert into SUB_CATEGORY(code,name,main_category_code) values('500-B','����/���α׷���','500');
insert into SUB_CATEGORY(code,name,main_category_code) values('500-C','��ǻ��/��Ȱ��','500');

---------------------------------------------------------------------------------------
--book �����

insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-B-1','����','��ó�� Ż��, ĳ������Ÿ��','�����Ͻ�','200','200-B');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-B-2','ȭ������','���˺�','�����Ͽ콺�ڸ���','200','200-B');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-B-3','�׵��� ������ �ʴ� 23����','������','��Ű','200','200-B');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-B-4','������ �ܼ�Ʈ','�� ������','���������Ͽ콺','200','200-B');

insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-A-1','�濵�� �ܼ�Ʈ','�念��','����Ͻ��Ͻ�','200','200-A');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('200-A-2','ī���� �濵','�̳��𸮰����','����','200','200-A');

insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('400-A-1','��¥ ������ ��� �ȿ� �ִ�','����ȭ','�̸� ��ħ','400','400-A');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('400-A-2','����ö�� ������ ����&�ٱ� ����','�ֹ̼�, �ż���','�ؼ���BOOKS','400','400-A');
insert into BOOK(code,subject,writer,publisher,main_category_code,sub_category_code) 
values('400-A-3','�ָ��� ���￩��','��ö��','�������','400','400-A');