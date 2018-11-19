/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : berguru_

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-20 04:38:58
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attachment
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of direct_message
-- ----------------------------
INSERT INTO `direct_message` VALUES ('1', 'Saya mebutuhkan media 3D untuk pelajaran anatomi tubuh manusia dalam bentuk digital! ', '20', '7', '7', '3', '2018-11-16 19:13:35', null, null, null, 'permasalahan', 'sudah');
INSERT INTO `direct_message` VALUES ('2', 'Saya bisa membuat media 3D dengan aplikasi 4D dengan kombinasi kontral cerdas dari aplikasi Unity dan Google VR', '7', '20', '7', '3', '2018-11-16 19:13:35', null, null, null, 'komentarpermasalahan', 'sudah');
INSERT INTO `direct_message` VALUES ('3', 'software apa yang anda gunakan? dan bagaimana spesifikasi dari komputer pendukungnya?', '20', '7', '7', '3', '2018-11-16 19:14:27', null, null, null, 'komentardm', null);
INSERT INTO `direct_message` VALUES ('4', 'kombinasi aplikasi dengan spek yang minimalis seperti pentium 4 dan RAm 2 Gb', '7', '20', null, null, '2018-11-16 19:16:49', null, null, null, 'komentardm', null);

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
INSERT INTO `kategori` VALUES ('1', 'Matematika', '2018-11-08', '1', '0', 'ACTIVE', 'bgicon-learn-indo', 'materi/Matematika');
INSERT INTO `kategori` VALUES ('2', 'Seni Budaya', '2018-11-08', '1', '0', 'ACTIVE', 'bgicon-learn-history', 'materi/Seni Budaya');
INSERT INTO `kategori` VALUES ('3', 'Penjaskes', '2018-11-08', '2', '3', 'ACTIVE', 'bgicon-learn-indo', 'materi/Penjaskes');
INSERT INTO `kategori` VALUES ('4', 'Bahasa Indonesia', '2018-11-08', '0', '0', 'ACTIVE', 'bgicon-learn-indo', 'materi/Bahasa Indonesia');
INSERT INTO `kategori` VALUES ('5', 'Bahasa Inggris', '2018-11-08', '1', '0', 'ACTIVE', 'bgicon-learn-social', 'materi/Bahasa Inggris');
INSERT INTO `kategori` VALUES ('6', 'Kimia', '2018-11-08', '1', '0', 'ACTIVE', 'bgicon-learn-history', 'materi/Kimia');
INSERT INTO `kategori` VALUES ('7', 'Fisika', '2018-11-08', '0', '0', 'ACTIVE', 'bgicon-learn-physics', 'materi/Fisika');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of komentar
-- ----------------------------
INSERT INTO `komentar` VALUES ('1', 'Saya bisa membuat media tersebut dengan menggunakan software Blender 3D', '2018-11-16 19:10:18', '4', '7', '0', null, null, '0');
INSERT INTO `komentar` VALUES ('2', 'Saya bisa mengembangkannya dengan menggunakan software Unity 3D yang lebih interaktif', '2018-11-16 19:11:30', '6', '7', '0', null, null, '0');
INSERT INTO `komentar` VALUES ('3', 'Saya bisa membuat media 3D dengan aplikasi 4D dengan kombinasi kontral cerdas dari aplikasi Unity dan Google VR', '2018-11-16 19:12:31', '7', '7', '0', null, null, '0');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of materi
-- ----------------------------

