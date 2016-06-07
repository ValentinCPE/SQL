CREATE OR REPLACE PROCEDURE DEPSANSEMP IS
CURSOR c_
v_result d.departement_id,d.departement_name%ROWTYPE;
BEGIN
SELECT d.department_id , d.department_name
FROM departments d
WHERE d.department_id NOT IN (SELECT DISTINCT NVL(e.department_id , 0) FROM employees e) 
ORDER BY department_id DESC ;
END;
/