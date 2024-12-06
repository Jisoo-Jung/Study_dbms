CREATE SEQUENCE SEQ_MEMBER;

CREATE TABLE TBL_MEMBER(
	ID NUMBER CONSTRAINT PK_MEMBER PRIMARY KEY,
	MEMBER_EMAIL VARCHAR2(255) NOT NULL,
	MEMBER_PASSWORD VARCHAR2(255) NOT NULL,
	MEMBER_NAME VARCHAR2(255) NOT NULL,
	MEMBER_AGE NUMBER DEFAULT 0,
	MEMBER_GENDER NUMBER DEFAULT 3,
	CREATED_DATE DATE DEFAULT SYSDATE,
	UPDATED_DATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_POST;

CREATE TABLE TBL_POST(
	ID NUMBER CONSTRAINT PK_POST PRIMARY KEY,
	POST_TITLE VARCHAR2(255) NOT NULL,
	POST_CONTENT VARCHAR2(255) NOT NULL,
	MEMBER_ID NUMBER,
   	CONSTRAINT FK_POST_MEMBER FOREIGN KEY(MEMBER_ID)
   	REFERENCES TBL_MEMBER(ID),
   	CREATED_DATE DATE DEFAULT SYSDATE,
	UPDATED_DATE DATE DEFAULT SYSDATE
);

CREATE SEQUENCE SEQ_REPLY;

CREATE TABLE TBL_REPLY(
   	ID NUMBER CONSTRAINT PK_REPLY PRIMARY KEY,
   	REPLY_CONTENT VARCHAR2(255) NOT NULL,
   	POST_ID NUMBER NOT NULL,
   	MEMBER_ID NUMBER NOT NULL,
   	CONSTRAINTS FK_REPLY_POST FOREIGN KEY(POST_ID)
   	REFERENCES TBL_POST(ID),
   	CONSTRAINTS FK_REPLY_MEMBER FOREIGN KEY(MEMBER_ID)
   	REFERENCES TBL_MEMBER(ID),
   	CREATED_DATE DATE DEFAULT SYSDATE,
	UPDATED_DATE DATE DEFAULT SYSDATE
);

SELECT ID, MEMBER_EMAIL, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_AGE, MEMBER_GENDER, CREATED_DATE, UPDATED_DATE
FROM TBL_MEMBER;

SELECT ID, POST_TITLE, POST_CONTENT, MEMBER_ID, CREATED_DATE, UPDATED_DATE
FROM TBL_POST;

SELECT ID, REPLY_CONTENT, POST_ID, MEMBER_ID, CREATED_DATE, UPDATED_DATE
FROM TBL_REPLY;

CREATE TABLE TBL_CAR_OWNER(
    ID NUMBER CONSTRAINT PK_CAR_OWNER PRIMARY KEY,	
    CAR_OWNER_NAME VARCHAR2(1000) NOT NULL,
    CAR_OWNER_PHONE VARCHAR2(1000) NOT NULL,
    CAR_OWNER_ADRESS VARCHAR2(1000) NOT NULL,
    CREATED_DATE DATE DEFAULT SYSDATE,
	UPDATED_DATE DATE DEFAULT SYSDATE
);


CREATE TABLE TBL_CAR(
    ID NUMBER CONSTRAINT PK_CAR PRIMARY KEY,
    CAR_BRAND VARCHAR2(1000) CONSTRAINT UK_CAR UNIQUE NOT NULL,
    CAR_MODEL VARCHAR2(1000) NOT NULL,
    CAR_PRICE NUMBER DEFAULT 0,
    CAR_RELEASE_DATE DATE,
    CAR_OWNER_ID NUMBER NOT NULL,
    CONSTRAINT FK_CAR_CAR_OWNER FOREIGN KEY(CAR_OWNER_ID)
	REFERENCES TBL_CAR_OWNER(ID),
	CREATED_DATE DATE DEFAULT SYSDATE,
	UPDATED_DATE DATE DEFAULT SYSDATE
);


