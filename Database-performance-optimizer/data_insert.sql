BEGIN
  FOR i IN 108..101107 LOOP
    INSERT INTO employee (
      emp_id,
      emp_name,
      salary,
      dept_id
    ) VALUES (
      i,
      'EMP'||i,
      DBMS_RANDOM.VALUE(15000,90000),
      MOD(i-1,5)+1
    );
  END LOOP;
  COMMIT;
END;
/
SELECT COUNT(*) FROM employee;