CREATE INDEX idx_emp_salary ON employee(salary);
CREATE INDEX idx_emp_dept   ON employee(dept_id);

SELECT index_name, table_name
FROM user_indexes
WHERE table_name = 'EMPLOYEE';