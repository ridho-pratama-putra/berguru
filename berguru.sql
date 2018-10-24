/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : berguru

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-10-24 09:41:14
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
INSERT INTO `kategori` VALUES ('1', 'Matematika', '2018-10-22', '0', '0', 'ACTIVE', 'fa-puzzle-piece', 'materi/Matematika');
INSERT INTO `kategori` VALUES ('2', 'Seni Budaya', '2018-10-22', '1', '0', 'ACTIVE', 'fa-globe', 'materi/Seni Budaya');
INSERT INTO `kategori` VALUES ('3', 'Penjaskes', '2018-10-22', '1', '0', 'ACTIVE', 'fa-flask', 'materi/Penjaskes');
INSERT INTO `kategori` VALUES ('4', 'Bahasa Indonesia', '2018-10-22', '0', '0', 'ACTIVE', 'fa-users', 'materi/Bahasa Indonesia');
INSERT INTO `kategori` VALUES ('5', 'Bahasa Inggris', '2018-10-22', '0', '0', 'ACTIVE', 'fa-book', 'materi/Bahasa Inggris');
INSERT INTO `kategori` VALUES ('6', 'Kimia', '2018-10-22', '0', '0', 'ACTIVE', 'fa-bicycle', 'materi/Kimia');
INSERT INTO `kategori` VALUES ('7', 'Fisika', '2018-10-22', '0', '0', 'ACTIVE', 'fa-flag', 'materi/Fisika');

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
  `solver` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
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
INSERT INTO `komentar` VALUES ('1', 'boleh2', '2018-10-24 09:22:38', '2', '2', null, null);
INSERT INTO `komentar` VALUES ('2', 'nggak ah, aku takut kesurupan', '2018-10-24 09:24:05', '2', '1', null, null);
INSERT INTO `komentar` VALUES ('3', 'aku ikut, aku mau jadi jarannya, siapa mau naik', '2018-10-24 09:25:10', '4', '1', null, null);
INSERT INTO `komentar` VALUES ('4', 'aku udah siap nih, cuss', '2018-10-24 09:26:04', '4', '1', null, null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lowongan
-- ----------------------------

-- ----------------------------
-- Table structure for mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `mahasiswa`;
CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `universitas` varchar(255) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `report` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mahasiswa
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of max_notif_id_per_user
-- ----------------------------
INSERT INTO `max_notif_id_per_user` VALUES ('1', '1', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('2', '2', '2');
INSERT INTO `max_notif_id_per_user` VALUES ('3', '3', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('4', '4', '2');

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
-- Table structure for notif_mhs_per_user
-- ----------------------------
DROP TABLE IF EXISTS `notif_mhs_per_user`;
CREATE TABLE `notif_mhs_per_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `id_notif` varchar(255) DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL,
  `terbaca` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notif_mhs_per_user
-- ----------------------------
INSERT INTO `notif_mhs_per_user` VALUES ('1', '2', '1', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('2', '2', '2', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('3', '4', '2', '1', '0');
INSERT INTO `notif_mhs_per_user` VALUES ('4', '4', '1', '1', '0');

-- ----------------------------
-- Table structure for notif_permasalahan
-- ----------------------------
DROP TABLE IF EXISTS `notif_permasalahan`;
CREATE TABLE `notif_permasalahan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permasalahan` int(11) DEFAULT NULL,
  `dari` varchar(255) DEFAULT NULL,
  `untuk` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL COMMENT 'sudah diilhat di notif',
  `terbaca` varchar(255) DEFAULT NULL COMMENT 'terlihat dengan detil melaui klik pada notif',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notif_permasalahan
-- ----------------------------
INSERT INTO `notif_permasalahan` VALUES ('1', '1', '3', 'mahasiswa', '2018-10-22 22:24:02', null, null);
INSERT INTO `notif_permasalahan` VALUES ('2', '2', '3', 'mahasiswa', '2018-10-23 17:36:32', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES ('1', 'admin', 'admin@admin.com', '+6289987009', null, null, '0', 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', '8Xs4bPdJ7QnoRf2ryNgsEf9X7quKLaY4hz3aHxwKHcSVtoMvbg0ehEmpjenA9Oyr', '0', '0');
INSERT INTO `pengguna` VALUES ('2', 'Maha Siswa', 'mahasiswa@mahasiswa.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('3', 'Maha Guru', 'guru@guru.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('4', 'Siswa Siswi', 'siswa@siswa.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permasalahan
-- ----------------------------
INSERT INTO `permasalahan` VALUES ('1', 'jaran kepangan yuk?', '2018-10-22 22:24:02', '3', '2', '0', '3', '2', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('2', 'lari pagi yuk??', '2018-10-23 17:36:32', '3', '1', '0', '1', '3', 'UNSOLVED', 'ACTIVE');

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
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('1', '2', '2', '2018-10-24 09:21:18');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('2', '2', '1', '2018-10-24 09:23:51');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('3', '4', '1', '2018-10-24 09:24:43');

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
CREATE TRIGGER `tambah_jumlah_komen_permasalahan` AFTER INSERT ON `komentar` FOR EACH ROW UPDATE permasalahan SET jumlah_komen = jumlah_komen + 1 WHERE permasalahan.id=NEW.permasalahan
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `kurangi_jumlah_komen_permasalahan`;
DELIMITER ;;
CREATE TRIGGER `kurangi_jumlah_komen_permasalahan` AFTER DELETE ON `komentar` FOR EACH ROW UPDATE permasalahan SET jumlah_komen = jumlah_komen - 1 WHERE permasalahan.id = OLD.permasalahan
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tambah_jumlah_dilihat_permasalahan`;
DELIMITER ;;
CREATE TRIGGER `tambah_jumlah_dilihat_permasalahan` AFTER INSERT ON `riwayat_permasalahan_dilihat` FOR EACH ROW UPDATE permasalahan SET jumlah_dilihat = jumlah_dilihat + 1 WHERE permasalahan.id = NEW.permasalahan
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `kurangi_jumlah_dilihat_permasalahan`;
DELIMITER ;;
CREATE TRIGGER `kurangi_jumlah_dilihat_permasalahan` AFTER DELETE ON `riwayat_permasalahan_dilihat` FOR EACH ROW UPDATE permasalahan SET jumlah_dilihat = jumlah_dilihat - 1 WHERE permasalahan.id = OLD.permasalahan
;;
DELIMITER ;
