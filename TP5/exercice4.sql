create or replace procedure nomplusgagnant(nom EMPLOYEES.LAST_NAME%type) IS
v_total employees.SALARY%type;
v_salairenom employees.SALARY%type;
cursor c_sal IS
  SELECT SALARY AS sal, LAST_NAME AS nomplus, COMMISSION_PCT AS comm FROM EMPLOYEES;
v_sal c_sal%ROWTYPE;
cursor c_nom IS
  SELECT SALARY AS salairecherche, LAST_NAME AS nomrecherche from EMPLOYEES where LAST_NAME=nom; 
  v_salairecherche c_nom%ROWTYPE;

BEGIN

  Open c_nom;
  open c_sal;
  LOOP 
  FETCH c_nom into v_salairecherche;
  EXIT WHEN c_nom%NOTFOUND;
  v_salairenom := v_salairecherche.salairecherche;
   LOOP
   FETCH c_sal into v_sal;
   EXIT WHEN c_sal%NOTFOUND;
   
   if v_sal.comm is not null then
    v_total := v_sal.sal * v_sal.comm ;
  else
      v_total := v_sal.sal;
  end if; 
  
   if v_total > v_salairenom THEN
    DBMS_OUTPUT.PUT_LINE(v_sal.nomplus);
   END IF;
   END LOOP;
   END LOOP;
   close c_sal;
   close c_nom;
  END;
  /
  
  EXEC nomplusgagnant('Taylor');