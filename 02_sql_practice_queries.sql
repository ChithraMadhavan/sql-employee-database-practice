-- ============================================
-- SQL Employee Database Practice
-- File: 02_sql_practice_queries.sql
-- ============================================


-- ============================================
-- Q1(A)
-- Display all the information of the EMP table
-- ============================================

SELECT *
FROM employees;


-- ============================================
-- Q1(B)
-- Display unique Jobs from EMP table
-- ============================================

SELECT DISTINCT JOB
FROM employees;


-- ============================================
-- Q1(C)
-- List the employees in ascending order of Salary
-- ============================================

SELECT *
FROM employees
ORDER BY SALARY ASC;


-- ============================================
-- Q1(D)
-- List employee details in ascending order of
-- Department Number and descending order of Job
-- ============================================

SELECT *
FROM employees
ORDER BY DEPTNO ASC, JOB DESC;


-- ============================================
-- Q1(E)
-- Display unique job groups in descending order
-- ============================================

SELECT DISTINCT JOB
FROM employees
ORDER BY JOB DESC;


-- ============================================
-- Q1(F)
-- Display all details of all Managers
-- ============================================

SELECT *
FROM employees
WHERE JOB = 'MANAGER';


-- ============================================
-- Q1(G)
-- List employees who joined before 1981
-- ============================================

SELECT *
FROM employees
WHERE HIREDATE < '1981-01-01';


-- ============================================
-- Q1(H)
-- Display Empno, Ename, Salary and Daily Salary
-- in ascending order of Annual Salary
-- ============================================

SELECT
    EMPNO,
    ENAME,
    SALARY,
    SALARY / 30 AS DAILY_SALARY,
    SALARY * 12 AS ANNUAL_SALARY
FROM employees
ORDER BY ANNUAL_SALARY ASC;


-- ============================================
-- Q2.9
-- Display Empno, Ename, Job, Hiredate and
-- Experience of all Managers
-- ============================================

SELECT
    EMPNO,
    ENAME,
    JOB,
    HIREDATE,
    EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM HIREDATE) AS EXPERIENCE
FROM employees
WHERE JOB = 'MANAGER';


-- ============================================
-- Q2.10
-- List Empno, Ename, Salary and Experience
-- of all employees working for Manager 7698
-- ============================================

SELECT
    EMPNO,
    ENAME,
    SALARY,
    EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM HIREDATE) AS EXPERIENCE
FROM employees
WHERE MGR = 7698;


-- ============================================
-- Q2.11
-- Display employees whose Commission is
-- more than their Salary
-- ============================================

SELECT *
FROM employees
WHERE COMM > SALARY;


-- ============================================
-- Q2.12
-- List employees in ascending order of
-- Designation who joined after the second
-- half of 1981
-- ============================================

SELECT *
FROM employees
WHERE HIREDATE > '1981-06-30'
ORDER BY JOB ASC;


-- ============================================
-- Q2.14
-- List employees who are either CLERK or
-- ANALYST in descending order
-- ============================================

SELECT *
FROM employees
WHERE JOB IN ('CLERK', 'ANALYST')
ORDER BY JOB DESC;


-- ============================================
-- Q2.15
-- List employees who joined on:
-- 1-MAY-81, 3-DEC-81, 17-DEC-81, 19-JAN-80
-- in ascending order of seniority
-- ============================================

SELECT *
FROM employees
WHERE HIREDATE IN (
    '1981-05-01',
    '1981-12-03',
    '1980-12-17',
    '1980-01-19'
)
ORDER BY HIREDATE ASC;


-- ============================================
-- Q2.16
-- List employees working for Department 10 or 20
-- ============================================

SELECT *
FROM employees
WHERE DEPTNO IN (10, 20);


-- ============================================
-- Q2.17
-- List employees who joined in the year 1981
-- ============================================

SELECT *
FROM employees
WHERE HIREDATE >= '1981-01-01'
  AND HIREDATE < '1982-01-01';


-- ============================================
-- Q2.18
-- List employees who joined in August 1980
-- ============================================

SELECT *
FROM employees
WHERE HIREDATE >= '1980-08-01'
  AND HIREDATE < '1980-09-01';


-- ============================================
-- Q2.19
-- List employees whose Annual Salary ranges
-- from 22000 to 45000
-- ============================================

SELECT
    EMPNO,
    ENAME,
    SALARY,
    SALARY * 12 AS ANNUAL_SALARY
FROM employees
WHERE SALARY * 12 BETWEEN 22000 AND 45000;


-- ============================================
-- Q2.20
-- List employee names having five characters
-- ============================================

SELECT ENAME
FROM employees
WHERE LENGTH(ENAME) = 5;


-- ============================================
-- Q2.21
-- List employees whose names start with S
-- and have five characters
-- ============================================

SELECT *
FROM employees
WHERE ENAME LIKE 'S____';


-- ============================================
-- Q2.22
-- List employees having four characters
-- where the third character is R
-- ============================================

SELECT *
FROM employees
WHERE ENAME LIKE '__R_';


-- ============================================
-- Q2.23
-- List five-character names starting with S
-- and ending with H
-- ============================================

SELECT ENAME
FROM employees
WHERE ENAME LIKE 'S___H';


-- ============================================
-- Q2.24
-- List employees who joined in January
-- ============================================

SELECT *
FROM employees
WHERE EXTRACT(MONTH FROM HIREDATE) = 1;


