create table MEMBER(		  
member_id varchar(50) PRIMARY KEY NOT NULL,
member_passwd varchar(50) NOT NULL,
member_name varchar(10) NOT NULL,
member_reg_date datetime NOT NULL,
member_gender char(2) NOT NULL,
member_favorite varchar(50)
);
  		  
select * from MEMBER;
  		  
drop table MEMBER;
  		  
insert into MEMBER(member_id,member_passwd,member_name,member_reg_date,member_gender)
values('admin','1234','관리자',getdate(),'F'); 
