
-- PL/SQL içinde SQL komutlarinin kullanimi(static sql - DML - Savepoint - TCL)

-- çýktý almamýza yarýyor
set SERVEROUTPUT on;
DECLARE
    emp_id         employees2.employee_id%TYPE;
    emp_first_name employees2.first_name%TYPE := 'yakup';
    emp_last_name  employees2.last_name%TYPE  := 'Altintaþ';
    emp_job_id     employees2.job_id%TYPE     := 'PL/SQL';
    emp_hire_date  employees2.hire_date%TYPE  := SYSDATE;
    emp_email      employees2.email%TYPE      := 'xyz@123.com';
BEGIN
    -- ID belirleme -> otomotik arttýrma iþlemidir
    SELECT NVL(MAX(employee_id), 0) + 1 INTO emp_id FROM employees2;
    
    --Savepoint githubdaki commitlere benzer isaret birakir rollback ile geri donulebilir.
    SAVEPOINT A;
    
    -- INSERT -> id yi yukarýda belirlemiþtik simdi de verileri yerine koyup ekleyelim
    INSERT INTO employees2 (employee_id, first_name, last_name, job_id, email, hire_date) 
    VALUES (emp_id, emp_first_name, emp_last_name, emp_job_id, emp_email, emp_hire_date);
    
    SAVEPOINT B;
    
    -- UPDATE -> kaydin job_id sini güncelledik
    UPDATE employees2 
    SET job_id = 'DBA' 
    WHERE employee_id = emp_id;
    
    SAVEPOINT C;
    
    -- DELETE ve RETURNING -> kaydi sildik
   /* 
   DELETE FROM employees2 
    WHERE employee_id = emp_id 
    RETURNING employee_id, first_name, job_id 
    INTO emp_id, emp_first_name, emp_job_id;
    */
    -- tcl komutu
    
    --commit;--yapilan islemleri kaydeder
    rollback to A;--yapilan islemleri A savepointine kadar siler.
    
    -- Çýktý
    DBMS_OUTPUT.PUT_LINE(emp_id || ' ' || emp_first_name || ' ' || emp_last_name || ' ' || emp_job_id || ' ' || emp_email || ' ' || emp_hire_date);
END;




-- sadece tablonun kolonlarini almý oldu içeriklerini almadi
CREATE TABLE regions2 as select * from regions where 1=2;






