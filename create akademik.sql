use akademik;

CREATE DATABASE akademik;
CREATE TABLE dosen (
NIP varchar(12) NOT NULL,
Nama_Dosen varchar(25) NOT NULL,
PRIMARY KEY(NIP)
);

CREATE DATABASE akademik;
CREATE TABLE dosen (
NIP varchar(12) NOT NULL,
Nama_Dosen varchar(25) NOT NULL,
PRIMARY KEY(NIP)
);

CREATE TABLE mahasiswa (
NIM varchar(10) NOT NULL,
Nama_Mhs varchar(25) NOT NULL,
Tgl_lahir date NOT NULL,
Alamat varchar(50) NOT NULL,
Jenis_Kelamin enum("Laki-Laki","Perempuan") NOT NULL,
IPK decimal(10,2),
PRIMARY KEY(NIM)
);

CREATE TABLE matakuliah (
Kode_MK varchar(6) NOT NULL,
Nama_MK varchar(25) NOT NULL,
Sks int(2) NOT NULL,
PRIMARY KEY(Kode_MK)
);

CREATE TABLE perkuliahan (
NIM varchar(9) DEFAULT NULL,
Kode_MK varchar(7) DEFAULT NULL,
NIP varchar(12) DEFAULT NULL,
Kehadiran decimal(6,2) DEFAULT NULL,
Nilai_Bobot char(1),
Key NIP (NIP),
Key NIM (NIM),
Key Kode_MK (Kode_MK),

constraint perkuliahan_ibfk_1 FOREIGN KEY (NIP) REFERENCES dosen (NIP) ON delete CASCADE ON update cascade,
constraint perkuliahan_ibfk_2 FOREIGN KEY (NIM) REFERENCES mahasiswa (NIM) ON delete CASCADE ON update cascade,
constraint perkuliahan_ibfk_3 FOREIGN KEY (Kode_MK) REFERENCES matakuliah (Kode_MK) ON delete CASCADE ON update cascade
);