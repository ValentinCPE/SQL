DECLARE
  cursor c_nom IS 
    SELECT ENAME as nam FROM EMP;
  v_nom c_nom%ROWTYPE;
  
  cursor c_com IS 
    SELECT COMM as comi FROM EMP;
  v_com c_com%ROWTYPE;
  
BEGIN
  open c_nom;
  open c_com;
  LOOP
    FETCH c_nom INTO v_nom;
    FETCH c_com INTO v_com;
    EXIT WHEN c_nom%NOTFOUND;
    if v_com.comi IS NULL or v_com.comi=0 THEN
      DBMS_OUTPUT.PUT_LINE('Lemployé '||v_nom.nam||' n a pas de commission');
    else
      DBMS_OUTPUT.PUT_LINE('Lemployé '||v_nom.nam||' a une commission de '||v_com.comi||' dollars');
    end if;
   end loop;
   close c_nom;
   close c_com;
END;

