DECLARE
  cursor c_sal IS
    SELECT SALARY as arg FROM EMPLOYEES;
  v_sal c_sal%ROWTYPE;
  repe number(4);
  
BEGIN
  open c_sal;
  LOOP
  FETCH c_sal INTO v_sal;
  EXIT WHEN c_sal%NOTFOUND;
  if MOD(v_sal.arg,1000) != 0 THEN
    repe := TRUNC(v_sal.arg/1000) + 1;
  else
    repe := TRUNC(v_sal.arg/1000);
  end if;
  UPDATE employees SET ETOILES = rpad('*', repe, '*') WHERE SALARY = v_sal.arg;  
  END LOOP;
  close c_sal;
END;  
/


update employees set etoiles = NULL;
commit;



