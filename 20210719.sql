/*여러줄 주석*/
-- 한줄주석
-- HR 계정으로 테스트 하고 있습니다.
-- MySQL 과 달리 Oracle SQL 에서는 계정이 데이터베이스 개념까지 겸할 수가 있습니다.
-- hr계정에는 인사팀 관련 데이터가 들어와 있습니다.
-- MySQL 과 마찬가지로 Oracle에서도 거의 유사한 SELECT 구문을 사용함
SELECT
    employee_id,
    first name,
    last_name
FROM
    employees;

SELECT
    *
FROM
    employees;

-- 급여가 5000이상인 직원의 아이디, 성, 이름만 출력하기

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 5000;

-- Oracle 에서도 ORDER BY 로 정렬을 걸 수 있습니다. 직원 아이디를 오름차순으로 정렬까지하기
SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 5000
ORDER BY
    employee_id ASC;

-- 조건을 다중으로 걸기 : 급여 500 이상 job_id 가 'IT_prog인 케이스 조회
SELECT
    employee_id,
    salary,
    job_id
FROM
    employees
WHERE
        salary >= 5000
    AND job_id = 'IT_PROG';

-- ORACLE은 문자열 자료형의 경우 대소문자구분을 함 
SELECT
    employee_id,
    salary,
    job_id
FROM
    employees
WHERE
        salary >= 5000
    AND job_id = 'it_prog';  -- 소문자는없어서 안됨 IT_PROG는 잇음

-- 급여가 5000이상이거나 혹은 job_id 가 'IT_PROG'인 직원 조회
SELECT
    employee_id,
    salary,
    job_id
FROM
    employees
WHERE
    salary >= 5000
    OR job_id = 'IT_PROG';

-- 나오는 row갯수만 알고 싶은경우
SELECT
    COUNT(*)
FROM
    employees
WHERE
    salary >= 5000
    OR job_id = 'IT_PROG';

-- 컬럼명이 원래는 기존에 테이블을 만들때 설정한 이름으로 조회되지만
-- SELECT 결과문에서 바꿔서 조회하고 싶을 떄느 AS구문을 사용합니다.
-- SELECT 컬럼명1 AS 바꿀이름1, 컬럼명2 AS 바꿀이름2.... mysql은 '' 을 붙임
-- 버전에 따라 다른데 키워드 AS 안붙여도 되기도 함
SELECT
    employee_id AS 직원아이디
FROM
    employees;

SELECT
    employee_id 직원아이디
FROM
    employees;

-- INSERT INTO 구문은 테입믈에 ROW를 추가하는 구문입니다.
-- MySQL과 거의 동일한 문법 사용
-- 테스트용 테이블 생성
CREATE TABLE test1 (
    col1 VARCHAR2(10), -- 문자열
    col2 NUMBER, --정수(int)
    col3 DATE --날짜 ( 상세시간 제외 , 상세시간 입력시 TIMESTAMP)
);
    
-- INSERT INTO를 이용해 test1에 저장합니다.
-- 시간은 서버시간으로 저장할경우 SYSDATE를 입력해줍니다. 
-- MySQL에서는 SYSDATE 대신에 now() 를 사용함
INSERT INTO test1 VALUES (
    'abc',
    10,
    sysdate
);

-- INTO 절에서 컬럼 순서를 바꿔도 VALUES 에서 바뀐 순서에 맞춰서 넣어주면 문제는 없습니다.

INSERT INTO test1 (
    col3,
    col1,
    col2
) VALUES (
    sysdate,
    'deg',
    21
);

-- 하지만 다음과 같이 데이터 타입을 맞추지 않으면 오류가 뜹니다.
INSERT INTO test1 VALUES (
    'abc',
    10,
    30
);

-- 일부 생략시 역시 오류가 발생합니다.
INSERT INTO test1 VALUES (
    'jkl',
    30
);

-- 컬럼데이터 내용물 복사하기. INSERT ~ SELECT 문
-- SubQUERY형태로 INSERT INTO 구문의 VALUES가 들어갈 자리에
-- 데이터 자료형이 일치하는 SELECT 구문을 작성하면
-- SELECT 문의 결과물이 그대로 전부 INSERT 됩니다.
CREATE TABLE test2 (
    emp_id NUMBER
);

--바로 아래의 SELECT 구문은 NUMBER데이터만 결과로 나옴
SELECT
    employee_id
FROM
    employees;

-- test2 테이블 내부에, 위 결과로 나온 숫자 전체를 집어 넣는다.
INSERT INTO test2
    SELECT
        employee_id
    FROM
        employees;

