CREATE TABLE department (
  dept_id   NUMBER PRIMARY KEY,
  dept_name VARCHAR2(50) NOT NULL
);


CREATE TABLE employee (
  emp_id   NUMBER PRIMARY KEY,
  emp_name VARCHAR2(50) NOT NULL,
  salary   NUMBER(10,2),
  dept_id  NUMBER,
  CONSTRAINT fk_emp_dept
    FOREIGN KEY (dept_id)
    REFERENCES department(dept_id)
);
