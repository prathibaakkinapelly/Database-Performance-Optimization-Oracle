SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
WHERE e.salary > 50000;

EXPLAIN PLAN FOR
SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
WHERE e.salary > 50000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);


SELECT index_name, table_name
FROM user_indexes
WHERE table_name = 'EMPLOYEE';


EXEC DBMS_STATS.GATHER_TABLE_STATS(USER,'EMPLOYEE');
EXEC DBMS_STATS.GATHER_TABLE_STATS(USER,'DEPARTMENT');


EXPLAIN PLAN FOR
SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
WHERE e.salary > 50000;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

-- ADVANCED QUERY SCENARIOS

-- JOIN vs SUBQUERY
SELECT e.emp_name, d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
WHERE e.salary > 50000;

SELECT emp_name
FROM employee
WHERE dept_id IN (
  SELECT dept_id FROM department
)
AND salary > 50000;

-- EXISTS vs IN
SELECT emp_name
FROM employee
WHERE dept_id IN (
  SELECT dept_id FROM department
);

SELECT emp_name
FROM employee e
WHERE EXISTS (
  SELECT 1
  FROM department d
  WHERE d.dept_id = e.dept_id
);

-- WHERE vs HAVING
SELECT dept_id, COUNT(*)
FROM employee
WHERE salary > 50000
GROUP BY dept_id;

SELECT dept_id, COUNT(*)
FROM employee
GROUP BY dept_id
HAVING AVG(salary) > 50000;

-- INDEX HINT
SELECT /*+ INDEX(employee idx_emp_salary) */
emp_name
FROM employee
WHERE salary > 50000;

-- FULL TABLE SCAN
SELECT /*+ FULL(employee) */
emp_name
FROM employee
WHERE salary > 50000;
