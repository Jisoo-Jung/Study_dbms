# 코리아 IT 아카데미 국비과정

## DBMS ⭐

**DB(Database)**
```
데이터가 모여있는 기지
추상적인 용어
```
**DBMS(Database Management System)**
```
DB를 관리할 수 있는 구체적인 시스템
오라클, 마리아DB, MySQL, MS-SQL, NO-SQL 등
```
**DBMS의 소통방식**
```
-------------------------------------------------------
			사용자
-------------------------------------------------------
	     ↕		   ↕		 ↕
   고객 관리 응용프로그램   ↕   주문 관리 응용프로그램
	     ↕		   ↕		 ↕
-------------------------------------------------------
			DBMS
-------------------------------------------------------
```

-----------------------------------------------------------
**RDBMS(관계형 데이터베이스 시스템)**
```
테이블끼리 서로 관계를 맺는다.
```
```
회원 테이블(TBL_USER)			주문 테이블(TBL_ORDER)
번호	이름	나이	아이디		주문번호	번호	날짜		상품수량
1	한동석	20	hds1234		1	1	2024-07-27	5
2	하민지	17	hmj9999		2	1	2024-07-28	10
3	용호중	15	yhj7777		3	4	2024-07-28	1
4	안수진	45	asj7878		4	3	2024-07-29	520

이러한 구조를 가지는 것을 Table, Relation(오라클), Class라고 부른다.
```
------------------------------------------------------------
### - ORACLE

