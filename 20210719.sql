/*������ �ּ�*/
-- �����ּ�
-- HR �������� �׽�Ʈ �ϰ� �ֽ��ϴ�.
-- MySQL �� �޸� Oracle SQL ������ ������ �����ͺ��̽� ������� ���� ���� �ֽ��ϴ�.
-- hr�������� �λ��� ���� �����Ͱ� ���� �ֽ��ϴ�.
-- MySQL �� ���������� Oracle������ ���� ������ SELECT ������ �����
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

-- �޿��� 5000�̻��� ������ ���̵�, ��, �̸��� ����ϱ�

SELECT
    employee_id,
    first_name,
    last_name,
    salary
FROM
    employees
WHERE
    salary > 5000;

-- Oracle ������ ORDER BY �� ������ �� �� �ֽ��ϴ�. ���� ���̵� ������������ ���ı����ϱ�
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

-- ������ �������� �ɱ� : �޿� 500 �̻� job_id �� 'IT_prog�� ���̽� ��ȸ
SELECT
    employee_id,
    salary,
    job_id
FROM
    employees
WHERE
        salary >= 5000
    AND job_id = 'IT_PROG';

-- ORACLE�� ���ڿ� �ڷ����� ��� ��ҹ��ڱ����� �� 
SELECT
    employee_id,
    salary,
    job_id
FROM
    employees
WHERE
        salary >= 5000
    AND job_id = 'it_prog';  -- �ҹ��ڴ¾�� �ȵ� IT_PROG�� ����

-- �޿��� 5000�̻��̰ų� Ȥ�� job_id �� 'IT_PROG'�� ���� ��ȸ
SELECT
    employee_id,
    salary,
    job_id
FROM
    employees
WHERE
    salary >= 5000
    OR job_id = 'IT_PROG';

-- ������ row������ �˰� �������
SELECT
    COUNT(*)
FROM
    employees
WHERE
    salary >= 5000
    OR job_id = 'IT_PROG';

-- �÷����� ������ ������ ���̺��� ���鶧 ������ �̸����� ��ȸ������
-- SELECT ��������� �ٲ㼭 ��ȸ�ϰ� ���� ���� AS������ ����մϴ�.
-- SELECT �÷���1 AS �ٲ��̸�1, �÷���2 AS �ٲ��̸�2.... mysql�� '' �� ����
-- ������ ���� �ٸ��� Ű���� AS �Ⱥٿ��� �Ǳ⵵ ��
SELECT
    employee_id AS �������̵�
FROM
    employees;

SELECT
    employee_id �������̵�
FROM
    employees;

-- INSERT INTO ������ ���Թɿ� ROW�� �߰��ϴ� �����Դϴ�.
-- MySQL�� ���� ������ ���� ���
-- �׽�Ʈ�� ���̺� ����
CREATE TABLE test1 (
    col1 VARCHAR2(10), -- ���ڿ�
    col2 NUMBER, --����(int)
    col3 DATE --��¥ ( �󼼽ð� ���� , �󼼽ð� �Է½� TIMESTAMP)
);
    
-- INSERT INTO�� �̿��� test1�� �����մϴ�.
-- �ð��� �����ð����� �����Ұ�� SYSDATE�� �Է����ݴϴ�. 
-- MySQL������ SYSDATE ��ſ� now() �� �����
INSERT INTO test1 VALUES (
    'abc',
    10,
    sysdate
);

-- INTO ������ �÷� ������ �ٲ㵵 VALUES ���� �ٲ� ������ ���缭 �־��ָ� ������ �����ϴ�.

INSERT INTO test1 (
    col3,
    col1,
    col2
) VALUES (
    sysdate,
    'deg',
    21
);

-- ������ ������ ���� ������ Ÿ���� ������ ������ ������ ��ϴ�.
INSERT INTO test1 VALUES (
    'abc',
    10,
    30
);

-- �Ϻ� ������ ���� ������ �߻��մϴ�.
INSERT INTO test1 VALUES (
    'jkl',
    30
);

-- �÷������� ���빰 �����ϱ�. INSERT ~ SELECT ��
-- SubQUERY���·� INSERT INTO ������ VALUES�� �� �ڸ���
-- ������ �ڷ����� ��ġ�ϴ� SELECT ������ �ۼ��ϸ�
-- SELECT ���� ������� �״�� ���� INSERT �˴ϴ�.
CREATE TABLE test2 (
    emp_id NUMBER
);

