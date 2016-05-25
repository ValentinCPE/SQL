DECLARE
  v_fact NUMBER;
  i NUMBER;
  resultat NUMBER;
 BEGIN
  v_fact := &id;
  i := 1;
  resultat := 1;
  LOOP
    resultat := resultat * i;
    i := i + 1;
  EXIT WHEN v_fact < i;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('La factorielle de '||v_fact||' est '||resultat);
 END;
 /
