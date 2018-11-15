/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : berguru

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-15 11:36:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materi` int(11) DEFAULT NULL,
  `url_attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materi_attachment` (`id_materi`),
  CONSTRAINT `id_materi_attachment` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('1', '1', 'materi/Matematika/20181114_214611.zip');
INSERT INTO `attachment` VALUES ('2', '2', 'materi/Matematika/20181114_223237.zip');

-- ----------------------------
-- Table structure for direct_message
-- ----------------------------
DROP TABLE IF EXISTS `direct_message`;
CREATE TABLE `direct_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teks` text,
  `dari` varchar(255) DEFAULT NULL,
  `untuk` varchar(255) DEFAULT NULL,
  `permasalahan` varchar(255) DEFAULT NULL,
  `komentar` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `terpecahkan` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `is_open` varchar(255) DEFAULT NULL,
  `jenis_pesan` varchar(255) DEFAULT NULL COMMENT 'isinya permasalahan | komentarpermasalahan, dua2 nya memilikikemungkinan dihapus oleh function deleteInitializedDm. Selain itu juga dapat berisi komentardm yang tidak dapat dihapus',
  `dibalas` varchar(255) DEFAULT NULL COMMENT 'kolom untuk mengetahui apakah user telah membalas? jika sudah dibalas maka isinya sudah, jika belum maka isinya kosong dan akan dihapus segera setelah user meninggalkan halaman direct message dengan seorang pengguna',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of direct_message
-- ----------------------------
INSERT INTO `direct_message` VALUES ('1', 'sapa', '3', '7', '1', '3', '2018-11-14 11:36:24', null, null, null, 'permasalahan', 'sudah');
INSERT INTO `direct_message` VALUES ('2', 'tau', '7', '3', '1', '3', '2018-11-14 11:36:24', null, null, null, 'komentarpermasalahan', 'sudah');
INSERT INTO `direct_message` VALUES ('3', 'bisa jadi', '3', '7', '1', '3', '2018-11-14 11:36:32', null, null, null, 'komentardm', null);
INSERT INTO `direct_message` VALUES ('4', 'tapi karena', '3', '7', null, null, '2018-11-14 11:37:45', null, null, null, 'komentardm', null);
INSERT INTO `direct_message` VALUES ('5', 'terimakasih banyak atas sarannya', '3', '7', null, null, '2018-11-14 11:37:58', null, null, null, 'komentardm', null);
INSERT INTO `direct_message` VALUES ('6', 'sebentar', '3', '7', null, null, '2018-11-14 11:41:02', null, null, null, 'komentardm', null);
INSERT INTO `direct_message` VALUES ('7', 'sepertinya', '3', '7', null, null, '2018-11-14 11:41:14', null, null, null, 'komentardm', null);

-- ----------------------------
-- Table structure for kategori
-- ----------------------------
DROP TABLE IF EXISTS `kategori`;
CREATE TABLE `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah_pertanyaan` varchar(255) DEFAULT NULL,
  `jumlah_jawaban` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `nama_folder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES ('1', 'Matematika', '2018-11-08', '1', '4', 'ACTIVE', '', 'materi/Matematika');
INSERT INTO `kategori` VALUES ('2', 'Seni Budaya', '2018-11-08', '0', '0', 'ACTIVE', '', 'materi/Seni Budaya');
INSERT INTO `kategori` VALUES ('3', 'Penjaskes', '2018-11-08', '0', '0', 'ACTIVE', '', 'materi/Penjaskes');
INSERT INTO `kategori` VALUES ('4', 'Bahasa Indonesia', '2018-11-08', '0', '0', 'ACTIVE', '', 'materi/Bahasa Indonesia');
INSERT INTO `kategori` VALUES ('5', 'Bahasa Inggris', '2018-11-08', '0', '0', 'ACTIVE', '', 'materi/Bahasa Inggris');
INSERT INTO `kategori` VALUES ('6', 'Kimia', '2018-11-08', '0', '0', 'ACTIVE', '', 'materi/Kimia');
INSERT INTO `kategori` VALUES ('7', 'Fisika', '2018-11-08', '0', '0', 'ACTIVE', '', 'materi/Fisika');

