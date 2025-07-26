create database if not exists restoran_zanjirei;

# ba tavajoh be farz soal, dar shoabat Tehran, modir_shobe = modir_arshad
 create table if not exists shoabat_restoran (
	ID_shobe	    varchar(15) ,
	modir_shobe	    char(25) NOT NULL ,
    modir_arshad	char(25) NOT NULL ,
    ostaan			varchar(50) NOT NULL,
    shahrestan		varchar(50),
    PRIMARY KEY (ID_shobe)
 );
 
 
 create table if not exists tamin_mavad_ghazaii(
	name_made		varchar(30),
	mizan			varchar(15) check ( mizan >= 0 ) ,
    shobe_ersali	varchar(15) NOT NULL,
    zaman_ersal		time,
    tarikh_ersal	date,
    primary key (name_made, mizan),
    foreign key (shobe_ersali) references shoabat_restoran(ID_shobe)
 );
 
 
 create table if not exists joziiat_ghaza(
	name_ghaza		varchar(50),
	name_made		varchar(30) NOT NULL,
	mizan			varchar(15) check ( mizan >= 0 ),
	primary key (name_ghaza, name_made),
    foreign key (name_ghaza) references ghaza(name_ghaza),
    foreign key (name_made, mizan) references tamin_mavad_ghazaii(name_made, mizan)
 );
 
 
create table if not exists ghaza(
	name_ghaza		varchar(50),
    ID_shobe		varchar(15) NOT NULL,
    gheimat			decimal(9,2) CHECK (gheimat >= 0 ),
    primary key (name_ghaza),
    foreign key (ID_shobe) references shoabat_restoran(ID_shobe)
);


create table if not exists sefareshat(
	ID_shobe		varchar(15),
	name_ghaza		varchar(50),
    name_moshtari	varchar(50),
    tarikh_sabt_sefaresh	timestamp,
	tarikh_sabt_pardakht	timestamp,
	noe_pardakht	char(15) check (noe_pardakht in ('naghd','credit_card','online')) ,
	mizan_pardakht	decimal(9,2) CHECK (mizan_pardakht > 0),
    telephone_moshtari	varchar(15) not null,
    noe_kharid		varchar(30) check (noe_kharid in ('eshteraki','moredi')),
    mizan_takhfif	decimal(9,2),
	primary key (name_moshtari, ID_shobe, name_ghaza, tarikh_sabt_sefaresh),
    foreign key (ID_shobe) references shoabat_restoran(ID_shobe),
    foreign key (name_ghaza) references ghaza(name_ghaza)
);


create table if not exists sazmanha(
		name_sazman		varchar(30),
		tarikh_sabt_sefaresh	timestamp,
		tarikh_akhz_gharardad	date,
        mizan_hazine_gharardad  decimal(12,2) check (mizan_hazine_gharardad > 0) ,
        primary key (name_sazman, tarikh_sabt_sefaresh) ,
        foreign key (tarikh_sabt_sefaresh) references sefareshat(tarikh_sabt_sefaresh)
);


create table if not exists emtiazat(
		name_moshtari	varchar(50) ,
		ID_shobe		varchar(15) ,
		name_ghaza		varchar(50) ,
		tarikh_sabt_emtiaz	timestamp,
        nomre_be_ghaza	int(3) check (nomre_be_ghaza between 0 and 10),
        nomre_be_khadamat int(3) check (nomre_be_khadamat between 0 and 10),
        primary key (name_moshtari, ID_shobe, name_ghaza, tarikh_sabt_emtiaz),
        foreign key (name_moshtari, ID_shobe, name_ghaza) references sefareshat(name_moshtari, ID_shobe, name_ghaza)
);

create table if not exists manabe_ensani(
	ID_karmand		varchar(15),
	ID_shobe		varchar(15) not null,
	semat_shoghli	varchar(20) not null,
    zaman_kar_tajamoei	decimal(8,1) default 0 ,
	zaman_estekhdam	time,
	dastmozd		decimal(8,2) default 0,
    primary key (ID_karmand),
    foreign key (ID_shobe) references shoabat_restoran(ID_shobe)
);


