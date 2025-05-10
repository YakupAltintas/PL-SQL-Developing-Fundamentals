set SERVEROUTPUT on;
-- for loop
DECLARE

BEGIN
    FOR sayac IN 1..5 LOOP --1'den 5'e kadar sayac� arttirir
        dbms_output.put_l�ne(sayac);
    END LOOP;

END;
/

--TERS FOR LOOP 5 ten basladi 1 e kadar saydi
DECLARE

BEGIN
    FOR sayac IN REVERSE 1..5 LOOP --1'den 5'e kadar sayac� arttirir
        dbms_output.put_l�ne(sayac);
    END LOOP;

END;
/

-- departments tablosundaki verileri for loop yard�m� ile okuyal�m
DECLARE

BEGIN
    FOR kayit IN  (SELECT department_id,department_name from departments) LOOP 
        dbms_output.put_l�ne('bolum no :'|| kayit.department_id || '   bolum adi :' || kayit.department_name);
    END LOOP;

END;
/
--i� i�e for kullanarak departments tablosundaki verilerle employees tablosundaki verilerileri iliskilendirip elemanlar� yazdiralim
DECLARE

BEGIN
    FOR kayit IN  (SELECT department_id,department_name from departments order by 1) LOOP 
         dbms_output.put_line(' ');
        dbms_output.put_line('bolum no :'|| kayit.department_id || '   bolum adi :' || kayit.department_name);
        FOR eleman IN (SELECT employee_id,first_name,last_name FROM employees WHERE department_id = kayit.department_id order by employee_id) LOOP
            dbms_output.put_l�ne('Eleman No :'|| eleman.employee_id || '   Adi :' || eleman.first_name|| '   Soyadi :' || eleman.last_name);
        END LOOP;
    END LOOP;

END;
