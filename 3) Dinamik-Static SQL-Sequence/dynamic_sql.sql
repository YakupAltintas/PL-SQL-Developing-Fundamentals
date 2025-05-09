--PL/SQL dynamic sql (create,drop,alter)

DECLARE 
    ddl_komut varchar2(200) ;
BEGIN
    --ddl_komut := 'CREATE TABLE URUNLER(urun_id NUMBER(10),urun_adi VARCHAR2(30))';
    --ddl_komut := 'GRANT SELECT  ON urunler TO jacob';
    --ddl_komut := 'ALTER TABLE urunler  ADD urun_fiyati NUMBER(15,2)';
    --ddl_komut := 'REVOKE SELECT ON URUNLER FROM jacob';
    ddl_komut := 'DROP TABLE urunler';
    --EXECUTE IMMEDIATE CREATE , DROP, ALTER komutlarini kullanmayi saglar
    EXECUTE IMMEDIATE ddl_komut;
    
END;
/

