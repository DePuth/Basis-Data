-- Active: 1701236152410@@127.0.0.2@3306
CREATE DATABASE 
    DEFAULT CHARACTER SET = 'utf8mb4';

    show databases;

    use rumah_sakit;

    show tables;


/* PASIEN */


    create table pasien (
        Kode_Pasien varchar (5) not null,
        Nama_Pasien varchar (40),
        Jenis_Kelamin varchar (1),
        Gol_Darah varchar (3),
        Umur varchar (3),
        Alamat varchar (70),
        Primary Key (Kode_Pasien)
    );

    insert into pasien values ('P-001');
    insert into pasien values ('P-001','Nathanael Ade Putra','L','A','21','Bekasi');
    insert into pasien values ('P-002','Muhammad Rizal Ibrahim','L','A','18','Bekasi');
    insert into pasien values ('P-003','Riki Syahenro','L','B','20','Tangerang');
    insert into pasien values ('P-004','Aditya Saputra','L','A','19','Jakarta');
    insert into pasien values ('P-005','Alphina Lamury','P','AB','16','Bekasi');
    insert into pasien values ('P-006','Susiana Amara','P','B','43','Jakarta');


    desc pasien;
    select * from pasien;
    drop table pasien;


/* OBAT */


    create table obat (
        Kode_Obat varchar (5) not null,
        Nama_Obat varchar (50),
        Jenis_Obat varchar (100),
        Primary Key (Kode_Obat)
    );

    insert into obat values ('O-001');
    insert into obat values ('O-001','Procold Flu dan Batuk','Paracetamol, Dextromethorphan dan Phenylephrine');
    insert into obat values ('O-002','Norvask','Amlodipine');
    insert into obat values ('O-003','Alfentanil','Opioid');
    insert into obat values ('O-004','Insto','Tetrahydrozoline HCI');
    insert into obat values ('O-005','Tensicap','Captopril');
    insert into obat values ('O-006','Antibiotik','Erythromycin dan Tetracycline');

    desc obat;
    select * from obat;
    drop table obat;

/* DOKTER */


    create table dokter (
        Kode_Dokter varchar (5) not null,
        Nama_Dokter varchar (30),
        Jenis_Kelamin varchar (1),
        Telepon varchar (12),
        Keahlian varchar (50),
        Shift varchar (10),
        Primary Key (Kode_Dokter)
    );

    insert into dokter values ('D-001');
    insert into dokter values ('D-001','Chika Cinta Lestari Sp.A','P','081317284127','Spesialis Anak','Pagi');
    insert into dokter values ('D-002','Beru Wirdansyah Sp.JP','L','081392015301','Spesialis Jantung dan Pembuluh Darah','Malam');
    insert into dokter values ('D-003','Harun Ilham Ilmawan Sp.B','L','081294456152','Spesialis Bedah','Malam');
    insert into dokter values ('D-004','Alif Bintang Syahputra Sp.P','L','081342390023','Spesialis Mata','Malam');
    insert into dokter values ('D-005','Amelia Kartika Sp.S','P','081210024781','Spesialis Saraf dan Neurolog','Pagi');
    insert into dokter values ('D-006','Farid Ibrahim Sp.KK','L','081388025391','Spesialis Kulit dan Kelamin','Pagi');

    desc dokter;
    select * from dokter;
    drop table dokter;

/* KAMAR */


    create table kamar (
        Kode_Kamar varchar (5) not null,
        Jenis_Kamar varchar (50),
        Tarif_Permalam varchar (20),
        Fasilitas varchar (100),
        Primary Key (Kode_Kamar)
    );

    insert into kamar values ('K-001');
    insert into kamar values ('K-001','Kelas 1','Rp.250.000','Kipas Angin, TV, WC 2, Kamar 8 Pasien');
    insert into kamar values ('K-002','Kelas 2','Rp.500.000','AC, TV, WC 1, Kamar 4 Pasien');
    insert into kamar values ('K-003','Kelas 3','Rp.1.000.000','AC, Smart TV, WC 1, Kamar 1 Pasien');

    desc kamar;
    select * from kamar;
    drop table kamar;

/* LAYANAN */


    create table layanan (
        Kode_Layanan varchar (5) not null,
        Jenis_Layanan varchar (50),
        Tarif_Layanan varchar (20),
        Primary Key (Kode_Layanan)
    );

    insert into layanan values ('L-001');
    insert into layanan values ('L-001','Konsultasi Dokter','Rp.500.000');
    insert into layanan values ('L-002','Operasi Jantung','Rp.15.000.000');
    insert into layanan values ('L-003','Operasi kecil','Rp.2.000.000');
    insert into layanan values ('L-004','UGD','Rp.100.000.000');

    desc layanan;
    select * from layanan;
    drop table layanan;

/* MEDICAL_RECORD */


    create table medical_record (
        Nomor_Urut varchar (5),
        Tanggal_Masuk date,
        Diagnosa text,
        Kode_Pasien varchar (6),
        Alamat varchar (70),
        Tarif_Kamar varchar (20),
        Tarif_Layanan varchar (20),
        Kode_Obat varchar (5),
        Kode_Dokter varchar (5),
        Kode_Layanan varchar (5),
        Primary Key (Nomor_Urut),
        Foreign Key (Kode_Obat) REFERENCES obat (Kode_Obat),
        Foreign Key (Kode_Dokter) REFERENCES dokter (Kode_Dokter),
        Foreign Key (Kode_Layanan) REFERENCES layanan (Kode_Layanan)
    );

    insert into medical_record values ('');
    insert into medical_record values ('1','2023-11-29','Jantung','P-004','Jakarta','Rp.500.000','Rp.15.000.000','O-002','D-002','L-002');
    insert into medical_record values ('2','2023-11-30','Flu dan Batuk','P-005','Bekasi','0','Rp.500.000','O-001','D-001','L-001');
    insert into medical_record values ('3','2023-11-30','Stroke','P-006','Jakarta','Rp.1.000.000','Rp.100.000.000','O-005','D-005','L-004');
    insert into medical_record values ('4','2023-12-01','Keloid','P-003','Tangerang','Rp.500.000','Rp.2.000.000','O-003','D-003','L-003');
    insert into medical_record values ('5','2023-12-01','Mata Merah','P-002','Bekasi','0','Rp.500.000','O-004','D-004','L-001');
    insert into medical_record values ('6','2023-12-02','Infeksi Bakteri','P-001','Bekasi','0','Rp.500.000','O-006','D-006','L-001');

    desc medical_record;
    select * from medical_record;
    drop table medical_record;





/* JAWABAN

No. 1 */

desc pasien;
select * from pasien;

desc obat;
select * from obat;

desc dokter;
select * from dokter;

desc kamar;
select * from kamar;

desc layanan;
select * from layanan;

/* NO. 2 */

select Nama_Pasien from pasien;

/* NO. 3 */

select Alamat 
from pasien
where Alamat
LIKE "J%";

select Alamat 
from pasien
where Alamat
LIKE "B%";

/* NO. 4 */

select Shift,Nama_Dokter
from dokter
where Shift="Pagi";

/* NO. 5 */

alter table obat
add Qty varchar (3);

desc obat;
select * from obat;
