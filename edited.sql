
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materi` int(11) DEFAULT NULL,
  `url_attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materi_attachment` (`id_materi`),
  CONSTRAINT `id_materi_attachment` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
-- Table structure for max_notif_id_per_user
-- ----------------------------
DROP TABLE IF EXISTS `max_notif_id_per_user`;
CREATE TABLE `max_notif_id_per_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `max_notif_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `max_notif_id_per_user`
--

INSERT INTO `max_notif_id_per_user` (`id`, `id_pengguna`, `max_notif_id`) VALUES
(1, '1', 0),
(2, '2', 0),
(3, '3', 0),
(4, '4', 0),
(5, '5', 0),
(6, '6', 0),
(7, '7', 0),
(8, '2', 0),
(9, '3', 0),
(10, '4', 0),
(11, '5', 0),
(12, '6', 0),
(13, '7', 0),
(14, '8', 0),
(15, '9', 0),
(16, '10', 0),
(17, '11', 0),
(18, '12', 0),
(19, '13', 0),
(20, '14', 0),
(21, '15', 0),
(22, '16', 0),
(23, '17', 0),
(24, '18', 0),
(25, '19', 0),
(26, '20', 0),
(27, '21', 0),
(28, '22', 0),
(29, '23', 0),
(30, '24', 0),
(31, '25', 0),
(32, '26', 0),
(33, '27', 0),
(34, '28', 0),
(35, '29', 0),
(36, '30', 0),
(37, '31', 0),
(38, '32', 0),
(39, '33', 0),
(40, '34', 0),
(41, '35', 0),
(42, '36', 0),
(43, '37', 0),
(44, '38', 0),
(45, '39', 0),
(46, '40', 0),
(47, '41', 0),
(48, '42', 0),
(49, '43', 0),
(50, '44', 0),
(51, '45', 0),
(52, '46', 0),
(53, '47', 0),
(54, '48', 0),
(55, '49', 0),
(56, '50', 0),
(57, '51', 0),
(58, '52', 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `no_hp`, `institusi_or_universitas`, `nip_or_nim`, `report`, `status`, `aktor`, `foto`, `password`, `poin`, `cookie`, `jumlah_dm`, `jumlah_dm_solved`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, NULL, NULL, 0, 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, 'nDCOmo84VzcKvMjbQ1hFF69sWZRYSI7T6EbuwGpmrnGtkelg0dP5J2PRLuwNDVx7', 0, 0),
(2, 'Maha Siswa', 'mahasiswa@mahasiswa.com', '+6289987009', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'userprofiles/Maha_Siswa_-_profil.jpg', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(3, 'Guruururu', 'guru@guru.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Guruururu_-_profil.jpg', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(4, 'Anton Bayangkara', 'anton@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(5, 'Bagus Sandika', 'bagus@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(6, 'Cintya Restu', 'cintya@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(7, 'Dea Amanda', 'dea@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(8, 'Emilia Rina', 'emil@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(9, 'Farah Nabila', 'farah@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(10, 'Gina Sabrina', 'gina@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(11, 'Hamid Dian', 'hamid@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(12, 'Irfan Joni', 'irfan@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(13, 'Jaka Umbara', 'jaka@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(14, 'Mulyadi Fadil', 'mulyadi@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(15, 'Hasan Wirayudha', 'hasan@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(16, 'Evania Yafie', 'evania@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(17, 'Ni Luh Sakinah', 'niluh@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(18, 'Herlina Ike', 'herlina@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(19, 'Ence Surahman', 'ence@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(20, 'Yerry Soepriyanto', 'yerry@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(21, 'Henry Praherdhiono', 'henry@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(22, 'Miftakhul Sholikhah', 'miftakhulsholikhah@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'c68737b0ef27a9a79d936caa9b0ec1fe', 0, 'NTYIwLaQxvJchDukEBaT0LFn2Qg7ecgbXOdCSp2UKR9hdtu9M4rklwy7G6rzWsFz', 0, 0),
(23, 'Ginanjar Septiana Supardiansyah', 'ginanjarsetiana4@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '0fae158952bdf312208d5b2d1d94d657', 0, 'uhqQNSNjcb2J98kU6ZDSfVXmZGdv644odTAWIgCCwxMzLnc3g5OvQTEk8FyxKXzf', 0, 0),
(24, 'Ika Kharismadewi', 'rismaika016@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'd4da8d9e6e5c4b1c9db7b01bb7c6c5b3', 0, NULL, 0, 0),
(25, 'Irfan Agung Purnomo', 'agungirfan630@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'ccbc7fda6d3cf74cf2a0c6be76ef05bf', 0, NULL, 0, 0),
(26, 'Mila Noni Alfiolita', 'milanoni99@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'aef2afc5eceadab86921beb9b02b1904', 0, NULL, 0, 0),
(27, 'Lisa Helendriani', 'lisahelend19@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '822ad60fd167aff9c07af373cbe0ef72', 0, NULL, 0, 0),
(28, 'Ermian Hotnauli Silalahi', 'ermianhotnauli@yahoo.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86f9933c52433750c83590a234555e67', 0, NULL, 0, 0),
(29, 'Nafika Fikria Arifianda', 'nafikafikriaarifianda@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8941a8eff97ee4405e9e2781e32ffbf5', 0, NULL, 0, 0),
(30, 'Nur Roudlotul Jannah', 'nurroudloh.nrj@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'becb73795b3cdf701973a5f4c46a7c0a', 0, NULL, 0, 0),
(31, 'Made Ema Parurahwani', 'emamade4@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '4d7ef38325543457eb2cb9cefce36214', 0, NULL, 0, 0),
(32, 'Lailatul Mufida', 'ellamufida.00@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'ac03ebfafd59b65f494bf5d9cda778ad', 0, 'Ntpd1XMzP92YuXA4FrDWcqT4kEnyhLcSzISNJebyFZbio8QqW5ajpox7JOBlemi2', 0, 0),
(33, 'Deah Arta Muviana', 'damuviana@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'cfb5a8202eb4e890a9195c9a7e08c7c1', 0, NULL, 0, 0),
(34, 'Maziyatus Sariroh Yusro', 'sariroh74@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '3e06f2af88392a8943c423d7d36d307a', 0, 'c4S26xi9BmkRgLerbk0EX2IbZNtds8asGOCNtFwenjl8LyQYdXVA953BhDTVRnZO', 0, 0),
(35, 'Maulidiyah Wiahnanda', 'diyahnanda6@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '77c84df87bcf58cc132ce5119f4623a8', 0, '5RhbmLiN8dCzkGn7pBoD4mkEvMjLKuoYsz0Oyl3XTVerthMFXN37b9x2gZBqeQPI', 0, 0),
(36, 'Meridza Nur Audina', 'audinameridza@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '9c38e42876b09f089ea4a4b5dc7b84ae', 0, NULL, 0, 0),
(37, 'Kurniawan Prasetyo', 'kurniawan1161@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '2803f0d8de6c6b2d80121f23489e3553', 0, NULL, 0, 0),
(38, 'Maqfirotul Laily', 'maqfirotullaily23@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'a24229a75305bf7052d5b2f1a2a428b8', 0, NULL, 0, 0),
(39, 'Kurniawan Prasetyo 1161', 'kurniawan1161@yahoo.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '3ee2a3262b635039690c7ffa88db860f', 0, NULL, 0, 0),
(40, 'Eka Zunita Nurfadilah', 'ekazunitanurfadila@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6a1b3f1a6f1facf5e9c940b34c76b092', 0, 'TPBdmGKHBoxVNpQXUhzqtY6bIWEqMouV5FDybe8QxejzCUR3R2OtLSgg7GXAYHcE', 0, 0),
(41, 'Isvina Uma Izah', 'isvinaumaizah1@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'b4e1cb52739e7a0340881d40b1cd95fe', 0, NULL, 0, 0),
(42, 'Agam Firdaus Junaidi', 'agamjunaidi010@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'd7bf52d2a0b546a735cc9f15730bfc82', 0, NULL, 0, 0),
(43, 'Istiqomah Ahsanu Amala', 'istiamala28@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86d9bcae56114714da37d1a7938e8d59', 0, NULL, 0, 0),
(44, 'Dea Putri Lailatul Qudus', 'deaputri0527@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '331dfed457ebeee3e3bceb98f54a7243', 0, '1fCJurTyWC0PVNStRbN6dB9HqscAKWd7zDPQqf48vLUcoX1yGQeZSOen3Oh5E3GD', 0, 0),
(45, 'Moh Hasan Safroni', 'hassansaffroni@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6dc08c1e5df2e0152d1fb6a3eaf6b726', 0, NULL, 0, 0),
(46, 'Indah Larasati', '1999indah@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '347101d0ff2538bc3f71a4c17831bdbc', 0, NULL, 0, 0),
(47, 'Moch. Romadhoni', 'mochromadhoni20@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '261a794363c16c2a9969c2ee093673d6', 0, NULL, 0, 0),
(48, 'Milasari Saharuddin', 'Milathahir@yahoo.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '5fc81072e9e3ea0558f417741d5da990', 0, NULL, 0, 0),
(49, 'Leonarda Indra Suryati', 'nardasuryati@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '1762c9584d2822920b91ea8d0a83d1ec', 0, NULL, 0, 0),
(50, 'Mareta Bunga Pratiwi', 'maretabungapratiwi@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '65f5613ed4048b905a51997d67cd0d80', 0, NULL, 0, 0),
(51, 'Ahmad Dian Tri Raharjo', 'ahmaddiantriraharjo@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '41fe7581cfcb26bcbe22700512c6fcd0', 0, NULL, 0, 0),
(52, 'Faricha Alif Vaniza', 'aliffaricha@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'de27825fca35ba8492b08765cda6cf98', 0, NULL, 0, 0);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------

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
