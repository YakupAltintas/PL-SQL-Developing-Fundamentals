DECLARE
    ad CHAR(20);--belirtildi�i kadar yer kaplar
    soyad VARCHAR2(20);--i�ine ald��� de�er kadar yer kaplar
    sayi1 PLS_INTEGER := 2147483647;--atama olu�turma a�amas�nda da yap�labilir
    sayi2 NUMBER := 5;
    toplam number;
BEGIN 
    toplam := sayi1 + sayi2;--toplama yap�l�rken sayi1 ve sayi2 yi toplar hangisi b�y�kse onun i�ine atar sonra toplam de�ikenine atar. a��r� y�kleme olursa hata verir!
    dbms_output.put_line(toplam);
    DBMS_OUTPUT.PUT_LINE(ad || soyad);--��kt� alma komutu
END;
