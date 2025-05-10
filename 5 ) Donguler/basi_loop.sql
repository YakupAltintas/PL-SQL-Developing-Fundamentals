set SERVEROUTPUT ON;

DECLARE
    sayac NUMBER := 0;
BEGIN
    LOOP
        sayac := nvl(sayac, 0) + 1;--sayaci 1 arttir
        CONTINUE WHEN sayac = 98;--sayac 98 oldugunda asagidaki islemleri yapmadan loopun basinas dön
        EXIT WHEN sayac = 100;-- sayac 100 oldugunda loop'u bitir
        /*IF sayac = 100 then --if kullanilarak loop bitirme kodu 
        EXIT;
        END IF;*/
        dbms_output.put_line(sayac);
    END LOOP;
END;
/