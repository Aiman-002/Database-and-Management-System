set serveroutput on
--------------TASK1--------------------------
ACCEPT EMP_ID PROMPT  'ENTER THE EMPLOYEE_ID: '

DECLARE 

EMP_ID NUMBER := &EMP_ID;
EMP_SALARY NUMBER;
EMP_BONUS NUMBER;

BEGIN 

SELECT SALARY INTO EMP_SALARY FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = EMP_ID;

IF EMP_SALARY < 1000 THEN
   EMP_BONUS := 0.1 * EMP_SALARY;

ELSIF EMP_SALARY BETWEEN 1000 AND 1500 THEN
   EMP_BONUS := 0.15 * EMP_SALARY;

ELSIF EMP_SALARY > 1500 THEN
   EMP_BONUS := 0.2 * EMP_SALARY;
   
ELSIF EMP_SALARY IS NULL THEN
   EMP_BONUS := 0;   
     
END IF;   

DBMS_OUTPUT.PUT_LINE('Employee ID: ' || EMP_ID);
DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || EMP_SALARY);
DBMS_OUTPUT.PUT_LINE('Bonus Amount: ' || EMP_BONUS);
END;

--------------TASK2---------------------------
set serveroutput on

ACCEPT EMP_ID PROMPT  'ENTER THE EMPLOYEE_ID: '

DECLARE 

EMP_ID NUMBER := &EMP_ID;
EMP_SALARY NUMBER;
EMP_COM NUMBER;

BEGIN 

SELECT COMMISSION_PCT,SALARY 
INTO EMP_COM, EMP_SALARY 
FROM HR.EMPLOYEES 
WHERE EMPLOYEE_ID = EMP_ID;

   IF EMP_COM IS NULL THEN
   UPDATE HR.EMPLOYEES
   SET SALARY = SALARY + 100
   WHERE EMPLOYEE_ID = EMP_ID;   
        
    COMMIT;
        
DBMS_OUTPUT.PUT_LINE('Employee Salary updated for employee_id: ' || EMP_ID);

ELSE 

DBMS_OUTPUT.PUT_LINE('COMMISSION IS NOT NULL FOR EMPLOYEE_ID:  ' || EMP_ID);

END IF;
END;

--------------TASK3---------------------------
SET SERVEROUTPUT ON;

DECLARE
   dept_name VARCHAR2(50);  
   
   CURSOR dept_cursor IS
      SELECT DEPARTMENT_NAME
      FROM HR.DEPARTMENTS
      WHERE DEPARTMENT_ID = 30;  

BEGIN
   OPEN dept_cursor;
   FETCH dept_cursor INTO dept_name;  


      DBMS_OUTPUT.PUT_LINE('Department Name for deptno. 30 '  || ': ' || dept_name);

   CLOSE dept_cursor;
END;
--------------TASK4---------------------------

SET SERVEROUTPUT ON;

DECLARE
   deptno NUMBER :=  20; 
   E_salary NUMBER;

BEGIN
  
   FOR EMP_RECORD IN (SELECT salary FROM HR.employees WHERE department_id = deptno) LOOP
      E_salary := EMP_RECORD.salary; 

     
      IF E_salary IS NOT NULL THEN
         DBMS_OUTPUT.PUT_LINE('Salary of an employee in deptno ' || deptno || ': ' || E_salary);
         EXIT;  
      END IF;
   END LOOP;

 
   IF E_salary IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('No employees found in deptno ' || deptno);
   END IF;
END;

--------------TASK5---------------------------

SET SERVEROUTPUT ON;

ACCEPT EMP_ID PROMPT  'ENTER THE EMPLOYEE_ID: '

DECLARE
   EMP_ID NUMBER := &EMP_ID;
   v_salary NUMBER; 

BEGIN
 
   SELECT SALARY INTO v_salary FROM HR.EMPLOYEES WHERE EMPLOYEE_ID = EMP_ID;

   IF v_salary IS NOT NULL THEN
      v_salary := v_salary * 1.10;  

     
      UPDATE EMPLOYEES
      SET salary = v_salary
      WHERE EMPLOYEE_ID = EMP_ID;

      COMMIT;

      DBMS_OUTPUT.PUT_LINE('Salary updated for Employee ID ' || EMP_ID);
   ELSE
      DBMS_OUTPUT.PUT_LINE('Employee not found for Employee ID ' || EMP_ID);
   END IF;
END;
--------------TASK6---------------------------



















