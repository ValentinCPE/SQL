CREATE OR REPLACE PROCEDURE geneliste IS
emp12 EMPLOYEES%ROWTYPE;
BEGIN
  SELECT * INTO emp12 FROM EMPLOYEES;
  DBMS_OUTPUT.PUT_LINE(emp12.LAST_NAME);
END;  