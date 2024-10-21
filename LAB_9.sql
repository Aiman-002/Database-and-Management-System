--Q1
SET SERVEROUT ON
DECLARE
    MAN_ID hr.DEPARTMENTS.MANAGER_ID%TYPE;
    DEP_NAME HR.DEPARTMENTS.DEPARTMENT_NAME%TYPE;
    CURSOR DEP_DATA IS 
        SELECT MANAGER_ID, DEPARTMENT_NAME FROM HR.DEPARTMENTS;
BEGIN
    OPEN DEP_DATA;
    LOOP
        FETCH DEP_DATA INTO MAN_ID, DEP_NAME;
        EXIT WHEN DEP_DATA%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('MANAGER_ID: ' || MAN_ID || ' DEPARTMENT NAME: ' || DEP_NAME);
    END LOOP;
    CLOSE DEP_DATA;
END;
--Q2
DECLARE
    EMP_ID HR.EMPLOYEES.EMPLOYEE_ID%TYPE;
    FNAME HR.EMPLOYEES.FIRST_NAME%TYPE;
    LNAME HR.EMPLOYEES.LAST_NAME%TYPE;
    SALARY HR.EMPLOYEES.SALARY%TYPE;
    CURSOR EMPLOYEE_DATA IS SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM HR.EMPLOYEES WHERE SALARY>5000;
BEGIN
    OPEN EMPLOYEE_DATA; 
    LOOP
        FETCH EMPLOYEE_DATA INTO EMP_ID, FNAME, LNAME, SALARY;
        EXIT WHEN EMPLOYEE_DATA%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('EMPLOYEE_ID: ' || EMP_ID || ' FIRST NAME: ' || FNAME || ' LAST NAME: ' || LNAME || ' SALARY: ' || SALARY);
    END LOOP;
    CLOSE EMPLOYEE_DATA; 
END;
--Q3

CREATE OR REPLACE PROCEDURE updatesal(empno IN NUMBER) AS
  new_salary NUMBER;
BEGIN
  SELECT salary * 1.1 INTO new_salary
  FROM hr.employees
  WHERE employee_id = empno;
  DBMS_OUTPUT.PUT_LINE('new salary: ' ||new_salary);
  --UPDATE hr.employees
  --SET salary = new_salary
 -- WHERE employee_id = p_empno;
 -- COMMIT;
END updatesal;
exec updatesal(100);
--Q4
CREATE OR REPLACE PROCEDURE addbonus(deptno IN NUMBER) AS
BEGIN
  UPDATE employees
  SET salary = salary + 1000
  WHERE department_id = deptno
  AND salary > 5000;

END addbonus;
/