-- ----------------------------
-- Table structure for komentar
-- ----------------------------
DROP TABLE IF EXISTS `komentar`;
CREATE TABLE `komentar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teks` text,
  `tanggal` datetime DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `permasalahan` int(11) DEFAULT NULL,
  `kategori_permasalahan` int(11) NOT NULL,
  `solver` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permasalahan_mana` (`permasalahan`),
  KEY `parent_komentar` (`parent`),
  KEY `siapa_komen` (`siapa`),
  CONSTRAINT `parent_komentar` FOREIGN KEY (`parent`) REFERENCES `komentar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siapa_komen` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of komentar
-- ----------------------------
INSERT INTO `komentar` VALUES ('1', 'terharu', '2018-11-12 22:49:24', '2', '1', '0', null, null, null);
INSERT INTO `komentar` VALUES ('2', 'waktu', '2018-11-12 22:49:32', '2', '1', '0', null, null, null);
INSERT INTO `komentar` VALUES ('3', 'tau', '2018-11-13 09:55:24', '7', '1', '0', null, null, null);
INSERT INTO `komentar` VALUES ('4', 'semesta', '2018-11-13 17:06:26', '2', '1', '0', null, null, null);

-- ----------------------------
-- Table structure for komentar_message
-- ----------------------------
DROP TABLE IF EXISTS `komentar_message`;
CREATE TABLE `komentar_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teks` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `siapa` (`siapa`),
  KEY `message` (`message`),
  CONSTRAINT `message` FOREIGN KEY (`message`) REFERENCES `message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `siapa` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of komentar_message
-- ----------------------------

