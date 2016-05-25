CREATE OR REPLACE PROCEDURE MODIF_JOB(idp varchar2,nint varchar2) IS
vide JOBS%ROWTYPE;
BEGIN
  SELECT * INTO vide from JOBS where JOB_ID=idp;
  UPDATE JOBS SET JOB_ID = nint  where JOB_ID=idp;
    EXCEPTION
      WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('aucune mise à jour n’a eu lieu');
END;
/


EXEC MODIF_JOB('VR_CHANGE','INF_VAL');

