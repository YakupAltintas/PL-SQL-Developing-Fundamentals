set SERVEROUTPUT ON;
-- cursor open işe açılır
-- cursor close ile kapatılır


DECLARE
CURSOR c_select_emp IS   SELECT EMPLOYEE_ID,LAST_NAME  from EMPLOYEES2;
    wemployee_id employees.employee_id%TYPE;
    wemployee_last_name employees.first_name%TYPE;
BEGIN
    if not c_select_emp%ISOPEN then--kursor açik mi, degil ise ac
        OPEN c_select_emp;-- cursor'i aç
    END IF;
    LOOP
        FETCH c_select_emp INTO wemployee_id, wemployee_last_name;-- cursor'dan veri al
        EXIT WHEN c_select_emp%NOTFOUND or c_select_emp%ROWCOUNT > 10;-- cursor'da veri kalmadiginda cik ya da 10 kayit alindiginda cik
        DBMS_OUTPUT.PUT_LINE('Satir Sayisi : ' ||c_select_emp%ROWCOUNT|| ' Employee ID: ' || wemployee_id || ' Employee Name: ' || wemployee_last_name);
    END LOOP;
    if c_select_emp%ISOPEN then-- cursor açık mi
        CLOSE c_select_emp;-- cursor'i kapat
    END IF;

END;
/

--ayni kodun farkli ve kisa bir yazimi
DECLARE
CURSOR c_select_emp IS   SELECT EMPLOYEE_ID,LAST_NAME  from EMPLOYEES2;
    wrow_emp c_select_emp%ROWTYPE;--cursordan gelen verleri tutacak bir degisken tanimla
BEGIN
    if not c_select_emp%ISOPEN then--kursor açik mi, degil ise ac
        OPEN c_select_emp;-- cursor'i aç
    END IF;
    LOOP
        FETCH c_select_emp INTO wrow_emp;-- cursor'dan veri al
        EXIT WHEN c_select_emp%NOTFOUND;-- cursor'da veri kalmadiginda cik
        DBMS_OUTPUT.PUT_LINE('Satir Sayisi : ' ||c_select_emp%ROWCOUNT|| ' Employee ID: ' || wrow_emp.employee_id || ' Employee Name: ' || wrow_emp.Last_Name);
    END LOOP;
    if c_select_emp%ISOPEN then-- cursor açık mi
        CLOSE c_select_emp;-- cursor'i kapat
    END IF;

END;
/