-- ----------------------------
-- Table structure for lowongan
-- ----------------------------
DROP TABLE IF EXISTS `lowongan`;
CREATE TABLE `lowongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text,
  `instansi` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `kontak` varchar(255) DEFAULT NULL,
  `valid` int(11) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lowongan
-- ----------------------------

-- ----------------------------
-- Table structure for materi
-- ----------------------------
DROP TABLE IF EXISTS `materi`;
CREATE TABLE `materi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `waktu_terakhir_edit` date DEFAULT NULL,
  `siapa_terakhir_edit` int(11) DEFAULT NULL,
  `jumlah_diunduh` varchar(255) DEFAULT NULL,
  `jumlah_dilihat` varchar(255) DEFAULT NULL,
  `ikon_logo` varchar(255) DEFAULT NULL,
  `ikon_warna` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kategori_materi` (`kategori`),
  KEY `siapa_terakhir_edit_materi` (`siapa_terakhir_edit`),
  CONSTRAINT `kategori_materi` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siapa_terakhir_edit_materi` FOREIGN KEY (`siapa_terakhir_edit`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of materi
-- ----------------------------
INSERT INTO `materi` VALUES ('1', 'Matematika Kelas 12 Semester 1', '1', '2018-11-14', '3', '6', '0', 'fa-flask', 'materi-blue', 'matemika');
INSERT INTO `materi` VALUES ('2', 'Kimia Kelas 12 Semester 1', '1', '2018-11-14', '2', '0', '0', 'fa-flask', 'materi-blue', 'asdkljasljbfa sas');

-- ----------------------------
-- Table structure for max_notif_id_per_user
-- ----------------------------
DROP TABLE IF EXISTS `max_notif_id_per_user`;
CREATE TABLE `max_notif_id_per_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `max_notif_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of max_notif_id_per_user
-- ----------------------------
INSERT INTO `max_notif_id_per_user` VALUES ('1', '1', '18');
INSERT INTO `max_notif_id_per_user` VALUES ('2', '2', '17');
INSERT INTO `max_notif_id_per_user` VALUES ('3', '3', '18');
INSERT INTO `max_notif_id_per_user` VALUES ('4', '4', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('5', '5', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('6', '6', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('7', '7', '10');
INSERT INTO `max_notif_id_per_user` VALUES ('8', '8', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('9', '9', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('10', '10', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('11', '11', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('12', '12', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('13', '13', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('14', '14', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('15', '15', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('16', '16', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('17', '17', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('18', '18', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('19', '19', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('20', '20', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('21', '21', '0');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teks` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `beku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `siapa_tendik_message` (`siapa`),
  CONSTRAINT `siapa_tendik_message` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for notif
-- ----------------------------
DROP TABLE IF EXISTS `notif`;
CREATE TABLE `notif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `konteks` varchar(255) DEFAULT NULL COMMENT 'isinya permasalahan || dm || lainnya || komentar',
  `id_konteks` int(11) DEFAULT NULL COMMENT 'bisa id_permasalahan || id_DM || komentar || lainlain',
  `dari` int(11) DEFAULT NULL,
  `untuk` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL COMMENT 'sudah diilhat di notif',
  `terbaca` varchar(255) DEFAULT NULL COMMENT 'terlihat dengan detil melaui klik pada notif',
  PRIMARY KEY (`id`),
  KEY `dari_pengguna` (`dari`),
  CONSTRAINT `dari_pengguna` FOREIGN KEY (`dari`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notif
-- ----------------------------
INSERT INTO `notif` VALUES ('1', 'pertanyaan', '1', '3', 'mahasiswa', '2018-11-12 22:49:10', null, null);
INSERT INTO `notif` VALUES ('2', 'komentar', '1', '2', '3', '2018-11-12 22:49:24', null, null);
INSERT INTO `notif` VALUES ('3', 'komentar', '1', '2', '3', '2018-11-12 22:49:32', null, null);
INSERT INTO `notif` VALUES ('4', 'komentar', '1', '7', '3', '2018-11-13 09:55:24', null, null);
INSERT INTO `notif` VALUES ('5', 'komentar', '1', '2', '3', '2018-11-13 17:06:26', null, null);
INSERT INTO `notif` VALUES ('6', 'dm', '3', '3', '7', '2018-11-14 11:36:32', null, null);
INSERT INTO `notif` VALUES ('7', 'dm', '4', '3', '7', '2018-11-14 11:37:45', null, null);
INSERT INTO `notif` VALUES ('8', 'dm', '5', '3', '7', '2018-11-14 11:37:58', null, null);
INSERT INTO `notif` VALUES ('9', 'dm', '6', '3', '7', '2018-11-14 11:41:02', null, null);
INSERT INTO `notif` VALUES ('10', 'dm', '7', '3', '7', '2018-11-14 11:41:14', null, null);
INSERT INTO `notif` VALUES ('11', 'materiBaru', '1', '1', 'semua', '2018-11-14 15:35:27', null, null);
INSERT INTO `notif` VALUES ('12', 'materiBaru', '2', '1', 'semua', '2018-11-14 15:55:11', null, null);
INSERT INTO `notif` VALUES ('13', 'materiBaru', null, '1', 'semua', '2018-11-14 16:56:18', null, null);
INSERT INTO `notif` VALUES ('14', 'materiBaru', null, '1', 'semua', '2018-11-14 16:57:38', null, null);
INSERT INTO `notif` VALUES ('15', 'materiBaru', '1', '1', 'semua', '2018-11-14 17:00:36', null, null);
INSERT INTO `notif` VALUES ('16', 'materiBaru', '1', '1', 'semua', '2018-11-14 17:04:12', null, null);
INSERT INTO `notif` VALUES ('17', 'materiBaru', '1', '3', 'semua', '2018-11-14 21:46:11', null, null);
INSERT INTO `notif` VALUES ('18', 'materiBaru', '2', '2', 'semua', '2018-11-14 22:32:37', null, null);

-- ----------------------------
-- Table structure for notif_flag
-- ----------------------------
DROP TABLE IF EXISTS `notif_flag`;
CREATE TABLE `notif_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `id_notif` int(11) DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL,
  `terbaca` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_notif_notif` (`id_notif`),
  CONSTRAINT `id_notif_notif` FOREIGN KEY (`id_notif`) REFERENCES `notif` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notif_flag
-- ----------------------------
INSERT INTO `notif_flag` VALUES ('1', '2', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('2', '3', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('3', '3', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('4', '7', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('5', '3', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('6', '3', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('7', '7', '10', '1', '0');
INSERT INTO `notif_flag` VALUES ('8', '7', '9', '1', '0');
INSERT INTO `notif_flag` VALUES ('9', '7', '8', '1', '0');
INSERT INTO `notif_flag` VALUES ('10', '7', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('11', '7', '6', '1', '0');
INSERT INTO `notif_flag` VALUES ('12', '3', '11', '1', '0');
INSERT INTO `notif_flag` VALUES ('13', '3', '12', '1', '0');
INSERT INTO `notif_flag` VALUES ('14', '3', '16', '1', '0');
INSERT INTO `notif_flag` VALUES ('15', '3', '15', '1', '0');
INSERT INTO `notif_flag` VALUES ('16', '3', '14', '1', '0');
INSERT INTO `notif_flag` VALUES ('17', '3', '13', '1', '0');
INSERT INTO `notif_flag` VALUES ('18', '3', '17', '1', '0');
INSERT INTO `notif_flag` VALUES ('19', '2', '17', '1', '0');
INSERT INTO `notif_flag` VALUES ('20', '2', '16', '1', '0');
INSERT INTO `notif_flag` VALUES ('21', '2', '15', '1', '0');
INSERT INTO `notif_flag` VALUES ('22', '2', '14', '1', '0');
INSERT INTO `notif_flag` VALUES ('23', '2', '13', '1', '0');
INSERT INTO `notif_flag` VALUES ('24', '2', '12', '1', '0');
INSERT INTO `notif_flag` VALUES ('25', '2', '11', '1', '0');
INSERT INTO `notif_flag` VALUES ('26', '3', '18', '1', '0');
INSERT INTO `notif_flag` VALUES ('27', '1', '18', '1', '0');
INSERT INTO `notif_flag` VALUES ('28', '1', '17', '1', '0');

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_hp` varchar(255) DEFAULT NULL,
  `institusi_or_universitas` varchar(255) DEFAULT NULL,
  `nip_or_nim` varchar(255) DEFAULT NULL,
  `report` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `aktor` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `poin` int(11) DEFAULT NULL,
  `cookie` varchar(255) DEFAULT NULL,
  `jumlah_dm` int(11) DEFAULT NULL,
  `jumlah_dm_solved` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_pengguna` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES ('1', 'Admin', 'admin@admin.com', null, null, null, '0', 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('2', 'Maha Siswa', 'mahasiswa@mahasiswa.com', '+6289987009', null, null, '0', 'ACTIVE', 'mahasiswa', 'userprofiles/Maha_Siswa_-_profil.jpg', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('3', 'Guruururu', 'guru@guru.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Guruururu_-_profil.jpg', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('4', 'Anton Bayangkara', 'anton@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('5', 'Bagus Sandika', 'bagus@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('6', 'Cintya Restu', 'cintya@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('7', 'Dea Amanda', 'dea@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('8', 'Emilia Rina', 'emil@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('9', 'Farah Nabila', 'farah@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('10', 'Gina Sabrina', 'gina@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('11', 'Hamid Dian', 'hamid@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('12', 'Irfan Joni', 'irfan@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('13', 'Jaka Umbara', 'jaka@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('14', 'Mulyadi Fadil', 'mulyadi@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('15', 'Hasan Wirayudha', 'hasan@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('16', 'Evania Yafie', 'evania@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('17', 'Ni Luh Sakinah', 'niluh@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('18', 'Herlina Ike', 'herlina@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('19', 'Ence Surahman', 'ence@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('20', 'Yerry Soepriyanto', 'yerry@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('21', 'Henry Praherdhiono', 'henry@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');

-- ----------------------------
-- Table structure for permasalahan
-- ----------------------------
DROP TABLE IF EXISTS `permasalahan`;
CREATE TABLE `permasalahan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teks` text,
  `tanggal` datetime DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `jumlah_dilihat` int(11) DEFAULT NULL,
  `jumlah_dibaca` int(11) DEFAULT NULL,
  `jumlah_komen` int(11) DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `beku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kategori_apa` (`kategori`),
  KEY `siapa_add` (`siapa`),
  CONSTRAINT `kategori_apa` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siapa_add` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permasalahan
-- ----------------------------
INSERT INTO `permasalahan` VALUES ('1', 'sapa', '2018-11-12 22:49:10', '3', '2', '0', '4', '1', 'UNSOLVED', 'ACTIVE');

-- ----------------------------
-- Table structure for pesan_info
-- ----------------------------
DROP TABLE IF EXISTS `pesan_info`;
CREATE TABLE `pesan_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penerima` int(11) DEFAULT NULL,
  `subjek` varchar(255) DEFAULT NULL,
  `isi` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penerima` (`penerima`),
  CONSTRAINT `penerima` FOREIGN KEY (`penerima`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pesan_info
-- ----------------------------

-- ----------------------------
-- Table structure for riwayat_permasalahan_dilihat
-- ----------------------------
DROP TABLE IF EXISTS `riwayat_permasalahan_dilihat`;
CREATE TABLE `riwayat_permasalahan_dilihat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `permasalahan` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of riwayat_permasalahan_dilihat
-- ----------------------------
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('1', '2', '1', '2018-11-12 22:49:18');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('2', '7', '1', '2018-11-13 09:55:18');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materi` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materi` (`id_materi`),
  CONSTRAINT `id_materi` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '1', 'matematika');
INSERT INTO `tags` VALUES ('2', '1', 'gratis');
INSERT INTO `tags` VALUES ('3', '1', 'edukasi');
INSERT INTO `tags` VALUES ('4', '1', 'ebook');
INSERT INTO `tags` VALUES ('5', '2', 'kimia');
INSERT INTO `tags` VALUES ('6', '2', 'gratis');
INSERT INTO `tags` VALUES ('7', '2', 'edukasi');
INSERT INTO `tags` VALUES ('8', '2', 'ebook');
DROP TRIGGER IF EXISTS `tambah_jumlah_komen_permasalahan`;
DELIMITER ;;
CREATE TRIGGER `tambah_jumlah_komen_permasalahan` AFTER INSERT ON `komentar` FOR EACH ROW BEGIN
UPDATE permasalahan SET jumlah_komen = jumlah_komen + 1 WHERE permasalahan.id=NEW.permasalahan;
UPDATE kategori SET jumlah_jawaban = jumlah_jawaban + 1 WHERE kategori.id = (SELECT permasalahan.kategori FROM permasalahan WHERE permasalahan.id = NEW.permasalahan);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `kurangi_jumlah_komen_permasalahan`;
DELIMITER ;;
CREATE TRIGGER `kurangi_jumlah_komen_permasalahan` AFTER DELETE ON `komentar` FOR EACH ROW BEGIN
UPDATE permasalahan SET jumlah_komen = jumlah_komen - 1 WHERE permasalahan.id = OLD.permasalahan;
UPDATE kategori SET jumlah_jawaban = jumlah_jawaban - 1 WHERE kategori.id = (SELECT permasalahan.kategori FROM permasalahan WHERE permasalahan.id = OLD.permasalahan);
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tambah_jumlah_pertanyaan_di_kategori`;
DELIMITER ;;
CREATE TRIGGER `tambah_jumlah_pertanyaan_di_kategori` AFTER INSERT ON `permasalahan` FOR EACH ROW UPDATE kategori SET jumlah_pertanyaan = jumlah_pertanyaan + 1 WHERE id = NEW.kategori
;
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `kurangi_jumlah_pertanyaan_di_kategori`;
DELIMITER ;;
CREATE TRIGGER `kurangi_jumlah_pertanyaan_di_kategori` AFTER DELETE ON `permasalahan` FOR EACH ROW UPDATE kategori SET jumlah_pertanyaan = jumlah_pertanyaan - 1 WHERE id = OLD.kategori
;
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tambah_jumlah_dilihat_permasalahan`;
DELIMITER ;;
CREATE TRIGGER `tambah_jumlah_dilihat_permasalahan` AFTER INSERT ON `riwayat_permasalahan_dilihat` FOR EACH ROW UPDATE permasalahan SET jumlah_dilihat = jumlah_dilihat + 1 WHERE permasalahan.id = NEW.permasalahan
;
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `kurangi_jumlah_dilihat_permasalahan`;
DELIMITER ;;
CREATE TRIGGER `kurangi_jumlah_dilihat_permasalahan` AFTER DELETE ON `riwayat_permasalahan_dilihat` FOR EACH ROW UPDATE permasalahan SET jumlah_dilihat = jumlah_dilihat - 1 WHERE permasalahan.id = OLD.permasalahan
;
;;
DELIMITER ;
