DECLARE
    ad CHAR(20);--belirtildiði kadar yer kaplar
    soyad VARCHAR2(20);--içine aldýðý deðer kadar yer kaplar
    sayi1 PLS_INTEGER := 2147483647;--atama oluþturma aþamasýnda da yapýlabilir
    sayi2 NUMBER := 5;
    toplam number;
BEGIN 
    toplam := sayi1 + sayi2;--toplama yapýlýrken sayi1 ve sayi2 yi toplar hangisi büyükse onun içine atar sonra toplam deðikenine atar. aþýrý yükleme olursa hata verir!
    dbms_output.put_line(toplam);
    DBMS_OUTPUT.PUT_LINE(ad || soyad);--çýktý alma komutu
END;
