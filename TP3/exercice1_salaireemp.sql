DECLARE
  moySal emp.sal%TYPE;
  empnum emp.empno%TYPE;
  nomjob EMP.JOB%TYPE;
  esal EMP.sal%TYPE;
BEGIN
  empnum := &id;
  select JOB into nomjob from emp where empno = empnum;
  select avg(sal) into moySal FROM emp WHERE nomjob = JOB;
  DBMS_OUTPUT.PUT_LINE('Salaire moyen :' || moySal);
  select sal into esal from emp where empno=empnum;
  
  if esal < moySal then
   UPDATE emp set sal = moySal where empno=empnum;
   commit;
  else
   UPDATE emp set sal = sal*1.1 where empno=empnum;
   commit;
  end if; 
END;
