CREATE OR REPLACE PROCEDURE ngrossal(p_n NUMBER) IS
CURSOR c_grossal(n NUMBER) IS
	SELECT last_name , first_name, salary
	FROM employees
	WHERE ROWNUM <= n
	ORDER BY salary DESC , last_name , first_name ;
BEGIN

	FOR v_grossal IN c_grossal(p_n) LOOP
		DBMS_OUTPUT.PUT_LINE(v_grossal.last_name || '         ' || '         ' || v_grossal.first_name || '         ' || '         ' || v_grossal.salary) ;		
	END LOOP ;
END ;
/

EXEC ngrossal(8) ;