--�ٷ� �Ʒ��� SELECT ������ NUMBER�����͸� ����� ����
SELECT
    employee_id
FROM
    employees;

-- test2 ���̺� ���ο�, �� ����� ���� ���� ��ü�� ���� �ִ´�.
INSERT INTO test2
    SELECT
        employee_id
    FROM
        employees;

--���� ������ MySQL�� �Ʒ��� ����ó�� ó����.
--INSERT INTO test2
--        (100),(101),(102)....(206);

SELECT
    *
FROM
    test2;

--���� INSERT ~ SELECT ������ �̿��Ͽ� 
-- EMPLOYEE ���̺��� employee_id,first_name,last_name,job_id
-- 4�� �÷��� ��ü ����޴� test3 ���̺��� ������ �� ��������

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
    
-- UPDATE �� 
-- UPDATE SET�� �̿��ؼ� ó���ϸ� MySQL �� ���� ������ ������ ����մϴ�.
-- !! UPDATE SET�� �׳� ó���ϸ� �÷� ��ü���� �ٲ�ϴ�.
-- !! ���� WHERE �� �Բ� ����ϴ� ���� �Ϲ���
SELECT
    *
FROM
    test1;
    
-- ���̺� col2�� ���� ���� 50���� �ٲپ� �ݴϴ�.
UPDATE test1
SET
    col2 = 50;

SELECT
    *
FROM
    test1;

-- col1�� ���� deg�� ��쿡�� col2�� 500���� ��ġ��
UPDATE test1
SET
    col2 = 500
WHERE
    col1 = 'deg';

SELECT
    *
FROM
    test1;

-- Oracle SQL�� MERGE ������ MySQL�� ON DUPLICATE KEY UPDATE �� ����.
-- �����Ͱ� �ִ� ��� UPDATE�� , ���� ��� INSERT�� ������
-- MERGE INTO�� ����ϰ� ORACLE������ MySQL���� �ټ� ���������� ��ɻ����δ� ū ���̰� ���� ������ ������ �������� �ָ��ϱ�
DROP TABLE test4;

CREATE TABLE test4 (
    employee_id NUMBER PRIMARY KEY,
    bonus_amt   NUMBER DEFAULT 0 -- �ƹ� ���� �Էµ��� ������ 0�Է�
);

INSERT INTO test4 ( employee_id )
    SELECT
        e.employee_id    -- e. ~ ��� �Ǳ���� but Ȯ���� ����� id���� Ȯ���� �ϱ����� �ִ°�
    FROM
        employees e
    WHERE
        e.employee_id < 106;

SELECT
    *
FROM
    test4;

-- �����ϴ� employee_id������ �ִ� ��� => ����
-- �������� �ʴ� employee_id ������ �ִ� ��� => �߰�
INSERT INTO test4 ( employee_id ) VALUES ( 107 ); -- 100 ���� ������ �ִ°� �������� prima~�� ���վ ���Ἲ�������� �����ȵ�

-- MERGE INTO ������ �̿��Ͽ� ó���غ���
-- �Է��� ���̺� t1, ���̺� �ϳ��� ���ؼ� �۾��ô� USING DUAL��
MERGE INTO test4 t1    --test4�� ���� ������ �Ұǵ�
USING dual ON ( t1.employee_id = 105 ) --���ǽ�(t1�� employee_id�� ������(100)�� �ִ°�??)
WHEN MATCHED THEN      -- ��Ī�� �Ǵ� ��� ( ���� �����ϴ� ��� )
 UPDATE
SET t1.bonus_amt = 2000  --(����־���Ұ�)
WHEN NOT MATCHED THEN  -- ��Ī�� ���� �ʴ� ��� (���� ���� ���)
INSERT (
    t1.employee_id,
    t1.bonus_amt )
VALUES
    ( 105,
    2000 );-- ( t.employee_id, t.bonus_amt ) t.emp~ , t.b~ �� 100 , 300 ���� ���־����

SELECT
    *
FROM
    test4;

-- DELETE ������ Ư�� �ο츦 �����մϴ�.
-- WHERE ���� ���� �ʴ� �ٸ� ��ü �����Ͱ� ���� �Ǳ� ������
-- �� ���� �����ؼ� UPDATE ���� ���������� ��ǻ� WHERE ���� ��Ʈ�� �����ϸ� ��
-- MySQL�� ���������� ū ���̴� ����.

