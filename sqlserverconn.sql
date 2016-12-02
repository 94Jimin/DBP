create table MEMBER(
id varchar(50) PRIMARY KEY NOT NULL,
passwd varchar(60) NOT NULL,
name varchar(20) NOT NULL,
reg_date datetime NOT NULL,
gender char(2) NOT NULL,
favorite varchar(50)
);

select * from MEMBER;

drop table MEMBER;

insert into MEMBER values('admin','$2a$10$QxYtHTU2SRnLC.g1g8.E6ucImfLpigsmCxNF3BiSyUU7gDnrkpf52','°ü¸®ÀÚ',getdate(),'M','');
