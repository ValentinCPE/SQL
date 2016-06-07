CREATE OR REPLACE PROCEDURE salplus(p_nameJob employees.last_name%TYPE , p_nameSal employees.last_name%TYPE) IS
CURSOR c_salplus(p_job employees.job_id%TYPE , p_sal employees.salary%TYPE) IS
	SELECT last_name , first_name
	FROM employees
	WHERE job_id = p_job
	OR salary > p_sal
	ORDER BY last_name , first_name ;
v_job employees.job_id%TYPE ;
v_sal employees.salary%TYPE ;
BEGIN
	SELECT job_id INTO v_job
	FROM employees 
	WHERE last_name = p_nameJob ;
	
	SELECT salary INTO v_sal
	FROM employees 
	WHERE last_name = p_nameSal ;	

	DBMS_OUTPUT.PUT_LINE('job: ' || v_job || ' ou salaire > à ' || v_sal) ;

	FOR v_salplus IN c_salplus(v_job , v_sal) LOOP
		DBMS_OUTPUT.PUT_LINE(v_salplus.last_name || CHR(9) || CHR(9) || v_salplus.first_name) ;		
	END LOOP ;

END ;
/

EXEC salplus('Abel' , 'Feeney') ;
set serveroutput on;