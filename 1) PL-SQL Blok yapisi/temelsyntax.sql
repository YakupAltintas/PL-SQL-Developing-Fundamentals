--��inde bulundu�umuz g�n� yazan program� unamed ve namedprogram ile yazal�m
--UNAMED BLOCK
-- konsol ��kt�s�na izin verir
SET SERVEROUTPUT ON;

DECLARE
--bu b�l�me de�i�ken tan�mlamas� yap�l�r
    WGun VARCHAR2(50);
BEGIN
--Bu b�l�mde kodlama yap�l�r
    WGun := To_Char(SYSDATE,'DAY');
    dbms_output.put_l�ne('Bu g�n '||WGun);
END;
/
--NAMED BLOCK(Fonksiyonlarla yap�l�r)
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
    dbms_output.put_l�ne('Bu g�n '|| GET_DAY_NAME(SYSDATE));
END;



