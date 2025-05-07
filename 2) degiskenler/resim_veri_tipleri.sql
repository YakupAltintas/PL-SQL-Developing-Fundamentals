

--SYS yetkisi gerekir
CREATE DIRECTORY IMAGE_DIR  AS 'D:\desktopjacob\files\Wp';
--sys den yakup kullan�c�s�na directory  yetkisi verdik
GRANT READ, WRITE ON DIRECTORY IMAGE_DIR TO yakup;

-- tablomuzu olu�turduk
CREATE TABLE resimler(
    dosyaAdi VARCHAR2(100) PRIMARY KEY,
    resim blob
);

DECLARE 
    foto BFILE;
    tempdata BLOB;
    kaynakOffset PLS_INTEGER := 1;
    hedefOffset PLS_INTEGER := 1;
    resim_adi varchar2(50):= 'orman.jpg';

BEGIN
    dbms_lob.CreateTemporary(tempdata,true);--ge�ici bir alan olu�turduk ve tempdata de�i�kenine atad�k
    foto:=BFilename('IMAGE_DIR',resim_adi);--resmiin yolunu ve ad�n� verdik
    dbms_lob.fileopen(foto,dbms_lob.file_readonly);--dosyay� a�t�k
    dbms_lob.loadfromfile(tempdata,foto,dbms_lob.lobmaxsize,kaynakoffset,hedefoffset);--foto'dan veriyi ald� hepsini tam kalite de okudu ve  tam kalidete de tempdata'ya yazd�
    
    INSERT INTO resimler (dosyaAdi,resim) values(resim_adi,tempdata);--tabloya resmi ekledik
    commit;
    
    dbms_lob.fileclose(foto);--dosyay� kapatt�k
END;











