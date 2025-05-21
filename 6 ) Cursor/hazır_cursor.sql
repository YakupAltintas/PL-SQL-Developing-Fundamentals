set SERVEROUTPUT ON;

-- sql%found yapılan işlem sonucu herhangi bir satır geri döndürüldü mü ya da kaç kayıt etkilendiğini kontrol etmek için kullanılır.
--sql%notfount yapılan işlem sonucu birşey dönmediyse çalışır.
-- sql%rowcount ise yapılan işlem sonucu etkilenen satır sayısını verir.    
-- sql%rowcount, sql%found ve sql%notfound kullanımı
-- 1. Örnek update işlemi
DECLARE
    row_emp EMPLOYEES2%ROWTYPE;
BEGIN  
    UPDATE EMPLOYEES2 set SALARY = SALARY * 1.10 where DEPARTMENT_ID = 50;

    if sql%found then
        dbms_output.put_line(sql%ROWCOUNT || ' kayit guncellendi');
    else
        dbms_output.put_line('Guncellenen kayit yok');
    end if;
end;
/
-- 2. Örnek delete işlemi
DECLARE
    row_emp EMPLOYEES2%ROWTYPE;
BEGIN
    DELETE FROM EMPLOYEES2 where DEPARTMENT_ID IN(100,80);

    if sql%found then
        dbms_output.put_line(sql%ROWCOUNT || ' kayit silindi');
    else
        dbms_output.put_line('Silinen kayit yok');
    end if;
end;

-- 3. Örnek select işlemi
DECLARE 
    rec_emp employees2%rowtype;
BEGIN
    SELECT * INTO rec_emp FROM employees2 WHERE  employee_id =100;
    
    if SQL%FOUND then
        dbms_output.put_line('Kayit var ' || 'kayit sayisi: ' || SQL%ROWCOUNT);
    else 
        dbms_output.put_line('Kayit yok');
    end if;
    
    exception when no_data_found then
        dbms_output.put_line('Kayit yok 2');

END;
