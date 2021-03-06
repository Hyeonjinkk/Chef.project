

--공지사항(border) table

CREATE TABLE BORDER (
BORDER_ID NUMBER PRIMARY KEY,
BORDER_WRITER VARCHAR2(50),
BORDER_DATE DATE,
BORDER_TITLE VARCHAR2(200),
BORDER_CONTENT VARCHAR2(4000),
BORDER_HIT NUMBER);

--질문&답변 게시판

CREATE TABLE QUESTION (
QUESTION_ID NUMBER PRIMARY KEY,
QUESTION_WRITER VARCHAR2(50),
QUESTION_DATE DATE,
QUESTION_TITLE VARCHAR2(200),
QUESTION_CONTENTS VARCHAR2(4000),
QUESTION_HIT NUMBER);

--QnA table
create table qna (
qna_No int not null,
qna_Title varchar2(200) not null,
qna_Contents varchar2(4000) not null);

--사용자(users) table
CREATE TABLE USERS (
	USER_NO        NUMBER          PRIMARY KEY,
	USER_ID        VARCHAR2(100)   NOT NULL,
	USER_PASSWORD  VARCHAR2(512)   NOT NULL,
	USER_NAME      VARCHAR2(50)    NOT NULL,
	USER_ALIAS     VARCHAR2(50),
	USER_ADDRESS   VARCHAR2(300),
	USER_TEL	   VARCHAR2(100),
	USER_SUBSCRIBE NUMBER          DEFAULT 0,
	USER_AUTHOR    VARCHAR2(50)    DEFAULT 'USER'	
);

CREATE SEQUENCE USERNO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE;


-- notice(커뮤니티)

CREATE TABLE "COMMUNITY" 
   (   "COMM_NO" NUMBER NOT NULL ENABLE, 
   "USER_ALIAS" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
   "COMM_DATE" DATE NOT NULL ENABLE, 
   "COMM_TITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
   "COMM_CONTENT" VARCHAR2(3000 BYTE) NOT NULL ENABLE, 
   "COMM_CATEGORY" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
   "COMM_IMAGE1" VARCHAR2(500 BYTE), 
   "COMM_IMAGE2" VARCHAR2(500 BYTE), 
   "COMM_IMAGE3" VARCHAR2(500 BYTE), 
   "COMM_HIT" NUMBER NOT NULL ENABLE, 
    CONSTRAINT "COMMUNITY_PK" PRIMARY KEY ("COMM_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "COMMUNITY"."COMM_NO" IS '게시물번호';
   COMMENT ON COLUMN "COMMUNITY"."USER_ALIAS" IS '닉네임';
   COMMENT ON COLUMN "COMMUNITY"."COMM_DATE" IS '등록날짜';
   COMMENT ON COLUMN "COMMUNITY"."COMM_TITLE" IS '제목';
   COMMENT ON COLUMN "COMMUNITY"."COMM_CONTENT" IS '내용';
   COMMENT ON COLUMN "COMMUNITY"."COMM_CATEGORY" IS '카테고리';
   COMMENT ON COLUMN "COMMUNITY"."COMM_IMAGE1" IS '이미지1';
   COMMENT ON COLUMN "COMMUNITY"."COMM_IMAGE2" IS '이미지2';
   COMMENT ON COLUMN "COMMUNITY"."COMM_IMAGE3" IS '이미지3';
   COMMENT ON COLUMN "COMMUNITY"."COMM_HIT" IS '조회수';

--   공지사항......

   
   
  CREATE TABLE "BORDER" 
   (	"BORDER_ID" NUMBER NOT NULL ENABLE, 
	"BORDER_WRITER" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"BORDER_DATE" DATE NOT NULL ENABLE, 
	"BORDER_TITLE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"BORDER_CONTENTS" VARCHAR2(2000 BYTE) NOT NULL ENABLE, 
	"BORDER_HIT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "BORDER"."BORDER_ID" IS '순번';
   COMMENT ON COLUMN "BORDER"."BORDER_WRITER" IS '작성자';
   COMMENT ON COLUMN "BORDER"."BORDER_DATE" IS '날짜';
   COMMENT ON COLUMN "BORDER"."BORDER_TITLE" IS '제목';
   COMMENT ON COLUMN "BORDER"."BORDER_CONTENTS" IS '내용';
   COMMENT ON COLUMN "BORDER"."BORDER_HIT" IS '조회수';

   
-- 구독하기
CREATE TABLE SUBSCRIBE (
	USER_ID        VARCHAR2(100)   NOT NULL,
	FOLLOWING	   VARCHAR2(100)   DEFAULT 0
);

-- 나의 냉장고
CREATE TABLE BASKET (
	USER_ID        VARCHAR2(100)   NOT NULL,
	INGREDIENT	   VARCHAR2(300)	
);

   
   
   
