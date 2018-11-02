INSERT INTO `direct_message` VALUES ('1', null, '3', '90', '1', '9', '2018-10-31 16:33:37', null, null, null);
INSERT INTO `direct_message` VALUES ('2', null, '3', '7', '1', '9', '2018-10-31 16:50:44', null, null, null);
INSERT INTO `direct_message` VALUES ('3', null, '3', '7', '1', '9', '2018-10-31 17:11:18', null, null, null);

INSERT INTO `kategori` VALUES ('1', 'Matematika', '2018-10-22', '0', '0', 'ACTIVE', 'fa-puzzle-piece', 'materi/Matematika');
INSERT INTO `kategori` VALUES ('2', 'Seni Budaya', '2018-10-22', '1', '0', 'ACTIVE', 'fa-globe', 'materi/Seni Budaya');
INSERT INTO `kategori` VALUES ('3', 'Penjaskes', '2018-10-22', '1', '0', 'ACTIVE', 'fa-flask', 'materi/Penjaskes');
INSERT INTO `kategori` VALUES ('4', 'Bahasa Indonesia', '2018-10-22', '1', '0', 'ACTIVE', 'fa-users', 'materi/Bahasa Indonesia');
INSERT INTO `kategori` VALUES ('5', 'Bahasa Inggris', '2018-10-22', '0', '0', 'ACTIVE', 'fa-book', 'materi/Bahasa Inggris');
INSERT INTO `kategori` VALUES ('6', 'Kimia', '2018-10-22', '0', '0', 'ACTIVE', 'fa-bicycle', 'materi/Kimia');
INSERT INTO `kategori` VALUES ('7', 'Fisika', '2018-10-22', '0', '0', 'ACTIVE', 'fa-flag', 'materi/Fisika');

INSERT INTO `komentar` VALUES ('1', 'boleh2', '2018-10-24 09:22:38', '2', '2', null, null, '2');
INSERT INTO `komentar` VALUES ('2', 'nggak ah, aku takut kesurupan', '2018-10-24 09:24:05', '2', '1', null, null, '5');
INSERT INTO `komentar` VALUES ('3', 'aku ikut, aku mau jadi jarannya, siapa mau naik', '2018-10-24 09:25:10', '4', '1', null, null, '4');
INSERT INTO `komentar` VALUES ('4', 'aku udah siap nih, cuss', '2018-10-24 09:26:04', '4', '1', null, null, '3');
INSERT INTO `komentar` VALUES ('5', 'ayokkkkk\r\n', '2018-10-26 16:55:59', '2', '2', null, null, '4');
INSERT INTO `komentar` VALUES ('6', 'diem diem bae? ngopi napa', '2018-10-28 16:14:18', '6', '3', null, null, null);
INSERT INTO `komentar` VALUES ('7', 'jangan asal cus', '2018-10-28 16:15:03', '6', '1', null, null, '3');
INSERT INTO `komentar` VALUES ('8', 'aku mau jadi reognya', '2018-10-28 16:33:04', '8', '1', null, null, '2');
INSERT INTO `komentar` VALUES ('9', 'jadi kura-kura nggak ada ya?', '2018-10-28 16:34:18', '7', '1', null, null, '3');
INSERT INTO `lowongan` VALUES ('1', 'Guru Tingkat SD yang Ulet, Bisa Microsoft Office Nilai Plus', 'TK ABA 16 Malang', 'Jalan Gajayana Gang 3D', '08155514054', '0', null, '2018-10-28 18:17:08');
INSERT INTO `lowongan` VALUES ('2', 'Guru Tingkat SMA yang Ulet, Bisa Microsoft Office Nilai Plus', 'SMAN 9 Malang', 'Jalan borobudur', '08155514054', '0', null, '2018-10-28 18:18:58');

INSERT INTO `max_notif_id_per_user` VALUES ('1', '1', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('2', '2', '3');
INSERT INTO `max_notif_id_per_user` VALUES ('3', '3', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('4', '4', '3');
INSERT INTO `max_notif_id_per_user` VALUES ('5', '5', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('6', '6', '3');
INSERT INTO `max_notif_id_per_user` VALUES ('7', '7', '3');
INSERT INTO `max_notif_id_per_user` VALUES ('8', '8', '3');

INSERT INTO `notif_mhs_per_user` VALUES ('1', '2', '1', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('2', '2', '2', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('3', '4', '2', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('4', '4', '1', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('5', '2', '3', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('6', '4', '3', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('7', '6', '3', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('8', '6', '2', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('9', '6', '1', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('10', '8', '3', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('11', '8', '2', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('12', '8', '1', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('13', '7', '3', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('14', '7', '2', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('15', '7', '1', '1', '0');

INSERT INTO `notif_permasalahan` VALUES ('1', '1', '3', 'mahasiswa', '2018-10-22 22:24:02', null, null);
INSERT INTO `notif_permasalahan` VALUES ('2', '2', '3', 'mahasiswa', '2018-10-23 17:36:32', null, null);
INSERT INTO `notif_permasalahan` VALUES ('3', '3', '5', 'mahasiswa', '2018-10-28 15:32:50', null, null);

INSERT INTO `pengguna` VALUES ('1', 'admin', 'admin@admin.com', '+6289987009', null, null, '0', 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', '8Xs4bPdJ7QnoRf2ryNgsEf9X7quKLaY4hz3aHxwKHcSVtoMvbg0ehEmpjenA9Oyr', '0', '0');
INSERT INTO `pengguna` VALUES ('2', 'Maha Siswa', 'mahasiswa@mahasiswa.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('3', 'Maha Guru', 'guru@guru.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('4', 'Siswa Siswi', 'siswa@siswa.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('5', 'Zainal Arifin', 'arif@arif.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('6', 'Nova Farida', 'nova@nova.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('7', 'Hasan Jamil', 'hasan@hasan.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('8', 'Jamal Khashoggi', 'jamal@jamal.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');

INSERT INTO `permasalahan` VALUES ('1', 'jaran kepangan yuk? mau yaa? mau dong..', '2018-10-25 11:54:15', '3', '5', '0', '6', '2', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('2', 'lari pagi yuk??', '2018-10-23 17:36:32', '3', '1', '0', '2', '3', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('3', 'diam sejenak diam menghela nafas. diam tenang ya', '2018-10-28 15:41:52', '5', '3', '0', '1', '5', 'UNSOLVED', 'ACTIVE');

INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('1', '2', '2', '2018-10-24 09:21:18');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('2', '2', '1', '2018-10-24 09:23:51');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('3', '4', '1', '2018-10-24 09:24:43');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('4', '2', '3', '2018-10-28 15:33:59');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('5', '4', '3', '2018-10-28 15:34:32');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('6', '6', '3', '2018-10-28 16:13:55');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('7', '6', '1', '2018-10-28 16:14:41');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('8', '8', '1', '2018-10-28 16:32:41');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('9', '7', '1', '2018-10-28 16:33:58');