-- test4 ���̺��� BONUS_AMT�� 700�� �ʰ��ϴ� �����͸� �������ּ���

DELETE FROM test4
WHERE
    bonus_amt > 700;

-- Oracle SQL������ �ε����� ��ȸ�ϱⰡ MySQL���� �����ϴ�.
-- �ε����� ��ȸ�� ���� ROW���� �Ű��� ������ ���Դϴ�.
-- Oracle SQL������ SELECT ���� rownum�� ��� �ο� �ε��� ��ȣ��
-- SELECT ���� rowid�� ���� �ο� �ε��� �ּҰ��� ���� ��ȸ�� �� �ֽ��ϴ�.
-- MySQL���� ���� �����
-- rownum,rowidó�� ����ڰ� ���� �Է����� �ʰ� ��ȸ�Ǵ� �÷��� �����Ѽ� '�ǻ� �÷�'�̶� �θ�
SELECT
    ROWNUM,
    ROWID,
    employee_id,
    bonus_amt
FROM
    test4;

-- GROUP BY ���� MySQL�� ����� ������ ����մϴ�.
-- SELECT �����Լ�(�÷���)... GROUP BY ( �����÷�) HAVING ������;
-- �������� HAVING ���� ó���մϴ�
SELECT
    *
FROM
    employees;

-- EMPLOYEES���� JOB_ID(��������),DEPARTMENT_ID(�μ� ����) �� ���� ������ ��ǥ�ϴ� �ڷᰡ �ֽ��ϴ�.
-- GROUP BY�� �̿��� �μ���, ������ �����͸� �����غ��ڽ��ϴ�.
-- �� ������ ��� ������ �����ּ���

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
    
-- �� ������ ��� ������ ���ϵ�, 10000�̻� ���ϱ�
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

-- �� �μ��� ��� ������ ���ϵ� , 6000 �̻� 9000 �̸����� ���ϱ�
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
    
-- join�� �ΰ��̻��� ���̺��� �ϳ��� �����ִ°��� �ǹ���
-- �⺻������ join�� Ư���� ��츦 �����ϰ�� �����ֱ� ���� �����÷���
-- �ʿ��ϸ�, �Ϲ������� FOREIGN KEY �� ����� �ķ����� JOIN�� �����մϴ�.
-- �׷��� �ݵ�� FOREIGN KEY ���迩�߸� ������ ������ �� �ִ� ���� �ƴϴ�.
-- SELECT ���̺�1.�÷�1, ���̺�1.�÷�2,���̺�2.�÷�1....
--      FROM ���̺�1(����) JOIN ���̺�2 (����)
--      ON ���̺�1.�����÷� = ���̺�2.�����÷�;
-- ���� ������ INNER,LEFT,RIGHT, FULL ��������
-- MySQL������ FULL������ FULLŰ����δ� �Ұ����մϴ� UNION
-- Oracle������ FULLŰ���带 ����մϴ�.
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

-- INNER JOIN �Ѵ� ������ �ִ� 10,20�� ���
SELECT
    a.emp_id,
    b.emp_id
FROM
         join_a a
    INNER JOIN join_b b ON ( a.emp_id = b.emp_id );
    
-- LEFT OUTER JOIN  -���� ���̺��ڷ� ��� ���
-- �����ڷ� 10 20 �Ӹ��ƴ϶� ���ʿ����ִ� 40 ���
SELECT
    a.emp_id,
    b.emp_id
FROM
    join_a a
    LEFT OUTER JOIN join_b b ON ( a.emp_id = b.emp_id );
    
--RIGHT OUTER JOIN   -������ ���̺� �ڷ� ��� ���
--�����ڷ� 10 20 �� B������ �ڷ� 30�� ���
SELECT
    a.emp_id,
    b.emp_id
FROM
         join_a a
    RIGHT OUTER JOIN join_b b ON ( a.emp_id = b.emp_id );
    
-- FULL OUTER JOIN 
--�����ڷ� 10,20�Ӹ��ƴ϶� ���ʿ� 40 �����ʿ� 30�� ������
SELECT
    a.emp_id,
    b.emp_id
FROM
         join_a a
    FULL OUTER JOIN join_b b ON ( a.emp_id = b.emp_id );
    