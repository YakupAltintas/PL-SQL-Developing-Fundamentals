
--RECORD ile kendi �zel de�i�kenlerimizi olu�tural�m
DECLARE  
    
    TYPE t_dept IS RECORD (
    dept_id NUMBER(4),
    dept_name departments.department_name%TYPE,
    manager_id departments.manager_id%TYPE NOT NULL DEFAULT 0
    );
    
    r_dept2 t_dept;
    
BEGIN
    SELECT department_�d,department_name,manager_id INTO r_dept2 FROM DEPARTMENTS WHERE department_id = 10;
    
    dbms_output.put_l�ne(r_dept2.dept_id||' '||r_dept2.dept_name || ' ' || r_dept2.manager_id );
END;