--위는 실제로 MySQL의 아래쪽 구문처럼 처리됨.
--INSERT INTO test2
--        (100),(101),(102)....(206);

SELECT
    *
FROM
    test2;

--문제 INSERT ~ SELECT 구문을 이용하여 
-- EMPLOYEE 테이블의 employee_id,first_name,last_name,job_id
-- 4개 컬럼을 전체 복사받는 test3 테이블을 생성한 후 복사진행

CREATE TABLE test3 (
    emp_id NUMBER,
    fname  VARCHAR2(30),
    lname  VARCHAR2(30),
    jo_id  VARCHAR2(30)
);

INSERT INTO test3
    SELECT
        employee_id,
        first_name,
        last_name,
        job_id
    FROM
        employees;

SELECT
    *
FROM
    test3;
    
-- UPDATE 문 
-- UPDATE SET을 이용해서 처리하며 MySQL 과 거의 유사한 문법을 사용합니다.
-- !! UPDATE SET은 그냥 처리하면 컬럼 전체값이 바뀝니다.
-- !! 따라서 WHERE 와 함께 사용하는 것이 일반적
SELECT
    *
FROM
    test1;
    
-- 테이블 col2의 값을 전부 50으로 바꾸어 줍니다.
UPDATE test1
SET
    col2 = 50;

SELECT
    *
FROM
    test1;

-- col1의 값이 deg인 경우에만 col2를 500으로 고치기
UPDATE test1
SET
    col2 = 500
WHERE
    col1 = 'deg';

SELECT
    *
FROM
    test1;

-- Oracle SQL의 MERGE 구문은 MySQL의 ON DUPLICATE KEY UPDATE 와 같다.
-- 데이터가 있는 경우 UPDATE를 , 없는 경우 INSERT를 실행함
-- MERGE INTO를 사용하고 ORACLE에서는 MySQL보다 다소 복잡하지만 기능상으로는 큰 차이가 없기 때문에 문법적 차이점에 주목하기
DROP TABLE test4;

CREATE TABLE test4 (
    employee_id NUMBER PRIMARY KEY,
    bonus_amt   NUMBER DEFAULT 0 -- 아무 값도 입력되지 않으면 0입력
);

INSERT INTO test4 ( employee_id )
    SELECT
        e.employee_id    -- e. ~ 없어도 되긴됫음 but 확실히 어디의 id인지 확실히 하기위해 넣는것
    FROM
        employees e
    WHERE
        e.employee_id < 106;

SELECT
    *
FROM
    test4;

-- 존재하는 employee_id값으로 넣는 경우 => 갱신
-- 존재하지 않는 employee_id 값으로 넣는 경우 => 추가
INSERT INTO test4 ( employee_id ) VALUES ( 107 ); -- 100 같은 기존에 있는거 넣으려면 prima~가 되잇어서 무결성조건으로 덮어쓰기안됨

-- MERGE INTO 구문을 이용하여 처리해보자
-- 입력할 테이블 t1, 테이블 하나에 대해서 작업시는 USING DUAL임
MERGE INTO test4 t1    --test4에 집어 넣으려 할건데
USING dual ON ( t1.employee_id = 105 ) --조건식(t1의 employee_id에 우측값(100)이 있는가??)
WHEN MATCHED THEN      -- 매칭이 되는 경우 ( 값이 존재하는 경우 )
 UPDATE
SET t1.bonus_amt = 2000  --(집어넣어야할값)
WHEN NOT MATCHED THEN  -- 매칭이 되지 않는 경우 (값이 없는 경우)
INSERT (
    t1.employee_id,
    t1.bonus_amt )
VALUES
    ( 105,
    2000 );-- ( t.employee_id, t.bonus_amt ) t.emp~ , t.b~ 에 100 , 300 같은 값넣어야함

SELECT
    *
FROM
    test4;

-- DELETE 구문은 특정 로우를 삭제합니다.
-- WHERE 절이 들어가지 않는 다면 전체 데이터가 삭제 되기 때문에
-- 이 점을 주의해서 UPDATE 문과 마찬가지로 사실상 WHERE 절과 세트로 생각하면 됨
-- MySQL과 문법적으로 큰 차이는 없다.

-- test4 테이블에서 BONUS_AMT가 700을 초과하는 데이터만 삭제해주세요

DELETE FROM test4
WHERE
    bonus_amt > 700;

