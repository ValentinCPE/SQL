set serveroutput on;

--SELECT sum(sal),DEPT.DNAME from DEPT,EMP where DEPT.DEPTNO=EMP.DEPTNO group by DEPT.DEPTNO,DNAME;


ALTER TABLE DEPT add Budget number(10,2);

Declare
  Cursor c_budget is
    select sum(sal) as budget from emp
    group by deptno;
  v_budget c_budget%ROWTYPE;
begin
  open c_budget;
  loop
    fetch c_budget into v_budget;
    Exit WHEN c_budget%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_budget.budget);
  END LOOP;
  CLOSE c_budget;
END;   

/////////////////////////////////////////////////

DECLARE
  Cursor c_budget IS 
    SELECT SAL as truc, DEPT.LOC from DEPT,EMP where DEPT.DEPTNO=EMP.DEPTNO and (DEPT.LOC = 'DALLAS' or DEPT.LOC = 'NEW YORK');
  v_budget c_budget%ROWTYPE;
  
BEGIN
  OPEN c_budget;
  LOOP
    FETCH c_budget INTO v_budget;
    EXIT WHEN c_budget%NOTFOUND;
    UPDATE DEPT SET BUDGET=v_budget.truc * 1.1;
  END LOOP;
  CLOSE c_budget;
END;

///////////////////////////////////////////////////

DECLARE
  Cursor c_budget IS 
    SELECT SAL as truc from EMP order by SAL desc;
  v_budget c_budget%ROWTYPE;
  salaire number(2);
  i number(2);
  
BEGIN
  OPEN c_budget;
  salaire := &salaire;
  i := 0;
  while i < salaire
  LOOP
    FETCH c_budget INTO v_budget;
    EXIT WHEN c_budget%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_budget.truc);
    i := i + 1;
  END LOOP;
  CLOSE c_budget;
END;