**오라클 DBMS 버전**
```
i: internet
g: grid
c: cloud
```
**scott 계정 활성화**
```
> sqlplus system/1234

SQL > @[scott.sql 파일의 전체 경로]	: 직접 작성하거나 파일을 드래그 앤 드랍하기
SQL > show user
    USER is "SCOTT"
SQL > conn system/1234;
SQL > alter user scott identified by 1234;
SQL > conn scott/1234;
SQL > show user
    USER is "SCOTT"
```
**COLUMN(열, 속성, 필드)**
```
공통된 값들의 주제, 하나의 집합을 의미한다.
```
**ROW(행, 레코드, 튜플)**
```
하나의 정보를 의미한다.
```
**PRIMARY KEY(PK)**
```
고유한 값.
각 행의 구분점으로 사용된다.
중복이 없고 NULL값을 허용하지 않는다.
*NULL: 아직 어떤 값을 넣을 지 모르겠다는 의미로 넣는 값.
```
**FORIEGN KEY(FK)**
```
다른 테이블의 PK를 의미한다.
보통 테이블끼리 관계를 맺을 때 사용한다.
중복이 가능하고 NULL도 허용한다.
```
**UNIQUE KEY(UK)**
```
NULL을 허용하지만 중복은 허용하지 않는다.
```
-------------------------------------------------------------
**컴파일 언어와 인터프리터(스크립트) 언어**
```
- 컴파일러
	파일 단위로 해석한다.
	처음부터 끝까지 다시 읽어와야 하는 작업에 적합하다.
	
- 인터프리터
	한 줄 단위로 해석한다.
	빈번한 수정 또는 부분 실행 작업에 적합하다.
```
**SQL문(쿼리문) - DDL, DML, DCL, TCL**
```
스크립트 언어(인터프리트 언어)이다.
DBMS와 소통하는 언어이다.
```
**DDL(Data Definition Language): 데이터 정의어**
```
테이블 조작 및 제어 관련 쿼리문

1. CREATE: 테이블 생성
    CREATE TABLE [테이블명] (
        [컬럼명] [자료형(용량)] [제약조건],
        [컬럼명] [자료형(용량)] [제약조건],
        ...,
        추가 제약 조건
    );

2. DROP: 테이블 삭제
    DROP TABLE [테이블명]

3. ALTER: 테이블 수정
    ALTER TABLE [테이블명] 
    - 테이블명 수정 : RENAME TO [새로운 테이블명]
    - 컬럼 추가 : ADD([새로운 컬럼명] [자료형(용량)])
    - 컬럼명 변경 : RENAME COLUMN [기존 컬럼명] TO [새로운 컬럼명]
    - 컬럼 삭제 : DROP COLUMN [기존 컬럼명]
    - 컬럼 수정 : MODIFY([기존 컬럼명] [자료형(용량)])

4. TRUNCATE: 테이블 내용 전체 삭제
    TRUNCATE TABLE [테이블명]
```
**자료형(TYPE): 용량은 항상 넉넉하게 주도록 한다.**
```
숫자
    354564.546157
    ------ ------
    진수     가수

    NUMBER(지수): 정수
    NUMBER(지수, 가수): 실수

문자열
    CHAR(용량): 고정형
        CHAR(4)에 'A'를 넣으면 A^^^ 빈 자리가 공백으로 채워진다.
        형식을 정한 날짜, 주민등록번호처럼 글자 수가 절대 변하지 않는 값을 넣는다.


    VARCHAR(용량), VARCHAR2(용량): 가변형
        값의 길이 만큼 공간이 배정된다. 글자 수가 변할 수 있는 값을 넣는다.
        VARCHAR2를 사용하는 것을 권장한다.

날짜
    DATE: FORMAT에 맞춰서 날짜를 저장하는 타입
```
-------------------------------------------------------------
**무결성**
```
데이터의 정확성, 일관성, 유효성이 유지되는 것.

정확성: 데이터는 애매하지 않아야 한다.
일관성: 각 사용자가 일관된 데이터를 볼 수 있도록 해야 한다.
유효성: 데이터가 실제 존재하는 데이터여야 한다.

1. 개체 무결성
    모든 테이블이 반드시 PK로 설정된 컬럼을 가져야 한다.

2. 참조 무결성
    두 테이블의 데이터가 항상 일관된 값을 가지도록 유지하는 것.

3. 도메인 무결성
    컬럼의 타입, NULL 값의 허용 등에 대한 사항을 정의하고
    올바른 데이터가 입력되었는지를 확인하는 것.
```
-------------------------------------------------------------
**모델링(기획)**
```
추상적인 주제를 RDB에 맞게 설계하는 것
```
```
1. 요구사항 분석
    회원, 주문, 상품: 3가지를 관리하고 한다.

2. 개념적 설계(개념 모델링)
    회원	주문		상품

    아이디	주문번호		상품번호

    비밀번호	주문날짜		상품명
    이름	아이디		가격
    주소	상품번호		재고량
    이메일
    생일
	

3. 논리적 설계
    회원	주문		상품
    -----------------------------------------------
    아이디P   	주문번호P   	상품번호P
    -----------------------------------------------
    비밀번호   	주문 날짜      	상품명
    이름   	아이디F      	가격 D0
    주소   	상품번호F      	재고량 D0
    이메일U
    생일

4. 물리적 설계
    TBL_USER
    -----------------------
    USER_ID : VARCHAR2(1000)
    -----------------------
    USER_PASSWORD : VARCHAR2(1000)
    USER_ADDRESS : VARCHAR2(2000)
    USER_EMAIL : VARCHAR2(2000) : UNIQUE
    USER_BIRTH : DATE

5. 구현
```
-------------------------------------------------------------
**정규화**
```
삽입/수정/삭제 이상현상을 제거하기 위한 작업.
데이터 중복을 최소화하는 데에 목적이 있다.
5차 정규화까지 있으나 3차 정규화까지만 진행한다.
```
**1차 정규화**
```
같은 내용의 컬럼이 연속적으로 나타날 경우.

상품 테이블
상품명1		상품명2		상품명3
와이셔츠1	와이셔츠2	와이셔츠3

회원 테이블
취미
축구, 럭비, 골프

* 위 테이블은 조회 및 추가가 힘들다.

1차 정규화 진행

상품명
와이셔츠1
와이셔츠2
와이셔츠3

상품명 테이블
번호	상품명		상품번호(FK)
1	와이셔츠1	1
2	와이셔츠2	1
3	와이셔츠3	1
```
**2차 정규화**
```
조합키(복합키)로 구성되었을 경우 조합키의 일부분에만 종속되는 속성이 있을 경우(부분 종속).

꽃
이름	색상	꽃말	과
해바라기	노란색	행운	국화
장미	빨간색	사랑	장미

* 이름에 대한 부분종속이 발생한다.


2차 정규화 진행

꽃
이름	색상	꽃말
해바라기	노란색	행운
장미	빨간색	사랑

과
이름	과
해바라기	국화
장미	장미
```
**3차 정규화**	
```
PK가 아닌 컬럼이 다른 컬럼을 결정하는 경우
이행 함수 종속 제거

회원번호		이름	시	구	동	우편번호
1		한동석	경기도	남양주	화도	12345
2		홍길동	서울시	관악구	봉천	78945

* 우편번호로 시, 구, 동을 알 수 있다.
* 중복된 데이터가 생길 가능성이 있다.

3차 정규화 진행

회원 테이블
회원번호		이름	우편번호
1		한동석	12345
2		홍길동	78945

우편번호 테이블
우편변호		시	구	동
12345		경기도	남양주	화도
78945		서울시	관악구	봉천	
```
**데이터베이스에서 정규화가 필요한 이유**
```
데이터베이스를 잘못 설계하면 불필요한 데이터 중복으로 인해 공간이 낭비된다.
이런 현상을 이상(Anomaly)현상이라고 한다.


회원번호와 프로젝트코드 두 컬럼의 조합키로 설정되어 있는 테이블이고
한 사람은 하나의 부서만 가질 수 있다.

회원번호		이름	부서	프로젝트코드	급여	부서별 명수
22080101	한동석	개발팀	ABC0001		3000	4
22080101	한동석	개발팀	DEF1112		2000	4
22080101	한동석	개발팀	CBA9474		4000	4
22080104	홍길동	기획팀	EFG0881		5000	2
22081106	이순신	디자인팀	GHI9991		6000	3
```
**이상현상의 종류**
```
1. 삽입 이상
    새 데이터를 삽입하기 위해 불필요한 데이터도 삽입해야하는 문제

    담당 프로젝트가 정해지지 않은 사원이 있다면,
    프로젝트 코드에 NULL을 작성할 수 없으므로 이 사원은 테이블에 추가될 수 없다.
    따라서 '미정'이라는 프로젝트 코드를 따로 만들어서 삽입해야 한다.

2. 갱신 이상
    중복 행 중에서 일부만 변경하여 데이터가 불일치하게 되는 모순의 문제

    한 명의 사원은 반드시 하나의 부서에만 속할 수 있다.
    만약 "한동석"이 보안팀으로 부서를 옮길 시 3개 모두 갱신해주지 않는다면
    개발팀인지 보안팀인지 알 수 없다.

3. 삭제 이상
    행을 삭제하면 꼭 필요한 데이터까지 함께 삭제되는 문제

    "이순신"이 담당한 프로젝트를 박살내서 드랍된다면 "이순신" 행을 모두 삭제하게 된다.
    따라서 프로젝트에서 드랍되면 정보를 모두 드랍하게 된다.
```
**정규화 진행**
```
회원번호		프로젝트코드	급여
22080101	ABC0001		3000
22080101	DEF1112		2000
22080101	CBA9474		4000
22080104	EFG0881		5000
22081106	GHI9991		6000

회원번호		이름		부서
22080101	한동석		개발팀
22080104	홍길동		기획팀
22081106	이순신		디자인팀

부서		부서별 명수
개발팀		4
기획팀		2
디자인팀		3
```
-------------------------------------------------------------
**DML(Data Manipulation Language): 데이터 조작어**
```
1. SELECT: 조회(검색)
    SELECT [컬럼명1, 컬럼명2, ...]
    FROM [테이블명]
    WHERE [조건식]

2. INSERT: 추가
    1) 컬럼명을 생략할 수 있으며, 이 경우 DEFAULT 제약조건이 발생된다.
        INSERT INTO [테이블명]
        ([컬럼명1, 컬럼명2, ...])
        VALUES([값1, 값2, ...]);

    2) 모든 값을 전부 작성해야 하며, 컬럼명은 직접 작성하지 않는다.
        INSERT INTO [테이블명]
        VALUES([값1, 값2, ...]);

3. UPDATE: 수정
    UPDATE [테이블명]
    SET [기존 컬럼명1] = [새로운 값1], [기존 컬럼명2] = [새로운 값2], ...
    WHERE [조건식]

4. DELETE: 삭제
    DELETE FROM [테이블명]
    WHERE [조건식]
```
**조건식**
```
>, <:		초과, 미만
>=, <=:		이상, 이하
=:		같다
<>, != , ^=:	같지 않다.
AND:		둘 다 참이면 참
OR:		둘 중 하나라도 참이면 참
```
-------------------------------------------------------------
**JOIN**
```
여러 테이블에 흩어져 있는 정보 중
사용자가 필요한 정보만 가져와서 가상의 테이블처럼 만들고 결과를 보여주는 것.
정규화를 통해 조회 테이블이 너무 많이 쪼개져 있으면,
작업이 불편하기 때문에 조회의 성능을 향상시키고자 JOIN을 사용한다.

1. 내부 조인(INNER JOIN)
    조건에 일치하는 값만 합쳐서 조회

    SELECT [컬럼명,...]
    FROM [테이블명] INNER JOIN [테이블명]
    ON 조건식
    INNER JOIN [테이블명]
    ON 조건식
    INNER JOIN [테이블명]
    ON 조건식
    ...

    - 등가 조인
        ON절에 등호가 있는 조인

    - 비등가 조인
        ON절에 등호가 없는 조인
    

2. 외부 조인(OUTER JOIN)
    조건에 일치하지 않아도 지정한 테이블은 전체 정보 조회
    ON절에 작성된 조건식이 false일지라도 모든 정보를 조회해야 할 때 사용한다.

    - LEFT OUTER JOIN
        선행 테이블의 모든 정보를 가져오고 싶을 때 사용한다.

    - RIGHT OUTER JOIN
        후행 테이블의 모든 정보를 가져오고 싶을 때 사용한다.
```
-------------------------------------------------------------
**VIEW**
```
기존의 테이블은 그대로 놔둔 채 필요한 컬럼들 및 새로운 컬럼을 만든 가상 테이블.
실제 데이터가 저장되는 것은 아니지만 VIEW를 통해서 충분히 데이터를 관리할 수 있다.

- 독립성: 다른 곳에서 접근하지 못하도록 하는 성질
- 편리성: 긴 쿼리문을 짧게 만드는 성질
- 보안성: 기존의 쿼리문이 보이지 않는다.
```
**VIEW 문법**
```
※ CREATE VIEW 권한이 불충분하다면,
    system 계정에서 아래의 명령어를 작성하여 권한을 부여한다.
    grant [권한을 부여할 명령어] to [계정명]
    revoke [권한을 뺏을 명령어] from [계정명]
    예)
        권한을 줄 때
        grant create view to scott;
        
        권한을 뺏을 때
        revoke create view from scott;

- 새롭게 생성
CREATE VIEW [뷰 이름] AS (SELECT 쿼리문);

- 새롭게 생성 혹은 기존 VIEW 수정
CREATE OR REPLACE VIEW [뷰 이름] AS (SELECT 쿼리문);
```
-------------------------------------------------------------
**TCL(Transaction Control Language): 트랜잭션 제어어**
```
DML만 가능한 명령어이다.

트랜잭션
    하나의 작업(서비스)에 필요한 쿼리를 묶은 단위

- COMMIT
    모든 작업을 확정하는 명령어

- ROLLBACK
    이전 커밋 시점으로 이동
```