-- Oracle SQL에서는 인덱스를 조회하기가 MySQL보다 쉽습니다.
-- 인덱스란 조회를 위해 ROW별로 매겨진 임의의 값입니다.
-- Oracle SQL에서는 SELECT 문에 rownum을 적어서 로우 인덱스 번호를
-- SELECT 문에 rowid를 적어 로우 인덱스 주소값을 같이 조회할 수 있습니다.
-- MySQL에는 없는 기능임
-- rownum,rowid처럼 사용자가 직접 입력하지 않고 조회되는 컬럼을 가리켜서 '의사 컬럼'이라 부름
SELECT
    ROWNUM,
    ROWID,
    employee_id,
    bonus_amt
FROM
    test4;

-- GROUP BY 역시 MySQL과 비슷한 문법을 사용합니다.
-- SELECT 집계함수(컬럼명)... GROUP BY ( 기준컬럼) HAVING 조건절;
-- 조건절은 HAVING 으로 처리합니다
SELECT
    *
FROM
    employees;

-- EMPLOYEES에는 JOB_ID(직무구분),DEPARTMENT_ID(부서 구분) 등 여러 집단을 대표하는 자료가 있습니다.
-- GROUP BY를 이용해 부서별, 직무별 데이터를 집계해보겠습니다.
-- 각 직무별 평균 연봉을 구해주세요

SELECT
    job_id,
    department_id,
    round(AVG(salary), 0)
FROM
    employees
GROUP BY
    department_id,
    job_id
ORDER BY
    department_id ASC;
    
-- 각 직무별 평균 연봉을 구하되, 10000이상 구하기
SELECT
    job_id,
    department_id,
    round(AVG(salary), 0)
FROM
    employees
GROUP BY
    department_id,
    job_id
HAVING
    AVG(salary) > 10000
ORDER BY
    department_id ASC;

-- 각 부서별 평균 연봉을 구하되 , 6000 이상 9000 미만으로 구하기
SELECT
    department_id,
    round(AVG(salary), 0)
FROM
    employees
GROUP BY
    department_id
HAVING
    AVG(salary) BETWEEN 6000 AND 9000
ORDER BY
    department_id ASC;
    
-- join은 두개이상의 테이블을 하나로 합쳐주는것을 의미함
-- 기본적으로 join은 특별한 경우를 제외하고는 합쳐주기 위한 기준컬럼이
-- 필요하며, 일반적으로 FOREIGN KEY 로 연결된 컴럼간에 JOIN을 수행합니다.
-- 그러나 반드시 FOREIGN KEY 관계여야만 조인을 수행할 수 있는 것은 아니다.
-- SELECT 테이블1.컬럼1, 테이블1.컬럼2,테이블2.컬럼1....
--      FROM 테이블1(별명) JOIN 테이블2 (별명)
--      ON 테이블1.조건컬럼 = 테이블2.조건컬럼;
-- 조인 구문은 INNER,LEFT,RIGHT, FULL 이있으며
-- MySQL에서는 FULL조인이 FULL키워드로는 불가능합니다 UNION
-- Oracle에서는 FULL키워드를 허용합니다.
CREATE TABLE join_a (
    emp_id NUMBER
);

CREATE TABLE join_b (
    emp_id NUMBER
);

INSERT INTO join_a VALUES ( 10 );

INSERT INTO join_a VALUES ( 20 );

INSERT INTO join_a VALUES ( 40 );

INSERT INTO join_b VALUES ( 10 );

INSERT INTO join_b VALUES ( 20 );

INSERT INTO join_b VALUES ( 30 );

-- INNER JOIN 둘다 가지고 있는 10,20만 출력
SELECT
    a.emp_id,
    b.emp_id
FROM
         join_a a
    INNER JOIN join_b b ON ( a.emp_id = b.emp_id );
    
-- LEFT OUTER JOIN  -왼쪽 테이블자료 모두 살려
-- 공통자료 10 20 뿐만아니라 왼쪽에만있는 40 살려
SELECT
    a.emp_id,
    b.emp_id
FROM
    join_a a
    LEFT OUTER JOIN join_b b ON ( a.emp_id = b.emp_id );
    
--RIGHT OUTER JOIN   -오른쪽 테이블 자료 모두 살려
--공통자료 10 20 과 B만가진 자료 30이 출력
SELECT
    a.emp_id,
    b.emp_id
FROM
         join_a a
    RIGHT OUTER JOIN join_b b ON ( a.emp_id = b.emp_id );
    
-- FULL OUTER JOIN 
--공통자료 10,20뿐만아니라 왼쪽에 40 오른쪽에 30이 모두출력
SELECT
    a.emp_id,
    b.emp_id
FROM
         join_a a
    FULL OUTER JOIN join_b b ON ( a.emp_id = b.emp_id );
    