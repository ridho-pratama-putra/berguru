/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : berguru

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-11-08 20:43:15
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('1', '2', 'materi/Kimia/Aplikasi_Zakat.pdf');
INSERT INTO `attachment` VALUES ('2', '2', 'materi/Kimia/atlassian-git-cheatsheet.pdf');
INSERT INTO `attachment` VALUES ('3', '2', 'materi/Kimia/buku-data-penduduk-sasaran-program-pembangunan-kesehatan-2011-2014.pdf');
INSERT INTO `attachment` VALUES ('4', '1', 'materi/Kimia/Aplikasi_Zakat.pdf');
INSERT INTO `attachment` VALUES ('5', '1', 'materi/Kimia/atlassian-git-cheatsheet.pdf');
INSERT INTO `attachment` VALUES ('6', '1', 'materi/Kimia/buku-data-penduduk-sasaran-program-pembangunan-kesehatan-2011-2014.pdf');
INSERT INTO `attachment` VALUES ('7', '1', 'materi/Kimia/downloadfile.pdf');
INSERT INTO `attachment` VALUES ('8', '1', 'materi/Kimia/krs140535605307.pdf');
INSERT INTO `attachment` VALUES ('9', '1', 'materi/Kimia/krs140535605550.pdf');
INSERT INTO `attachment` VALUES ('10', '1', 'materi/Kimia/krs140535605590__20173.pdf');
INSERT INTO `attachment` VALUES ('11', '1', 'materi/Kimia/krs140535605806__20173.pdf');
INSERT INTO `attachment` VALUES ('12', '1', 'materi/Kimia/krs140535605814.pdf');
INSERT INTO `attachment` VALUES ('13', '1', 'materi/Kimia/krs140535605990.pdf');
INSERT INTO `attachment` VALUES ('14', '1', 'materi/Kimia/krs140535606662.pdf');
INSERT INTO `attachment` VALUES ('15', '1', 'materi/Kimia/krs140535605307.pdf');
INSERT INTO `attachment` VALUES ('16', '1', 'materi/Kimia/krs140535605550.pdf');
INSERT INTO `attachment` VALUES ('17', '1', 'materi/Kimia/krs140535605590__20173.pdf');
INSERT INTO `attachment` VALUES ('18', '1', 'materi/Kimia/krs140535605806__20173.pdf');
INSERT INTO `attachment` VALUES ('19', '1', 'materi/Kimia/krs140535605814.pdf');
INSERT INTO `attachment` VALUES ('20', '1', 'materi/Kimia/krs140535605990.pdf');
INSERT INTO `attachment` VALUES ('21', '1', 'materi/Kimia/krs140535606662.pdf');
INSERT INTO `attachment` VALUES ('22', '1', 'materi/Kimia/krs140535605307.pdf');
INSERT INTO `attachment` VALUES ('23', '1', 'materi/Kimia/krs140535605550.pdf');
INSERT INTO `attachment` VALUES ('24', '1', 'materi/Kimia/krs140535605590__20173.pdf');
INSERT INTO `attachment` VALUES ('25', '1', 'materi/Kimia/krs140535605806__20173.pdf');
INSERT INTO `attachment` VALUES ('26', '1', 'materi/Kimia/krs140535605814.pdf');
INSERT INTO `attachment` VALUES ('27', '1', 'materi/Kimia/krs140535605990.pdf');
INSERT INTO `attachment` VALUES ('28', '1', 'materi/Kimia/krs140535606662.pdf');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of direct_message
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of kategori
-- ----------------------------
INSERT INTO `kategori` VALUES ('1', 'Kimia', '2018-11-05', '1', '3', 'ACTIVE', '', 'materi/Kimia');

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
INSERT INTO `komentar` VALUES ('1', 'lalalala\r\n', '2018-11-06 07:19:27', '2', '1', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('2', 'lilili', '2018-11-06 07:20:15', '2', '1', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('3', 'lolololo', '2018-11-06 07:21:19', '2', '1', '0', null, null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of max_notif_id_per_user
-- ----------------------------
INSERT INTO `max_notif_id_per_user` VALUES ('1', '1', '1');
INSERT INTO `max_notif_id_per_user` VALUES ('2', '2', '9');
INSERT INTO `max_notif_id_per_user` VALUES ('3', '3', '6');
INSERT INTO `max_notif_id_per_user` VALUES ('4', '4', '14');
INSERT INTO `max_notif_id_per_user` VALUES ('5', '5', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('6', '6', '6');
INSERT INTO `max_notif_id_per_user` VALUES ('7', '7', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('8', '2', '9');
INSERT INTO `max_notif_id_per_user` VALUES ('9', '3', '6');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notif
-- ----------------------------
INSERT INTO `notif` VALUES ('3', 'pertanyaan', '1', '3', 'mahasiswa', '2018-11-06 07:18:41', null, null);
INSERT INTO `notif` VALUES ('4', 'komentar', '1', '2', '3', '2018-11-06 07:19:27', null, null);
INSERT INTO `notif` VALUES ('5', 'komentar', '1', '2', '3', '2018-11-06 07:20:15', null, null);
INSERT INTO `notif` VALUES ('6', 'komentar', '1', '2', '3', '2018-11-06 07:21:19', null, null);
INSERT INTO `notif` VALUES ('7', 'ratingKomentar', '1', '3', '2', '2018-11-06 07:26:41', null, null);
INSERT INTO `notif` VALUES ('8', 'ratingKomentar', '1', '3', '2', '2018-11-06 07:26:44', null, null);
INSERT INTO `notif` VALUES ('9', 'ratingKomentar', '1', '3', '2', '2018-11-06 07:26:45', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notif_flag
-- ----------------------------
INSERT INTO `notif_flag` VALUES ('3', '2', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('4', '3', '6', '1', '0');
INSERT INTO `notif_flag` VALUES ('5', '3', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('6', '3', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('7', '2', '9', '1', '0');
INSERT INTO `notif_flag` VALUES ('8', '2', '8', '1', '0');
INSERT INTO `notif_flag` VALUES ('9', '2', '7', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES ('1', 'Admin', 'admin@admin.com', null, null, null, '0', 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('2', 'Maha Siswa', 'mahasiswa@mahasiswa.com', '+6289987009', null, null, '0', 'ACTIVE', 'mahasiswa', 'userprofiles/Maha_Siswa_-_profil.jpg', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('3', 'Guruururu', 'guru@guru.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Guruururu_-_profil.jpg', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');

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
INSERT INTO `permasalahan` VALUES ('1', 'iuaihgsvbdnma', '2018-11-06 07:18:41', '3', '1', '0', '3', '1', 'UNSOLVED', 'ACTIVE');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of riwayat_permasalahan_dilihat
-- ----------------------------
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('1', '2', '1', '2018-11-06 07:19:13');

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
