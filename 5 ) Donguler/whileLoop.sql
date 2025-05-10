set SERVEROUTPUT ON;
DECLARE
    sayac number := 0;
BEGIN
    WHILE sayac < 10 LOOP
        dbms_output.put_line(sayac);
        sayac := sayac + 1;
    END LOOP; 
END;