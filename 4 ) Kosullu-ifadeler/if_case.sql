
set SERVEROUTPUT on;

--if kosul yapisi
DECLARE
    dogumTarihi date := to_date('21/05/2005','dd,mm,yyyy');
    yas number(3);
BEGIN

    yas := (sysdate - dogumTarihi)/365;

    if yas > 50 then
        dbms_output.put_line('ben bir yetiskinim! Yasim :  '||yas);
        
    elsif yas > 18 then
        dbms_output.put_line('ben bir gencim! Yasim :  '||yas);
        
    else
        dbms_output.put_line('ben bir cocugum! Yasim :  '||yas);
   end if;
END;

--Searched CASE kosul yapisi
DECLARE
    dogumTarihi date := to_date('21/05/2005','dd,mm,yyyy');
    yas number(3);
BEGIN

    yas := (sysdate - dogumTarihi)/365;
    
    CASE
        WHEN yas > 50 THEN dbms_output.put_line('ben bir yetiskinim! Yasim :  '||yas);
        WHEN yas > 18 THEN dbms_output.put_line('ben bir gencim! Yasim :  '||yas);
        ELSE dbms_output.put_line('ben bir cocugum! Yasim :  '||yas);
    END CASE;
END;


--Simple Case
DECLARE
    dogumTarihi date := to_date('21/05/2003','dd,mm,yyyy');
    yas number(3);
BEGIN
    yas := (sysdate - dogumTarihi)/365;
    
    CASE yas
        WHEN 20 THEN dbms_output.put_line('benim yasim : '||yas);
        WHEN 19 THEN dbms_output.put_line('benim yasim : '||yas);
        WHEN 18 THEN dbms_output.put_line('benim yasim : '||yas);
        WHEN 17 THEN dbms_output.put_line('benim yasim : '||yas);
        WHEN 16 THEN dbms_output.put_line('benim yasim : '||yas);
        WHEN 15 THEN dbms_output.put_line('benim yasim : '||yas);
        WHEN 14 THEN dbms_output.put_line('benim yasim : '||yas);
        WHEN 13 THEN dbms_output.put_line('benim yasim : '||yas);
        ELSE dbms_output.put_line('yukaridakilerden hicbiri degil aslýnda yasim  : '||yas);
    END CASE;
END;