<div style="text-align: right"> 

([back to top](#코리아-it-아카데미-국비과정))

</div>

-----------------------------------------------------------

### - MYSQL

MySQL
```
웹 사이트와 다양한 애플리케이션에서 사용되는 DBMS이다.
오라클은 관리 비용이 고가이지만 MySQL은 저가형 데이터베이스이다.
문법이 간결하고 쉬우며, 메모리 사용량이 현저히 낮아서 부담없이 사용 가능하다.
```
MySQL 기본 세팅
```
1) 로그인
    > mysql -u root -p
    > 1234

2) 기본 데이터베이스 선택
    > use mysql;

3) 로컬에서만 접속 가능한 계정 생성
    > create user 'userid'@localhost identified by '비밀번호';

4) 원격으로도 접속 가능한 계정 생성
    > create user 'userid'@'%' identified by '비밀번호';

5) 데이터베이스 생성
    > create database [데이터베이스 이름];

6) 데이터베이스 사용
    > use [데이터베이스 이름];

7) 데이터베이스 삭제
    > drop database [데이터베이스 이름];   

8) 사용자 비밀번호 변경
    > set password for 'userid'@'%' = '신규 비밀번호';

9) 사용자 삭제
    > drop user 'userid'@'%';

10) 연결 권한
    > grant all privileges on *.* to 'userid'@'%' with grant option;

11) 권한 관련 명령어 확정
    > flush privileges;
```
자료형
```
- 정수
    tinyint
    smallint
    mediumint
    int
    bigint

- 실수
    decimal(m, d) : m자리 정수, d자리 소수점으로 표현

- 날짜
    date : 1000-01-01 ~ 9999-12-31(3byte)
    time : -838:59:59 ~ 838:59:59(3byte)
    datetime : 1000-01-01 00:00:00 ~ 9999-12-31 23:59:59(8byte)

- 문자
    char(m) : 고정 길이 문자열(0~255)
    varchar(m) : 가변 길이 문자열(0~65535)
```
DDL(Data Definition Language): 데이터 정의어
```
- 테이블을 조작하거나 제어할 수 있는 쿼리문

1. CREATE: 테이블 생성
    CREATE TABLE [테이블명] ([컬럼명] [자료형(용량)] [제약조건], ...);

2. DROP: 테이블 삭제
    DROP TABLE [테이블명];

3. ALTER: 테이블 수정
    - 테이블명 수정
        ALTER TABLE [테이블명] RENAME [새로운 테이블명]
    - 컬럼 맨 뒤에 추가
        ALTER TABLE [테이블명] ADD [컬럼명] [자료형] [제약조건];
    - 컬럼 맨 앞에 추가
        ALTER TABLE [테이블명] ADD [컬럼명] [자료형] [제약조건] first;
    - 컬럼 지정 위치에 추가
        ALTER TABLE [테이블명] ADD [컬럼명] [자료형] [제약조건] after [기존 컬럼명];
    - 컬럼 삭제
        ALTER TABLE [테이블명] DROP [컬럼명];
    - 컬럼명 변경
        ALTER TABLE [테이블명] CHANGE [기존컬럼명] [변경할 컬럼명] [컬럼타입];
    - 컬럼 타입 변경
        ALTER TABLE [테이블명] MODIFY [컬럼명] [변경할 컬럼타입];
    - 제약 조건 확인
        DESC [데이터베이스명].[테이블명];
    - 제약 조건 추가
        ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건 이름];
    - 제약 조건 삭제
        ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건 이름];

4. TRUNCATE: 테이블 내용 전체 삭제
    TRUNCATE TABLE [테이블명];
```
VIEW
```
기존의 테이블은 그대로 놔둔 채 필요한 컬럼들 및 새로운 컬럼을 만든 가상 테이블.
실제 데이터가 저장되는 것은 아니지만 VIEW를 통해서 충분히 데이터를 관리할 수 있다.

- 독립성: 다른 곳에서 접근하지 못하도록 하는 성질
- 편리성: 긴 쿼리문을 짧게 만드는 성질
- 보안성: 기존의 쿼리문이 보이지 않는다.
```
VIEW 문법
```
CREATE VIEW [뷰 이름] AS (select 쿼리문);
```

([back to top](#코리아-it-아카데미-국비과정))

-----------------------------------------------------------
