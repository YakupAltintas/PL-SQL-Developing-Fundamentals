--Ýçinde bulunduðumuz günü yazan programý unamed ve namedprogram ile yazalým
--UNAMED BLOCK
-- konsol çýktýsýna izin verir
SET SERVEROUTPUT ON;

DECLARE
--bu bölüme deðiþken tanýmlamasý yapýlýr
    WGun VARCHAR2(50);
BEGIN
--Bu bölümde kodlama yapýlýr
    WGun := To_Char(SYSDATE,'DAY');
    dbms_output.put_lýne('Bu gün '||WGun);
END;
/
--NAMED BLOCK(Fonksiyonlarla yapýlýr)
CREATE OR REPLACE FUNCTION GET_DAY_NAME(P_TARIH IN DATE)
RETURN VARCHAR2
IS

BEGIN
    RETURN(TO_CHAR(P_TARIH,'DAY'));
END;
/

SELECT * FROM USER_ERRORS WHERE NAME = 'GET_DAY_NAME';
SELECT GET_DAY_NAME(SYSDATE) FROM DUAL;

BEGIN
    dbms_output.put_lýne('Bu gün '|| GET_DAY_NAME(SYSDATE));
END;