-- ----------------------------
-- Table structure for max_notif_id_per_user
-- ----------------------------
DROP TABLE IF EXISTS `max_notif_id_per_user`;
CREATE TABLE `max_notif_id_per_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `max_notif_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of max_notif_id_per_user
-- ----------------------------
INSERT INTO `max_notif_id_per_user` VALUES ('1', '1', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('2', '2', '7');
INSERT INTO `max_notif_id_per_user` VALUES ('3', '3', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('4', '4', '7');
INSERT INTO `max_notif_id_per_user` VALUES ('5', '5', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('6', '6', '7');
INSERT INTO `max_notif_id_per_user` VALUES ('7', '7', '14');
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
INSERT INTO `max_notif_id_per_user` VALUES ('20', '20', '15');
INSERT INTO `max_notif_id_per_user` VALUES ('21', '21', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('22', '22', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('23', '23', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('24', '24', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('25', '25', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('26', '26', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('27', '27', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('28', '28', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('29', '29', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('30', '30', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('31', '31', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('32', '32', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('33', '33', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('34', '34', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('35', '35', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('36', '36', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('37', '37', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('38', '38', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('39', '39', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('40', '40', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('41', '41', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('42', '42', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('43', '43', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('44', '44', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('45', '45', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('46', '46', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('47', '47', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('48', '48', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('49', '49', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('50', '50', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('51', '51', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('52', '52', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('53', '53', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notif
-- ----------------------------
INSERT INTO `notif` VALUES ('1', 'pertanyaan', '1', '18', 'mahasiswa', '2018-11-16 14:20:35', null, null);
INSERT INTO `notif` VALUES ('2', 'pertanyaan', '2', '16', 'mahasiswa', '2018-11-16 14:21:57', null, null);
INSERT INTO `notif` VALUES ('3', 'pertanyaan', '3', '14', 'mahasiswa', '2018-11-16 14:22:59', null, null);
INSERT INTO `notif` VALUES ('4', 'pertanyaan', '4', '15', 'mahasiswa', '2018-11-16 14:24:53', null, null);
INSERT INTO `notif` VALUES ('5', 'pertanyaan', '5', '17', 'mahasiswa', '2018-11-16 14:25:42', null, null);
INSERT INTO `notif` VALUES ('7', 'pertanyaan', '7', '20', 'mahasiswa', '2018-11-16 14:27:10', null, null);
INSERT INTO `notif` VALUES ('8', 'komentar', '7', '4', '20', '2018-11-16 19:10:18', null, null);
INSERT INTO `notif` VALUES ('9', 'komentar', '7', '6', '20', '2018-11-16 19:11:30', null, null);
INSERT INTO `notif` VALUES ('10', 'komentar', '7', '7', '20', '2018-11-16 19:12:31', null, null);
INSERT INTO `notif` VALUES ('11', 'ratingKomentar', '7', '20', '4', '2018-11-16 19:13:26', null, null);
INSERT INTO `notif` VALUES ('12', 'ratingKomentar', '7', '20', '6', '2018-11-16 19:13:28', null, null);
INSERT INTO `notif` VALUES ('13', 'ratingKomentar', '7', '20', '7', '2018-11-16 19:13:30', null, null);
INSERT INTO `notif` VALUES ('14', 'dm', '3', '20', '7', '2018-11-16 19:14:27', null, null);
INSERT INTO `notif` VALUES ('15', 'dm', '4', '7', '20', '2018-11-16 19:16:49', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notif_flag
-- ----------------------------
INSERT INTO `notif_flag` VALUES ('1', '20', '10', '1', '0');
INSERT INTO `notif_flag` VALUES ('2', '20', '9', '1', '0');
INSERT INTO `notif_flag` VALUES ('3', '20', '8', '1', '0');
INSERT INTO `notif_flag` VALUES ('4', '7', '14', '1', '0');
INSERT INTO `notif_flag` VALUES ('5', '7', '13', '1', '0');
INSERT INTO `notif_flag` VALUES ('6', '7', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('8', '7', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('9', '7', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('10', '7', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('11', '7', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('12', '7', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('13', '20', '15', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES ('1', 'Admin', 'admin@admin.com', null, null, null, '0', 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', 'rHsTVEHQSClRehBL7ItfxZ8zFxCFnfQtO7vpzVAUyNa58cvuWWAPqYkndLqKgPKD', '0', '0');
INSERT INTO `pengguna` VALUES ('2', 'Maha Siswa', 'mahasiswa@mahasiswa.com', '+6289987009', null, null, '0', 'ACTIVE', 'mahasiswa', 'userprofiles/Maha_Siswa_-_profil2.jpg', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('3', 'Muhammad Ridho', 'guru@guru.com', '089680752154', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Muhammad_Ridho_-_profil1.jpg', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
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
INSERT INTO `pengguna` VALUES ('14', 'Mulyadi Fadil', 'mulyadi@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Mulyadi_Fadil_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('15', 'Hasan Wirayudha', 'hasan@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Hasan_Wirayudha_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('16', 'Evania Yafie', 'evania@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('17', 'Ni Luh Sakinah', 'niluh@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Ni_Luh_Sakinah_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('18', 'Herlina Ike', 'herlina@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('19', 'Ence Surahman', 'ence@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Ence_Surahman_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('20', 'Yerry Soepriyanto', 'yerry@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Yerry_Soepriyanto_-_profil.jpeg', 'e10adc3949ba59abbe56e057f20f883e', '0', 'FO3aBKlomea82Zt9cKALxUisTjr612CYGVJggWHq7hDIsCXc7p4dLAzbkQTubdij', '0', '0');
INSERT INTO `pengguna` VALUES ('21', 'Henry Praherdhiono', 'henry@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Henry_Praherdhiono_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('22', 'Miftakhul Sholikhah', 'miftakhulsholikhah@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'c68737b0ef27a9a79d936caa9b0ec1fe', '0', 'NTYIwLaQxvJchDukEBaT0LFn2Qg7ecgbXOdCSp2UKR9hdtu9M4rklwy7G6rzWsFz', '0', '0');
INSERT INTO `pengguna` VALUES ('23', 'Ginanjar Septiana Supardiansyah', 'ginanjarsetiana4@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '0fae158952bdf312208d5b2d1d94d657', '0', 'uhqQNSNjcb2J98kU6ZDSfVXmZGdv644odTAWIgCCwxMzLnc3g5OvQTEk8FyxKXzf', '0', '0');
INSERT INTO `pengguna` VALUES ('24', 'Ika Kharismadewi', 'rismaika016@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'd4da8d9e6e5c4b1c9db7b01bb7c6c5b3', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('25', 'Irfan Agung Purnomo', 'agungirfan630@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'ccbc7fda6d3cf74cf2a0c6be76ef05bf', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('26', 'Mila Noni Alfiolita', 'milanoni99@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'aef2afc5eceadab86921beb9b02b1904', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('27', 'Lisa Helendriani', 'lisahelend19@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '822ad60fd167aff9c07af373cbe0ef72', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('28', 'Ermian Hotnauli Silalahi', 'ermianhotnauli@yahoo.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86f9933c52433750c83590a234555e67', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('29', 'Nafika Fikria Arifianda', 'nafikafikriaarifianda@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8941a8eff97ee4405e9e2781e32ffbf5', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('30', 'Nur Roudlotul Jannah', 'nurroudloh.nrj@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'becb73795b3cdf701973a5f4c46a7c0a', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('31', 'Made Ema Parurahwani', 'emamade4@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '4d7ef38325543457eb2cb9cefce36214', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('32', 'Lailatul Mufida', 'ellamufida.00@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'ac03ebfafd59b65f494bf5d9cda778ad', '0', 'Ntpd1XMzP92YuXA4FrDWcqT4kEnyhLcSzISNJebyFZbio8QqW5ajpox7JOBlemi2', '0', '0');
INSERT INTO `pengguna` VALUES ('33', 'Deah Arta Muviana', 'damuviana@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'cfb5a8202eb4e890a9195c9a7e08c7c1', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('34', 'Maziyatus Sariroh Yusro', 'sariroh74@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '3e06f2af88392a8943c423d7d36d307a', '0', 'c4S26xi9BmkRgLerbk0EX2IbZNtds8asGOCNtFwenjl8LyQYdXVA953BhDTVRnZO', '0', '0');
INSERT INTO `pengguna` VALUES ('35', 'Maulidiyah Wiahnanda', 'diyahnanda6@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '77c84df87bcf58cc132ce5119f4623a8', '0', '5RhbmLiN8dCzkGn7pBoD4mkEvMjLKuoYsz0Oyl3XTVerthMFXN37b9x2gZBqeQPI', '0', '0');
INSERT INTO `pengguna` VALUES ('36', 'Meridza Nur Audina', 'audinameridza@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '9c38e42876b09f089ea4a4b5dc7b84ae', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('37', 'Kurniawan Prasetyo', 'kurniawan1161@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '2803f0d8de6c6b2d80121f23489e3553', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('38', 'Maqfirotul Laily', 'maqfirotullaily23@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'a24229a75305bf7052d5b2f1a2a428b8', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('39', 'Kurniawan Prasetyo 1161', 'kurniawan1161@yahoo.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '3ee2a3262b635039690c7ffa88db860f', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('40', 'Eka Zunita Nurfadilah', 'ekazunitanurfadila@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6a1b3f1a6f1facf5e9c940b34c76b092', '0', 'TPBdmGKHBoxVNpQXUhzqtY6bIWEqMouV5FDybe8QxejzCUR3R2OtLSgg7GXAYHcE', '0', '0');
INSERT INTO `pengguna` VALUES ('41', 'Isvina Uma Izah', 'isvinaumaizah1@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'b4e1cb52739e7a0340881d40b1cd95fe', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('42', 'Agam Firdaus Junaidi', 'agamjunaidi010@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'd7bf52d2a0b546a735cc9f15730bfc82', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('43', 'Istiqomah Ahsanu Amala', 'istiamala28@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86d9bcae56114714da37d1a7938e8d59', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('44', 'Dea Putri Lailatul Qudus', 'deaputri0527@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '331dfed457ebeee3e3bceb98f54a7243', '0', '1fCJurTyWC0PVNStRbN6dB9HqscAKWd7zDPQqf48vLUcoX1yGQeZSOen3Oh5E3GD', '0', '0');
INSERT INTO `pengguna` VALUES ('45', 'Moh Hasan Safroni', 'hassansaffroni@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6dc08c1e5df2e0152d1fb6a3eaf6b726', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('46', 'Indah Larasati', '1999indah@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '347101d0ff2538bc3f71a4c17831bdbc', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('47', 'Moch. Romadhoni', 'mochromadhoni20@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '261a794363c16c2a9969c2ee093673d6', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('48', 'Milasari Saharuddin', 'Milathahir@yahoo.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '5fc81072e9e3ea0558f417741d5da990', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('49', 'Leonarda Indra Suryati', 'nardasuryati@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '1762c9584d2822920b91ea8d0a83d1ec', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('50', 'Mareta Bunga Pratiwi', 'maretabungapratiwi@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '65f5613ed4048b905a51997d67cd0d80', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('51', 'Ahmad Dian Tri Raharjo', 'ahmaddiantriraharjo@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '41fe7581cfcb26bcbe22700512c6fcd0', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('52', 'Faricha Alif Vaniza', 'aliffaricha@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'de27825fca35ba8492b08765cda6cf98', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('53', 'Ibnu', 'ibnuspeedster@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permasalahan
-- ----------------------------
INSERT INTO `permasalahan` VALUES ('1', 'Dalam dua minggu kedepan, saya akan mengajar materi tenses untuk siswa kelas tiga SD. Adakah yang dapat membantu merancang media presentasi yang interaktif untuk membuat siswa lebih terlibat dalam materi pelajaran? Terima kasih', '2018-11-16 14:20:35', '18', '0', '0', '0', '5', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('2', 'Saya membutuhkan bantuan untuk melaksanakan PTK untuk materi geometri di kelas VII, adakah yang bisa mengembangkan media tayangannya? Terima kasih', '2018-11-16 14:21:57', '16', '0', '0', '0', '1', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('3', 'Saya ingin melaksanakan PTK di materi tari kreasi untuk siswa SMA kelas XI, adakah yang dapat membantu merancang judul? Terima kasih', '2018-11-16 14:22:59', '14', '0', '0', '0', '2', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('4', 'saya mau menyusun PTK dimateri servis bola voli, adakah yang dapat membantu merancang proposal dan media tayangan tutorial? Terima kasih', '2018-11-16 14:24:53', '15', '0', '0', '0', '3', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('5', 'Saya membutuhkan bantuan dalam membuat lesson plan berbasis pembelajaran berbasis proyek untuk materi \"perubahan zat\" untuk anak kelas 5 SD. Terima kasih ', '2018-11-16 14:25:42', '17', '0', '0', '0', '6', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('7', 'Saya mebutuhkan media 3D untuk pelajaran anatomi tubuh manusia dalam bentuk digital! ', '2018-11-16 19:15:13', '20', '3', '0', '3', '3', 'UNSOLVED', 'ACTIVE');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of riwayat_permasalahan_dilihat
-- ----------------------------
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('1', '4', '7', '2018-11-16 19:09:46');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('2', '6', '7', '2018-11-16 19:11:00');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('3', '7', '7', '2018-11-16 19:11:55');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tags
-- ----------------------------
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
