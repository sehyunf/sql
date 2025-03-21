-- DML
-- SELECT, INSERT, UPDATE, DELETE

SELECT CURRENT_TIMESTAMP FROM DUAL;

CREATE SEQUENCE SEQ_PARENT;
CREATE TABLE TBL_PARENT(
	ID NUMBER CONSTRAINT PK_PARENT PRIMARY KEY,
	PARENT_NAME VARCHAR2(255),
	PARENT_AGE NUMBER,
	PARENT_ADDRESS VARCHAR(255),
	PARENT_PHONE VARCHAR2(255),
	PARENT_GENDER CHAR(10)
);

INSERT INTO TBL_PARENT
VALUES(SEQ_PARENT.NEXTVAL, '홍길동', 20, '경기도 구리', '01001000100', '남');

INSERT INTO TBL_PARENT(ID, PARENT_NAME, PARENT_PHONE)
VALUES(SEQ_PARENT.NEXTVAL, '장보고', '01012341234');

DROP TABLE TBL_PARENT;

-- * (ASTERLISK) 모든 ~ , 컬럼의 자리
SELECT * FROM TBL_PARENT;

-- 연산자
-- ALIAS(별칭) : 컬럼 AS 컬럼명
-- '' : 값, "" : 문자열
SELECT 5 + 3 AS "값을 더하기" FROM DUAL;
SELECT 5 - 3 AS "값을 빼기" FROM DUAL;
SELECT 10 * 7 AS "값을 곱하기" FROM DUAL;
SELECT 20 / 3 AS "값을 나누기" FROM DUAL;
SELECT MOD(20, 7) AS "값을 나눈 나머지" FROM DUAL;
SELECT ABS(-10) AS "값의 절대값" FROM DUAL;
SELECT ABS(7) AS "값의 절대값" FROM DUAL;
SELECT SIGN(-10) AS "값의 부호" FROM DUAL;
SELECT SIGN(777) AS "값의 부호" FROM DUAL;

SELECT ID FROM TBL_PARENT;
SELECT 
	ID AS 아이디, PARENT_AGE AS 나이, PARENT_ADDRESS AS 주소,
	PARENT_PHONE AS 전화번호, PARENT_GENDER AS "부모의 성별" 
FROM 
	TBL_PARENT;

SELECT PARENT_AGE + 10 AS 나이
FROM TBL_PARENT;

-- NULL과 계산하면 모두 NULL
SELECT NULL + 10 FROM DUAL;
SELECT NULL * 10 FROM DUAL;
SELECT NULL / 10 FROM DUAL;
SELECT MOD(NULL, 10) FROM DUAL;

SELECT * FROM TBL_PARENT;

INSERT INTO TBL_PARENT
VALUES(SEQ_PARENT.NEXTVAL, '이순신',	 35, '서울시 강남구', '01001000100', '남');
INSERT INTO TBL_PARENT
VALUES(SEQ_PARENT.NEXTVAL, '김철수',	 30, '서울시 종로구', '01012341234', '남');
INSERT INTO TBL_PARENT
VALUES(SEQ_PARENT.NEXTVAL, '김영희',	 25, '경기도 분당구', '01034344343', '여');
INSERT INTO TBL_PARENT
VALUES(SEQ_PARENT.NEXTVAL, '박세현',	 25, '서울시 송파구', '01011111111', '남');
INSERT INTO TBL_PARENT
VALUES(SEQ_PARENT.NEXTVAL, '가나다',	 20, '서울시 은평구', '01011112121', '여');

SELECT * FROM TBL_PARENT;

SELECT PARENT_NAME AS 이름
FROM TBL_PARENT
WHERE ID = 21;

-- 부모의 나이가 25세보다 큰 부모의 이름을 조회

SELECT PARENT_NAME AS 이름
FROM TBL_PARENT
WHERE PARENT_AGE > 25;

-- 경기도 구리에 사는 부모의 핸드폰 번호를 조회

SELECT PARENT_PHONE AS "핸드폰 번호"
FROM TBL_PARENT
WHERE PARENT_ADDRESS = '경기도 구리';

-- 서울에 살고있는 부모의 이름을 조회

SELECT PARENT_NAME AS "부모의 이름"
FROM TBL_PARENT
WHERE PARENT_ADDRESS LIKE '서울시%';

SELECT PARENT_NAME AS "부모의 이름"
FROM TBL_PARENT
WHERE PARENT_ADDRESS LIKE '%서울%';

-- 구로 끝나는 사람들

SELECT PARENT_NAME AS "부모의 이름"
FROM TBL_PARENT
WHERE PARENT_ADDRESS LIKE '%구';

-- 서울애 살지 않는 부모의 이름을 조회

SELECT PARENT_NAME AS "부모의 이름"
FROM TBL_PARENT
WHERE PARENT_ADDRESS NOT LIKE '서울%';

