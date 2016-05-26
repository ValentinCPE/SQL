set serveroutput on;

CREATE OR REPLACE PROCEDURE generliste AS
  CURSOR c_emp IS
  SELECT * FROM EMPLOYEES;
  CURSOR c_man (man NUMBER) IS
  SELECT FIRST_NAME FROM EMPLOYEES WHERE EMPLOYEE_ID=man;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Nom de famille' || ' | ' || 'Prénom' || '    |    ' || 'Chef');
  DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
  FOR v_emp IN c_emp LOOP
  FOR v_man IN c_man(v_emp.MANAGER_ID) LOOP
  DBMS_OUTPUT.PUT_LINE('   ' || v_emp.FIRST_NAME || '   |    ' || v_emp.LAST_NAME || '     |    ' || v_man.FIRST_NAME);
  END LOOP;
 END LOOP; 
END;  

EXEC generliste();