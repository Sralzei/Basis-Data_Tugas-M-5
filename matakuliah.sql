SELECT * FROM akademik.matakuliah;

SELECT * FROM matakuliah 
WHERE Kode_MK IN ('B505', 'B908');


INSERT INTO matakuliah(Kode_MK, Nama_MK, Sks) 
VALUES ('B505', 'Pelajaran Dasar Sihir', '4');

INSERT INTO matakuliah(Kode_MK, Nama_MK, Sks) 
VALUES ('B908', 'Konsep Dasar Mental', '3');

UPDATE matakuliah set SKS = '2'
WHERE Kode_MK = 'B908';

DELETE FROM matakuliah 
WHERE Kode_MK = 'B908';


USE akademik;

ALTER TABLE matakuliah
ADD COLUMN Dosen_Pengampu char(15) DEFAULT NULL;

UPDATE matakuliah 
SET Dosen_Pengampu = 'Elaina,SSi, MMt' WHERE Kode_MK = 'B505';

UPDATE matakuliah 
SET Dosen_Pengampu = 'Johan, SHi, MMi' WHERE Kode_MK = 'B508';

-- INSERT --
DELIMITER $$
CREATE PROCEDURE SP_Tambah_Matakuliah(IN p_Kode_MK CHAR(10), IN p_Nama_MK VARCHAR(100), IN p_Sks INT)
BEGIN
    INSERT INTO matakuliah(Kode_MK, Nama_MK, Sks) 
    VALUES (p_Kode_MK, p_Nama_MK, p_Sks);
END $$
DELIMITER ;

-- SELECT--
DELIMITER $$
CREATE PROCEDURE SP_Query_Matakuliah(IN p_Kode_MK CHAR(10))
BEGIN
    SELECT * FROM matakuliah WHERE Kode_MK = p_Kode_MK;
END $$
DELIMITER ;

-- UPDATE --
DELIMITER $$
CREATE PROCEDURE SP_Update_Matakuliah(IN p_Kode_MK CHAR(10), IN p_Nama_MK VARCHAR(100), IN p_Sks INT)
BEGIN
    UPDATE matakuliah SET Nama_MK = p_Nama_MK, Sks = p_Sks WHERE Kode_MK = p_Kode_MK;
END $$
DELIMITER ;

-- DELETE --
DELIMITER $$
CREATE PROCEDURE SP_Delete_Matakuliah(IN p_Kode_MK CHAR(10))
BEGIN
    DELETE FROM matakuliah WHERE Kode_MK = p_Kode_MK;
END $$
DELIMITER ;
