set serveroutput on;


DECLARE
  i NUMBER(3);
  v_choix NUMBER(1);
  TYPE mon_tableau IS VARRAY(10) OF NUMBER(3);
  resultat1 mon_tableau := mon_tableau(0,0,0,0,0,0,0,0,0,0);
  resultat2 mon_tableau := mon_tableau(0,0,0,0,0,0,0,0,0,0);
BEGIN

  i := 1;
  v_choix := &id;
  
  FOR i in 1..10 LOOP
    resultat2(i) := v_choix * i;
    resultat1(i) := i;
 
  END LOOP;
  

  FOR i in 1..10 LOOP
  DBMS_OUTPUT.PUT_LINE(resultat1(i)||' '||resultat2(i));
  END LOOP;
END;
/