SELECT PARENT_NAME AS "부모의 이름"
FROM TBL_PARENT
WHERE PARENT_ADDRESS LIKE '서울%' AND PARENT_GENDER = '남';

-- 함수
-- 집계 함수
CREATE SEQUENCE SEQ_FIELD_TRIP;
CREATE TABLE TBL_FIELD_TRIP(
	ID NUMBER CONSTRAINT PK_FIELD_TRIP PRIMARY KEY,
	FIELD_TITLE VARCHAR2(255) NOT NULL,
	FIELD_CONTENT VARCHAR2(255),
	FIELD_NUMBER NUMBER
);

INSERT INTO TBL_FIELD_TRIP
VALUES(SEQ_FIELD_TRIP.NEXTVAL, '어서와 매미농장', '매미잡자 맴맴!', 30);

INSERT INTO TBL_FIELD_TRIP
VALUES(SEQ_FIELD_TRIP.NEXTVAL, '아이스크림 빨리먹기 대회', '아이스크림 머리 아파', 100);

INSERT INTO TBL_FIELD_TRIP
VALUES(SEQ_FIELD_TRIP.NEXTVAL, '고구마 심기', '고구마가 왕커요 왕왕', 10);

INSERT INTO TBL_FIELD_TRIP
VALUES(SEQ_FIELD_TRIP.NEXTVAL, '숭어 얼음 낚시', '숭어는 숭숭 잡혀요~', 80);

INSERT INTO TBL_FIELD_TRIP
VALUES(SEQ_FIELD_TRIP.NEXTVAL, '커피체험공장', '커피는 역시 자바', 60);

INSERT INTO TBL_FIELD_TRIP
VALUES(SEQ_FIELD_TRIP.NEXTVAL, '커피체험공장', '커피는 역시 자바', 60);

INSERT INTO TBL_FIELD_TRIP
VALUES(SEQ_FIELD_TRIP.NEXTVAL, '치즈 제작하기', '여기 치즈 다 주세요', 5);

INSERT INTO TBL_FIELD_TRIP
VALUES(SEQ_FIELD_TRIP.NEXTVAL, '동물 타보기', '이리야!', 9);

SELECT * FROM TBL_FIELD_TRIP;

SELECT AVG(FIELD_NUMBER)
FROM TBL_FIELD_TRIP;

INSERT INTO TBL_FIELD_TRIP
VALUES(SEQ_FIELD_TRIP.NEXTVAL, '모내기 학습', '노예인지 농부인지', 9);

SELECT CEIL(AVG(FIELD_NUMBER))
FROM TBL_FIELD_TRIP;

SELECT FLOOR(AVG(FIELD_NUMBER))
FROM TBL_FIELD_TRIP;

SELECT ROUND(AVG(FIELD_NUMBER),2)
FROM TBL_FIELD_TRIP;

-- 행의 개수
SELECT COUNT(ID)
FROM TBL_FIELD_TRIP;

SELECT MIN(FIELD_NUMBER)
FROM TBL_FIELD_TRIP;

SELECT MAX(FIELD_NUMBER)
FROM TBL_FIELD_TRIP;

SELECT SUM(FIELD_NUMBER)
FROM TBL_FIELD_TRIP;

-- 참가자 수의 평균 이상인 체험 학습을 조회
-- 그룹 : 같은 값으로 묶는 것
SELECT *
FROM TBL_FIELD_TRIP
--WHERE ID = 1
GROUP BY ID, FIELD_TITLE, FIELD_CONTENT, FIELD_NUMBER
HAVING FIELD_NUMBER >= (
	SELECT AVG(FIELD_NUMBER)
	FROM TBL_FIELD_TRIP
);

SELECT *
FROM TBL_FIELD_TRIP
WHERE FIELD_NUMBER >= (
	SELECT AVG(FIELD_NUMBER) 
	FROM TBL_FIELD_TRIP
);

-- GROUP BY : 컬럼을 그룹으로 만든다.

-- 1) 체험학습 중 FIELD_TITLE에 '기'를 포함한 체험학습의 개수를 조회하기
SELECT COUNT(ID) AS "'기'를 포함한 체험학습 수"
FROM TBL_FIELD_TRIP 
WHERE FIELD_TITLE LIKE '%기%';

-- 체험학습 중 인원이 가장 적은 인원부터 조회하기
-- 오름차순 ASC, 내림차순 DESC
SELECT *
FROM TBL_FIELD_TRIP
ORDER BY FIELD_NUMBER ASC;

CREATE SEQUENCE SEQ_PRODUCT;
CREATE TABLE TBL_PRODUCT(
	ID NUMBER CONSTRAINT PK_PRODUCT PRIMARY KEY,
	PRODUCT_NAME VARCHAR2(255),
	PRODUCT_PRICE NUMBER,
	PRODUCT_MEMBER_AGE NUMBER
);

INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 1000, 20);
INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 3000, 30);
INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 4000, 40);
INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 1000, 40);
INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 5000, 20);

INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 2000, 20);
INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 5000, 30);
INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 9000, 30);
INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 2000, 50);
INSERT INTO TBL_PRODUCT
VALUES(SEQ_PRODUCT.NEXTVAL, '지우개', 1000, 10);

SELECT * FROM TBL_PRODUCT;

SELECT ROUND(AVG(PRODUCT_PRICE),1) AS "평균 값"  
FROM TBL_PRODUCT
GROUP BY PRODUCT_MEMBER_AGE
ORDER BY "평균 값";

-- 연령대 별 평균 가격이 2000원 보다 높은 구매자의 수

SELECT PRODUCT_MEMBER_AGE ,COUNT(PRODUCT_MEMBER_AGE)
FROM TBL_PRODUCT
GROUP BY PRODUCT_MEMBER_AGE
HAVING AVG(PRODUCT_PRICE) > 2000;

-- 서브 쿼리(SUB QUERY)
-- 지우개의 평균 가격보다 낮은 지우개를 조회
SELECT *
FROM TBL_PRODUCT
WHERE PRODUCT_PRICE < (
	SELECT AVG(PRODUCT_PRICE)
	FROM TBL_PRODUCT
);

-- 20대 중 구매 가격이 2000원이 넘는 주분번호를 조회
SELECT ID
FROM TBL_PRODUCT
WHERE PRODUCT_MEMBER_AGE = 20 AND PRODUCT_PRICE >= 2000;

-- 서브쿼리는 알리아스가 필요하다.
-- 서브쿼리의 알리아스는 AS 를 붙이지 않는다.
-- AS는 컬럼의 이름을 정의하는 알리아스이다.
SELECT TP.ID
FROM (
	SELECT *
	FROM TBL_PRODUCT
	WHERE PRODUCT_MEMBER_AGE = 20
) TP
WHERE PRODUCT_PRICE > 2000;

SELECT 
	ID, 
	PRODUCT_NAME, 
	PRODUCT_PRICE, 
	(
		SELECT AVG(PRODUCT_PRICE) 
		FROM TBL_PRODUCT
	) AS "평균",
	PRODUCT_MEMBER_AGE
FROM TBL_PRODUCT;

SELECT AVG(PRODUCT_PRICE) 
FROM TBL_PRODUCT;

-- 서브쿼리
/*
 * FROM절 : IN LINE VIEW
 * SELECT절 : SCALAR
 * WHERE절 : SUB QUERY
 * 
*/

-- 평균 나이보다 작은 지우개의 번호를 조회

SELECT ID
FROM TBL_PRODUCT 
WHERE PRODUCT_MEMBER_AGE > (
	SELECT AVG(PRODUCT_MEMBER_AGE) 
	FROM TBL_PRODUCT tp 
);


-- 연령대별 평균 가격보다 큰 지우개 개수

SELECT COUNT(ID) 
FROM TBL_PRODUCT TP, (
		SELECT  PRODUCT_MEMBER_AGE, AVG(PRODUCT_PRICE) AS "평균값"
		FROM TBL_PRODUCT 
		GROUP BY PRODUCT_MEMBER_AGE
	) PPAV
WHERE TP.PRODUCT_MEMBER_AGE = PPAV.PRODUCT_MEMBER_AGE 
AND PRODUCT_PRICE > "평균값";


SELECT  PRODUCT_MEMBER_AGE, AVG(PRODUCT_PRICE)
FROM TBL_PRODUCT 
GROUP BY PRODUCT_MEMBER_AGE


--  평균 지우개 가격보다 가격이 큰 지우개의 개수 연령대별 조회

SELECT 
   PRODUCT_MEMBER_AGE AS "연령대",
   COUNT(PRODUCT_MEMBER_AGE) AS "연령대 별 개수"
FROM TBL_PRODUCT
WHERE PRODUCT_PRICE > (
   SELECT AVG(PRODUCT_PRICE)
   FROM TBL_PRODUCT
)
GROUP BY PRODUCT_MEMBER_AGE; 

--FROM TBL_PRODUCT
--WHERE 

-- 40대 이면서 지우개가 4000보다 크거나 같은 아이디를 조회

SELECT ID
FROM (
		SELECT *
		FROM TBL_PRODUCT
		WHERE PRODUCT_MEMBER_AGE = 40
)
WHERE PRODUCT_PRICE >= 4000 ;

SELECT ID
FROM TBL_PRODUCT
WHERE PRODUCT_MEMBER_AGE = 40 AND PRODUCT_PRICE  >= 4000;

-- WHERE ~ IN

SELECT *
FROM TBL_PRODUCT
WHERE PRODUCT_MEMBER_AGE IN ('20', '30', '40');

-- IN절 내부의 서브쿼리는 다중컬럼으로 들어올 수 있다!
SELECT *
FROM TBL_PRODUCT tp 
WHERE ID IN(
	SELECT ID 
	FROM TBL_PRODUCT
	WHERE PRODUCT_MEMBER_AGE > 30
);


