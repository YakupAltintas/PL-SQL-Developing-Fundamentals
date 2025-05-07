
--departments tablosundan department_id si 10 olan kay�tlar� listeleyelim
-- Bu yol ileride tablo varchar2(30) yerine varchar2(50) yazarsak kod hata verir
DECLARE  
    wdepartment_id NUMBER(4);
    wdepartment_name VARCHAR2(30);
    wmanager_id NUMBER(6);
    wlocation_id NUMBER(4);
BEGIN
    SELECT * INTO wdepartment_id,wdepartment_name,wmanager_id,wlocation_id FROM DEPARTMENTS WHERE department_id = 10;
    
    dbms_output.put_l�ne(wdepartment_id||' '||wdepartment_name || ' ' || wmanager_id || ' ' || wlocation_id);
END;

--%type  ile de�i�kenlerimizin tipini kolonun veri tipine e�itledik
DECLARE  
    wdepartment_id departments.department_id%TYPE;
    wdepartment_name departments.department_name%TYPE;
    wmanager_id departments.manager_id%TYPE;
    wlocation_id departments.location_id%TYPE;
BEGIN
    SELECT * INTO wdepartment_id,wdepartment_name,wmanager_id,wlocation_id FROM DEPARTMENTS WHERE department_id = 10;
    
    dbms_output.put_l�ne(wdepartment_id||' '||wdepartment_name || ' ' || wmanager_id || ' ' || wlocation_id);
END;

--- %rowtype ile verileri tablo olarak al�r�z ve tablo kolonlar�yla �a��r�r�z
DECLARE  
    rdepts departments%ROWTYPE;
BEGIN
    SELECT * INTO rdepts FROM DEPARTMENTS WHERE department_id = 10;

    dbms_output.put_l�ne(rdepts.department_id||' '||rdepts.department_name || ' ' || rdepts.manager_id || ' ' || rdepts.location_id);
END;