-- ============================================
-- Q2.25
-- List employees who joined in a month
-- whose second character is A
-- ============================================

SELECT *
FROM employees
WHERE TO_CHAR(HIREDATE, 'MONTH') LIKE '_A%';


-- ============================================
-- Q2.26
-- List employees whose Salary is a four-digit
-- number ending in zero
-- ============================================

SELECT *
FROM employees
WHERE SALARY BETWEEN 1000 AND 9999
  AND MOD(SALARY, 10) = 0;


-- ============================================
-- Q2.27
-- List employees whose names contain 'LL'
-- together
-- ============================================

SELECT *
FROM employees
WHERE ENAME LIKE '%LL%';


-- ============================================
-- Q2.28
-- List employees who joined in the 1980s
-- ============================================

SELECT *
FROM employees
WHERE HIREDATE >= '1980-01-01'
  AND HIREDATE < '1990-01-01';


-- ============================================
-- Q2.29
-- List employees who do not belong to Department 20
-- ============================================

SELECT *
FROM employees
WHERE DEPTNO <> 20;


-- ============================================
-- Q2.30
-- List all employees except PRESIDENT and MANAGER
-- in ascending order of Salary
-- ============================================

SELECT *
FROM employees
WHERE JOB NOT IN ('PRESIDENT', 'MANAGER')
ORDER BY SALARY ASC;


-- ============================================
-- Q2.31
-- List employees who joined before or after 1981
-- ============================================

SELECT *
FROM employees
WHERE EXTRACT(YEAR FROM HIREDATE) <> 1981;


-- ============================================
-- Q2.32
-- List employees whose Empno does not start
-- with digit 78
-- ============================================

SELECT *
FROM employees
WHERE CAST(EMPNO AS VARCHAR(10)) NOT LIKE '78%';


-- ============================================
-- Q2.33
-- List employees who are working under a Manager
-- ============================================

SELECT *
FROM employees
WHERE MGR IS NOT NULL;


-- ============================================
-- Q2.34
-- List employees who joined in any year but
-- not in the month of March
-- ============================================

SELECT *
FROM employees
WHERE EXTRACT(MONTH FROM HIREDATE) <> 3;


-- ============================================
-- Q2.35
-- List all Clerks of Department 20
-- ============================================

SELECT *
FROM employees
WHERE JOB = 'CLERK'
  AND DEPTNO = 20;


-- ============================================
-- Q2.36
-- List employees of Department 30 or 10
-- who joined in 1981
-- ============================================

SELECT *
FROM employees
WHERE DEPTNO IN (10, 30)
  AND HIREDATE >= '1981-01-01'
  AND HIREDATE < '1982-01-01';


-- ============================================
-- Q2.37
-- Display details of SMITH
-- ============================================

SELECT *
FROM employees
WHERE ENAME = 'SMITH';


-- ============================================
-- Q2.38
-- Display the location of SMITH
-- ============================================

SELECT D.LOCATION
FROM employees E
JOIN depts D
    ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME = 'SMITH';


-- ============================================
-- Q2.39
-- Display all employee information along with
-- Department Name and Location
-- ============================================

SELECT
    E.*,
    D.DNAME,
    D.LOCATION
FROM employees E
JOIN depts D
    ON E.DEPTNO = D.DEPTNO;


-- ============================================
-- Q2.40
-- Display Empno, Ename, Salary and Department Name
-- for Managers working in New York or Dallas,
-- with experience greater than 7 years,
-- without receiving Commission.
-- Sort in ascending order of Location.
-- ============================================

SELECT
    E.EMPNO,
    E.ENAME,
    E.SALARY,
    D.DNAME,
    D.LOCATION
FROM employees E
JOIN depts D
    ON E.DEPTNO = D.DEPTNO
WHERE E.JOB = 'MANAGER'
  AND D.LOCATION IN ('NEW YORK', 'DALLAS')
  AND EXTRACT(YEAR FROM CURRENT_DATE) -
      EXTRACT(YEAR FROM E.HIREDATE) > 7
  AND E.COMM IS NULL
ORDER BY D.LOCATION ASC;


-- ============================================
-- Q2.41
-- Display Empno, Ename, Salary, Dname, Location,
-- Deptno and Job for employees:
--
-- 1. Working in CHICAGO OR ACCOUNTING
-- 2. Annual Salary > 28000
-- 3. Salary is not 3000 or 2800
-- 4. Does not belong to a Manager
-- 5. Empno has digit 7 or 8 in the third position
-- 6. Order by Department Number ASC
-- 7. Then Job DESC
-- ============================================

SELECT
    E.EMPNO,
    E.ENAME,
    E.SALARY,
    D.DNAME,
    D.LOCATION,
    E.DEPTNO,
    E.JOB
FROM employees E
JOIN depts D
    ON E.DEPTNO = D.DEPTNO
WHERE (
        D.LOCATION = 'CHICAGO'
        OR D.DNAME = 'ACCOUNTING'
      )
  AND E.SALARY * 12 > 28000
  AND E.SALARY NOT IN (3000, 2800)
  AND E.MGR IS NOT NULL
  AND (
        SUBSTRING(CAST(E.EMPNO AS VARCHAR(10)), 3, 1) IN ('7', '8')
      )
ORDER BY E.DEPTNO ASC, E.JOB DESC;
