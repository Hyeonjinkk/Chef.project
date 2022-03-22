create table users (
	user_no        number          primary key,
	user_id        varchar2(100)   not null,
	user_password  varchar2(512)   not null,
	user_name      varchar2(50)    not null,
	user_alias     varchar2(50),
	user_address   varchar2(300),
	user_tel	   varchar2(100),
	user_subscribe number          default 0,
	user_author    varchar2(50)    default 'user'
	
);

create sequence userno_seq
start with 1
increment by 1
nomaxvalue
nominvalue;