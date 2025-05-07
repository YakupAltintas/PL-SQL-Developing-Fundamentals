

--SYS yetkisi gerekir
CREATE DIRECTORY IMAGE_DIR  AS 'D:\desktopjacob\files\Wp';
--sys den yakup kullanýcýsýna directory  yetkisi verdik
GRANT READ, WRITE ON DIRECTORY IMAGE_DIR TO yakup;

-- tablomuzu oluþturduk
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
    dbms_lob.CreateTemporary(tempdata,true);--geçici bir alan oluþturduk ve tempdata deðiþkenine atadýk
    foto:=BFilename('IMAGE_DIR',resim_adi);--resmiin yolunu ve adýný verdik
    dbms_lob.fileopen(foto,dbms_lob.file_readonly);--dosyayý açtýk
    dbms_lob.loadfromfile(tempdata,foto,dbms_lob.lobmaxsize,kaynakoffset,hedefoffset);--foto'dan veriyi aldý hepsini tam kalite de okudu ve  tam kalidete de tempdata'ya yazdý
    
    INSERT INTO resimler (dosyaAdi,resim) values(resim_adi,tempdata);--tabloya resmi ekledik
    commit;
    
    dbms_lob.fileclose(foto);--dosyayý kapattýk
END;











