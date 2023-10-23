create database Ruang_Baca;
show tables;
use Ruang_Baca;

create table fakultas (
	kode_fakultas smallint,
	fakultas varchar(45),
	primary key (kode_fakultas)
);

create table seleksi_masuk (
	id_seleksi_masuk smallint,
	seleksi_masuk varchar(60),
	primary key (id_seleksi_masuk)
);

create table strata (
	id_strata smallint,
	strata varchar(25),
	primary key (id_strata)
);

create table petugas (
	kode_petugas varchar(5),
	nama varchar(45),
	username varchar(25),
	password varchar(45),
	unique (username),
	primary key (kode_petugas)
);

create table departemen (
	kode_departemen smallint,
	kode_fakultas smallint,
	departemen varchar(45),
	primary key (kode_departemen),
	foreign key (kode_fakultas) references fakultas(kode_fakultas)
);

create table program_studi (
	kode_program_studi smallint,
	id_strata smallint,
	kode_departemen smallint,
	program_studi varchar(45),
	primary key (kode_program_studi),
	unique (program_studi),
	foreign key (kode_departemen) references departemen(kode_departemen),
	foreign key (id_strata) references strata(id_strata)
);


create table anggota(
	kode_anggota varchar(5),
	nama varchar(45),
	kode_program_studi smallint,
	primary key(kode_anggota),
	unique (nama),
	foreign key (kode_program_studi) references program_studi(kode_program_studi)
);

create table mahasiswa(
	nim varchar(15),
	kode_anggota varchar(5),
	id_seleksi_masuk smallint,
	angkatan smallint,
	primary key (nim),
	unique (angkatan),
	foreign key (kode_anggota) references anggota(kode_anggota),
	foreign key (id_seleksi_masuk) references seleksi_masuk(id_seleksi_masuk)
);

create table dosen(
	nip varchar(25),
	kode_anggota varchar(5),
	primary key(nip),
	foreign key (kode_anggota) references anggota(kode_anggota)
);

create table anggota_kontak(
	no_hp varchar(15),
	kode_anggota varchar(5),
	unique (no_hp, kode_anggota),
	foreign key (kode_anggota) references anggota(kode_anggota)
);

create table transaksi(
	kode_transaksi varchar(25),
	petugas_kode_petugas varchar(5),
	anggota_kode_anggota varchar(5),
	waktu_transaksi timestamp,
	primary key (kode_transaksi),
	unique (anggota_kode_anggota, waktu_transaksi),
	foreign key (anggota_kode_anggota) references anggota(kode_anggota),
	foreign key (petugas_kode_petugas) references petugas(kode_petugas)
);

create table buku(
	kode_buku varchar(10),
	judul varchar(100),
	penerbit varchar(45),
	tempat_terbit varchar(45),
	primary key (kode_buku),
	unique (judul, penerbit, tempat_terbit)
);

create table eksemplar(
	kode_eksemplar varchar(10),
	buku_kode_buku varchar(10),
	primary key (kode_eksemplar),
	foreign key (buku_kode_buku) references buku(kode_buku)
);

create table detail_transaksi(
	waktu_pinjam timestamp,
	eksemplar_kode_eksemplar varchar(10),
	transaksi_kode_transaksi varchar(25),
	waktu_kembali timestamp,
	waktu_wajib_kembali timestamp,
	primary key(waktu_pinjam, eksemplar_kode_eksemplar, transaksi_kode_transaksi),
	unique (waktu_kembali, waktu_wajib_kembali),
	foreign key (transaksi_kode_transaksi) references transaksi(kode_transaksi),
	foreign key (eksemplar_kode_eksemplar) references eksemplar(kode_eksemplar)
);

create table pengarang(
	pengarang varchar(45),
	kode_buku varchar(10),
	primary key(pengarang, kode_buku),
	foreign key (kode_buku) references buku(kode_buku)
); 

show tables;
use ruang_baca;