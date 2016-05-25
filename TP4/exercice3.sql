CREATE TABLE departments AS SELECT * FROM HR.DEPARTMENTS;

DECLARE
  CURSOR c_dept IS
    SELECT department_id, department_name FROM departments WHERE department_id < 100 ORDER BY department_id;
  CURSOR c_empl(deptnum NUMBER) IS
    SELECT last_name, job_id, hire_date, salary FROM employees WHERE employee_id < 120 AND department_id = deptnum;
BEGIN
  FOR v_dept IN c_dept LOOP
    DBMS_OUTPUT.PUT_LINE('Numero Departement: ' || rpad(v_dept.department_id, 3) || ' Nom Departement: ' || v_dept.department_name);
    FOR v_emp IN c_empl(v_dept.department_id) LOOP
      DBMS_OUTPUT.PUT_LINE(rpad(v_emp.last_name, 15) || rpad(v_emp.job_id, 10) || to_char(v_emp.hire_date, 'DD/MM/YY') || ' ' || v_emp.salary);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
  END LOOP;
END;