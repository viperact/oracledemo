SELECT first_name
FROM employees;

-- 주석처리

-- 도구 > 환경설정 > 코드편집기 > 글꼴 > 크기조정

-- CTRL + Enter : 실행
SELECT * FROM employees;
SELECT * FROM tab; -- 테이블검색 (SELECT)

/*
컬럼명, 테이블명에 별칭(alias)을 지정할 수 있다
별칭(alias)에 공백이 있을 때는 " "(쌍따옴표)를 지정한다.
*/

SELECT salary, salary*10 AS bonus -- select 다음은 컬럼명 , AS = alias값 설정
FROM employees; -- From 다음엔 table명

SELECT salary, salary*10 AS "b o n u s" 
FROM employees;

--king님의 급여는 24000입니다.
SELECT last_name || '님의 급여는 ' || salary || '입니다.' AS name
FROM employees;

--DISTINCT 는 중복제거를 한 후 출력해 주는 명령어이다.
SELECT DISTINCT first_name
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;


/*
first_name  last_name
sunder       Abel
sunder       Abel
sunder       Ande
*/

/*
-- SELECT 입력순서
SELECT column_name1, column_name2
FROM table_name
WHERE column_name = 'value'
GROUP BY column_name
HAVING column_name = 'value'
ORDER BY column_name ASC, column_name DESC; 

-- SELECT 해석 순서

FROM table_name
WHERE column_name = 'value'
GROUP BY column_name
HAVING column_name = 'value'
SELECT column_name1, column_name2
ORDER BY column_name ASC, column_name DESC;
*/

-- employees 테이블에서 salary의 값이 3000미만 일때
-- first_name, salary를 출력하라.
-- WHERE 는 논리값 (true, false)
SELECT first_name, salary
FROM employees
WHERE salary < 3000;

-- employees 테이블에서 first_name 컬럼의 값이 'David' 일때의
-- first_name, salary를 출력하라.
SELECT first_name, salary
FROM employees
WHERE first_name = 'David';

-- employees 테이블에서 first_name 컬럼의 값이 'David' 아닐때의
-- first_name, salary를 출력하라.
-- 아닐때 : != , <>
SELECT first_name, salary
FROM employees
WHERE first_name != 'David';

SELECT first_name, salary
FROM employees
WHERE first_name <> 'David';

--&&(and), ||(or)
--employees 테이블에서 salary가 3000, 9000, 17000일때
--first_name, hire_date, salary를 출력하라
SELECT first_name, hire_date, salary
FROM employees
WHERE salary = 3000 OR salary = 9000 OR salary = 17000;

-- 컬럼값이 똑같을때 IN 연산자사용 가능
SELECT first_name, hire_date, salary
FROM employees
WHERE salary IN(3000, 9000, 17000);

--employees 테이블에서 salary값이 3000부터 5000까지 일때의
--first_name, hire_date, salary를 출력하라
SELECT first_name, hire_date, salary
FROM employees
WHERE salary >= 3000 AND salary <= 5000;

--해당 값이 포함될때 (이상, 이하일때) 컬럼값 BETWEEN A AND B;
SELECT first_name, hire_date, salary
FROM employees
WHERE salary BETWEEN 3000 AND 5000;

--employeesx 테이블에서 job_id가 'IT_PROG'이 아닐때
--first_name, email, job_id를 출력하라.
SELECT first_name, email, job_id
FROM employees
WHERE job_id != 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id <> 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE job_id ^= 'IT_PROG';

SELECT first_name, email, job_id
FROM employees
WHERE NOT (job_id = 'IT_PROG');

--employees 테이블에서 salary가 3000, 9000, 17000이 아닐때의
--first_name, hire_date, salary를 출력하라
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary = 3000 OR salary = 9000 OR salary = 17000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT IN(3000, 9000, 17000);

--employees 테이블에서 salary값이 3000부터 5000까지가 아닐때의
--first_name, hire_date, salary를 출력하라
SELECT first_name, hire_date, salary
FROM employees
WHERE NOT (salary >= 3000 AND salary <= 5000);

SELECT first_name, hire_date, salary
FROM employees
WHERE salary NOT BETWEEN 3000 AND 5000;

--employees 테이블에서 commission_pct의 값이 null일때
--first_name, salary, commission_pct를 출력하라
--null값을 출력할땐 IS NULL
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NULL;

--employees 테이블에서 commission_pct의 값이 null이 아닐때
--first_name, salary, commission_pct를 출력하라
--null값이 아닌값을 출력할때 = IS NOT NULL
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

--employees 테이블에서 first_name에 'der'이 포함이된 경우
--fisrt_name, salary, email을 출력하라.
-- %: 자바에서의 *과 같음 / LIKE '%der%' = der이 포함이된 '%der' = 뒷자리가 der로 끝나는 
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE '%der%';

--employees 테이블에서 first_name의 값중 'A'로 시작하고
--두번째 문자는 임의 문자이면 'exander'로 끝나는
--first_name, salary, email을 출력하라
-- _ : 임의의 문자 한자리
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';

/*
WHERE절에서 사용된 연산자 3가지 종류
1. 비교연산자 : = , > , >= , < , <= , != , <> , ^=
2. SQL연산자 : BETWEEN a AND b, IN, LIKE, IS NULL
3. 논리연산자 : ADN, OR, NOT

우선순위
1. 괄호()
2. NOT 연산자
3. 비교연산자, SQL연산자
4. AND
5. OR
*/

--employees 테이블에서 job_id를 오름차순으로
--first_name, email, job_id를 출력하시오.
SELECT first_name, email, job_id
FROM employees
ORDER BY job_id ASC;

--ASC 생략가능
SELECT first_name, email, job_id
FROM employees
ORDER BY job_id;

--employees 테이블에서 job_id를 오름차순으로,
--first_name을 내림차순으로
--department_id, first_name, salary를 출력하시오
--department_id ASC 값이 같을때만 first_name DESC적용
SELECT department_id, first_name, salary
FROM employees
ORDER BY department_id ASC, first_name DESC;

--employees테이블에서 가장 최근 입사 순으로
--사원의 first_name, salary, hire_date(입사날짜)를 출력하시오.
SELECT first_name, salary, hire_date
FROM employees
ORDER BY hire_date DESC;

--employees 테이블에서 업무(job_id)가 'FI_ACCOUNT'인 사원들의
--급여(salary)가 높은순으로 first_name, job_id, salary를 출력하시오
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'FI_ACCOUNT'
ORDER BY salary DESC;


/*=========================================
집합연산자(Set Operations)
===========================================*/

-둘 이상의 query결과를 하나의 결과로 조합한다.
-select의 인자 갯수가 같아야 한다.
  첫번째 select가 2개이면 두번째 select도 2개여야 한다.
-타입이 일치해야 한다.  
 예를 들어 character이면 character이여야 한다.

집합연산자 종류
union(합집합)- 중복행이 제거된 두 query
union all(합집합)-중복행이 포함된 두 query행
intersect(교집합)-두 query에 공통적인 행
minus(차집합)-첫번째 query에 있는 행 중 두번째 query에 없는 행표시

집합연산자 사용이유
-서로 다른 테이블에서 유사한 형태의 결과를 반환하기 위해서
-서로 같은 테이블에서 서로 다른 질의를 수행하여 결과를 합치기 위해서
 
--================================================================== 

--union (합집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=40
UNION
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=60;


--union all(합집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=40
UNION ALL
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=60;


--intersect(교집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=40
INTERSECT
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=60;


--minus(=except)(차집합)
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=40
MINUS
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id=20 OR department_id=60;




