create table if not exists joziiat_saat_kari(
	ID_karmand		varchar(15),
    month_1			decimal(3,1) default 0 ,
	month_2			decimal(3,1) default 0,
	month_3			decimal(3,1) default 0,
	month_4			decimal(3,1) default 0,
	month_5			decimal(3,1) default 0,
	month_6			decimal(3,1) default 0,
	month_7			decimal(3,1) default 0,
	month_8			decimal(3,1) default 0,
	month_9			decimal(3,1) default 0,
	month_10		decimal(3,1) default 0,
	month_11		decimal(3,1) default 0,
	month_12		decimal(3,1) default 0,
	primary key (ID_karmand),
    foreign key (ID_karmand) references manabe_ensani(ID_karmand)
);


create table if not exists shekayat(
	ID_shekayat		varchar(20),
	nomre_manfi		decimal(8,0),
	ID_shobe		varchar(15) not null,
	noe_shekayat	char(25) check (noe_shekayat in ('ghaza','services')),
    tarikh_shekayat	 date,
    primary key (ID_shekayat),
    foreign key (ID_shobe) references shoabat_restoran(ID_shobe)
);





/*

INSERT INTO shoabat_restoran (ID_shobe, modir_shobe, modir_arshad, ostaan, shahrestan)
VALUES 
('SH004', 'Reza Ghasemi', 'Hassan Aslani', 'Tehran', 'Tehran'),
('SH005', 'Sara Jafari', 'Hassan Aslani', 'Tehran', 'Shahr-e-Rey'),
('SH006', 'Ali Mohammadi', 'Hassan Aslani', 'Gilan', 'Rasht'),
('SH007', 'Niloofar Akbari', 'Hassan Aslani', 'Mazandaran', 'Sari'),
('SH008', 'Hossein Rahimi', 'Hassan Aslani', 'Yazd', 'Yazd'),
('SH009', 'Fatemeh Sadeghi', 'Hassan Aslani', 'Isfahan', 'Isfahan');


INSERT INTO tamin_mavad_ghazaii (name_made, mizan, shobe_ersali, zaman_ersal, tarikh_ersal)
VALUES 
('Meat', '30kg', 'SH004', '10:30:00', '2025-01-12'),
('Vegetables', '25kg', 'SH005', '11:00:00', '2025-01-13'),
('Fish', '20kg', 'SH006', '08:00:00', '2025-01-14'),
('Oil', '15kg', 'SH007', '09:30:00', '2025-01-15'),
('Bread', '50kg', 'SH008', '07:00:00', '2025-01-16'),
('Fruits', '40kg', 'SH009', '06:45:00', '2025-01-17');


INSERT INTO ghaza (name_ghaza, ID_shobe, gheimat)
VALUES 
('Fesenjan', 'SH004', 300000),
('Zereshk Polo', 'SH005', 220000),
('Mirza Ghasemi', 'SH006', 180000),
('Baghali Polo', 'SH007', 200000),
('Shole Zard', 'SH008', 120000),
('Gheimeh', 'SH009', 250000);


INSERT INTO sefareshat (ID_shobe, name_ghaza, name_moshtari, tarikh_sabt_sefaresh, tarikh_sabt_pardakht, noe_pardakht, mizan_pardakht, telephone_moshtari, noe_kharid, mizan_takhfif)
VALUES 
('SH004', 'Fesenjan', 'Ali Akbarian', '2025-01-12 13:00:00', '2025-01-12 13:05:00', 'online', 300000, '09121234567', 'moredi', 10000),
('SH005', 'Zereshk Polo', 'Reza Karimi', '2025-01-13 12:30:00', '2025-01-13 12:35:00', 'credit_card', 220000, '09351234567', 'eshteraki', 15000),
('SH006', 'Mirza Ghasemi', 'Fatemeh Yazdanpanah', '2025-01-14 14:00:00', '2025-01-14 14:05:00', 'naghd', 180000, '09112345678', 'moredi', 5000),
('SH007', 'Baghali Polo', 'Sara Hosseini', '2025-01-15 13:00:00', '2025-01-15 13:10:00', 'online', 200000, '09187654321', 'eshteraki', 10000),
('SH008', 'Shole Zard', 'Hossein Ramezani', '2025-01-16 12:00:00', '2025-01-16 12:10:00', 'credit_card', 120000, '09211234567', 'moredi', 0),
('SH009', 'Gheimeh', 'Niloofar Jafari', '2025-01-17 11:30:00', '2025-01-17 11:35:00', 'naghd', 250000, '09191234567', 'eshteraki', 20000);


INSERT INTO emtiazat (name_moshtari, ID_shobe, name_ghaza, terikh_sabt_emtiaz, nomre_be_ghaza, nomre_be_khadamat)
VALUES 
('Ali Akbarian', 'SH004', 'Fesenjan', '2025-01-12 14:00:00', 9, 8),
('Reza Karimi', 'SH005', 'Zereshk Polo', '2025-01-13 13:00:00', 8, 7),
('Fatemeh Yazdanpanah', 'SH006', 'Mirza Ghasemi', '2025-01-14 15:00:00', 10, 9),
('Sara Hosseini', 'SH007', 'Baghali Polo', '2025-01-15 14:00:00', 9, 8),
('Hossein Ramezani', 'SH008', 'Shole Zard', '2025-01-16 13:00:00', 8, 7),
('Niloofar Jafari', 'SH009', 'Gheimeh', '2025-01-17 12:00:00', 7, 6);


INSERT INTO manabe_ensani (ID_karmand, ID_shobe, semat_shoghli, zaman_kar_tajamoei, zaman_estekhdam, dastmozd)
VALUES 
('EMP004', 'SH004', 'Chef', 130.0, '2025-01-11 08:00:00', 6000000),
('EMP005', 'SH005', 'Manager', 100.0, '2025-01-12 09:00:00', 7500000),
('EMP006', 'SH006', 'Waiter', 70.0, '2025-01-13 07:00:00', 3200000),
('EMP007', 'SH007', 'Chef', 120.0, '2025-01-14 08:00:00', 5500000),
('EMP008', 'SH008', 'Manager', 110.0, '2025-01-15 09:00:00', 7200000),
('EMP009', 'SH009', 'Waiter', 80.0, '2025-01-16 07:00:00', 3300000);


INSERT INTO joziiat_saat_kari (ID_karmand, month_1, month_2, month_3, month_4, month_5, month_6, month_7, month_8, month_9, month_10, month_11, month_12)
VALUES 
('EMP004', 160.0, 170.0, 180.0, 175.0, 165.0, 155.0, 150.0, 145.0, 140.0, 135.0, 130.0, 125.0),
('EMP005', 150.0, 160.0, 170.0, 180.0, 175.0, 165.0, 155.0, 145.0, 140.0, 135.0, 130.0, 125.0),
('EMP006', 140.0, 150.0, 160.0, 170.0, 165.0, 155.0, 145.0, 135.0, 130.0, 125.0, 120.0, 115.0),
('EMP007', 130.0, 140.0, 150.0, 160.0, 155.0, 145.0, 135.0, 125.0, 120.0, 115.0, 110.0, 105.0),
('EMP008', 120.0, 130.0, 140.0, 150.0, 145.0, 135.0, 125.0, 115.0, 110.0, 105.0, 100.0, 95.0),
('EMP009', 110.0, 120.0, 130.0, 140.0, 135.0, 125.0, 115.0, 105.0, 100.0, 95.0, 90.0, 85.0);


INSERT INTO shekayat (ID_shekayat, nomre_manfi, ID_shobe, noe_shekayat, tarikh_shekayat)
VALUES 
('SHEK004', 3, 'SH004', 'services', '2025-01-11'),
('SHEK005', 2, 'SH005', 'ghaza', '2025-01-12'),
('SHEK006', 4, 'SH006', 'ghaza', '2025-01-13'),
('SHEK007', 1, 'SH007', 'services', '2025-01-14'),
('SHEK008', 3, 'SH008', 'ghaza', '2025-01-15'),
('SHEK009', 2, 'SH009', 'services', '2025-01-16');

*/









