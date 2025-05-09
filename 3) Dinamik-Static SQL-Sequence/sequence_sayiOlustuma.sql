
--SEQUENCE satý oluþturmak için kullanýlýr
--CREATE SEQUENCE sequence_adi START WITH baslangic_degeri INCREMENT BY arttirma_miktari;
CREATE SEQUENCE test_seq START WITH 5 INCREMENT BY 1;

DECLARE
    seq_number number;
BEGIN 
    seq_number := seq_number.nextval;
    
    --veri ekleme
    INSERT INTO regions(region_id, region_name) VALUES (seq_number,'Avusturalya'); 
    
    
    --UPDATE regions SET region_name = 'Antartika' WHERE region_id = test_seq.currval;-- bu kullanim performans icin kotudur
    seq_number := test_seq.currval;
    UPDATE regions SET region_name = 'Antartika' WHERE region_id = seq_number;-- bu kullanim tercih ediliyor
    commit;

END;