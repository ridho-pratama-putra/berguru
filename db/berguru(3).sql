-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 09, 2018 at 03:49 AM
-- Server version: 5.5.59-0ubuntu0.14.04.1
-- PHP Version: 7.2.8-1+ubuntu14.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `berguru`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE IF NOT EXISTS `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materi` int(11) DEFAULT NULL,
  `url_attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materi_attachment` (`id_materi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `direct_message`
--

CREATE TABLE IF NOT EXISTS `direct_message` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah_pertanyaan` varchar(255) DEFAULT NULL,
  `jumlah_jawaban` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `nama_folder` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `tanggal`, `jumlah_pertanyaan`, `jumlah_jawaban`, `status`, `icon`, `nama_folder`) VALUES
(1, 'Matematika', '2018-11-08', '1', '0', 'ACTIVE', '', 'materi/Matematika'),
(2, 'Seni Budaya', '2018-11-08', '1', '0', 'ACTIVE', '', 'materi/Seni Budaya'),
(3, 'Penjaskes', '2018-11-08', '1', '1', 'ACTIVE', '', 'materi/Penjaskes'),
(4, 'Bahasa Indonesia', '2018-11-08', '1', '0', 'ACTIVE', '', 'materi/Bahasa Indonesia'),
(5, 'Bahasa Inggris', '2018-11-08', '1', '0', 'ACTIVE', '', 'materi/Bahasa Inggris'),
(6, 'Kimia', '2018-11-08', '1', '1', 'ACTIVE', '', 'materi/Kimia'),
(7, 'Fisika', '2018-11-08', '0', '0', 'ACTIVE', '', 'materi/Fisika');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
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
  KEY `siapa_komen` (`siapa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `teks`, `tanggal`, `siapa`, `permasalahan`, `kategori_permasalahan`, `solver`, `parent`, `rating`) VALUES
(1, 'Saya mahasiswa dari Prodi Penjas pak, dulu pernah membuat video tutorial servis dan pass bola voli untuk pemula. Semoga nanti bisa membantu menyelesaikan PTK dikelas bapak.', '2018-11-08 23:55:27', 6, 4, 0, NULL, NULL, NULL),
(2, 'Saya pernah membuat lesson plan untuk materi benda padat bu, dengan menggunakan pendekatan inkuiri. Mungkin sangat akan membantu dalam pengembangan PBL.', '2018-11-08 23:58:55', 4, 5, 0, NULL, NULL, NULL);

--
-- Triggers `komentar`
--
DROP TRIGGER IF EXISTS `kurangi_jumlah_komen_permasalahan`;
DELIMITER //
CREATE TRIGGER `kurangi_jumlah_komen_permasalahan` AFTER DELETE ON `komentar`
 FOR EACH ROW BEGIN
UPDATE permasalahan SET jumlah_komen = jumlah_komen - 1 WHERE permasalahan.id = OLD.permasalahan;
UPDATE kategori SET jumlah_jawaban = jumlah_jawaban - 1 WHERE kategori.id = (SELECT permasalahan.kategori FROM permasalahan WHERE permasalahan.id = OLD.permasalahan);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `tambah_jumlah_komen_permasalahan`;
DELIMITER //
CREATE TRIGGER `tambah_jumlah_komen_permasalahan` AFTER INSERT ON `komentar`
 FOR EACH ROW BEGIN
UPDATE permasalahan SET jumlah_komen = jumlah_komen + 1 WHERE permasalahan.id=NEW.permasalahan;
UPDATE kategori SET jumlah_jawaban = jumlah_jawaban + 1 WHERE kategori.id = (SELECT permasalahan.kategori FROM permasalahan WHERE permasalahan.id = NEW.permasalahan);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `komentar_message`
--

CREATE TABLE IF NOT EXISTS `komentar_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teks` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `siapa` (`siapa`),
  KEY `message` (`message`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lowongan`
--

CREATE TABLE IF NOT EXISTS `lowongan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` text,
  `instansi` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `kontak` varchar(255) DEFAULT NULL,
  `valid` int(11) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `dari` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `lowongan`
--

INSERT INTO `lowongan` (`id`, `nama`, `instansi`, `lokasi`, `kontak`, `valid`, `kategori`, `tanggal`, `dari`) VALUES
(1, 'Guru Tingkat SD yang Ulet, Bisa Microsoft Office Nilai Plus', 'SMAN 2 Surabaya', 'Surabaya', '+6281840345714', 1, NULL, '2018-11-09 00:23:08', 3),
(2, 'Guru Tingkat SMP yang Ulet, Bisa Microsoft Office Nilai Plus', 'SMPN 2 MALANG', 'Kota Malang, Jwa Timur', '+628388845076', 1, NULL, '2018-11-09 01:39:02', 2),
(3, 'Guru Tingkat MI/SD yang Ulet, Bisa Microsoft Office Nilai Plus', 'MIN 2 MALANG', 'Kota Malang, Jawa Timur', '+628388845076', 1, NULL, '2018-11-09 02:29:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `materi`
--

CREATE TABLE IF NOT EXISTS `materi` (
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
  KEY `siapa_terakhir_edit_materi` (`siapa_terakhir_edit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `max_notif_id_per_user`
--

CREATE TABLE IF NOT EXISTS `max_notif_id_per_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `max_notif_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `max_notif_id_per_user`
--

INSERT INTO `max_notif_id_per_user` (`id`, `id_pengguna`, `max_notif_id`) VALUES
(1, '1', 9),
(2, '2', 26),
(3, '3', 17),
(4, '4', 6),
(5, '5', 0),
(6, '6', 6),
(7, '7', 0),
(8, '2', 26),
(9, '3', 17),
(10, '4', 6),
(11, '5', 0),
(12, '6', 6),
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
(27, '21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teks` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `beku` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `siapa_tendik_message` (`siapa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notif`
--

CREATE TABLE IF NOT EXISTS `notif` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `konteks` varchar(255) DEFAULT NULL COMMENT 'isinya permasalahan || dm || lainnya || komentar',
  `id_konteks` int(11) DEFAULT NULL COMMENT 'bisa id_permasalahan || id_DM || komentar || lainlain',
  `dari` int(11) DEFAULT NULL,
  `untuk` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL COMMENT 'sudah diilhat di notif',
  `terbaca` varchar(255) DEFAULT NULL COMMENT 'terlihat dengan detil melaui klik pada notif',
  PRIMARY KEY (`id`),
  KEY `dari_pengguna` (`dari`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `notif`
--

INSERT INTO `notif` (`id`, `konteks`, `id_konteks`, `dari`, `untuk`, `datetime`, `terlihat`, `terbaca`) VALUES
(1, 'pertanyaan', 1, 18, 'mahasiswa', '2018-11-08 23:44:36', NULL, NULL),
(2, 'pertanyaan', 2, 16, 'mahasiswa', '2018-11-08 23:45:46', NULL, NULL),
(3, 'pertanyaan', 3, 14, 'mahasiswa', '2018-11-08 23:46:43', NULL, NULL),
(4, 'pertanyaan', 4, 15, 'mahasiswa', '2018-11-08 23:47:39', NULL, NULL),
(5, 'pertanyaan', 5, 17, 'mahasiswa', '2018-11-08 23:48:52', NULL, NULL),
(6, 'pertanyaan', 6, 20, 'mahasiswa', '2018-11-08 23:49:49', NULL, NULL),
(7, 'komentar', 4, 6, '15', '2018-11-08 23:55:27', NULL, NULL),
(8, 'komentar', 5, 4, '17', '2018-11-08 23:58:55', NULL, NULL),
(12, 'lowonganValid', 2, 1, '2', '2018-11-09 03:27:28', NULL, NULL),
(25, 'lowonganValid', 1, 1, '3', '2018-11-09 03:48:01', NULL, NULL),
(26, 'lowonganAvailable', 1, 1, 'semua', '2018-11-09 03:48:01', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notif_flag`
--

CREATE TABLE IF NOT EXISTS `notif_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `id_notif` int(11) DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL,
  `terbaca` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_notif_notif` (`id_notif`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `notif_flag`
--

INSERT INTO `notif_flag` (`id`, `id_pengguna`, `id_notif`, `terlihat`, `terbaca`) VALUES
(1, '6', 6, '1', '0'),
(2, '6', 5, '1', '0'),
(3, '6', 4, '1', '0'),
(4, '6', 3, '1', '0'),
(5, '6', 2, '1', '0'),
(6, '6', 1, '1', '0'),
(7, '4', 6, '1', '0'),
(8, '4', 5, '1', '0'),
(9, '4', 4, '1', '0'),
(10, '4', 3, '1', '0'),
(11, '4', 2, '1', '0'),
(12, '4', 1, '1', '0'),
(13, '2', 6, '1', '0'),
(14, '2', 5, '1', '0'),
(15, '2', 4, '1', '0'),
(16, '2', 3, '1', '0'),
(17, '2', 2, '1', '0'),
(18, '2', 1, '1', '0'),
(27, '2', 12, '1', '0'),
(28, '2', 26, '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `no_hp`, `institusi_or_universitas`, `nip_or_nim`, `report`, `status`, `aktor`, `foto`, `password`, `poin`, `cookie`, `jumlah_dm`, `jumlah_dm_solved`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, NULL, NULL, 0, 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
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
(21, 'Henry Praherdhiono', 'henry@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permasalahan`
--

CREATE TABLE IF NOT EXISTS `permasalahan` (
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
  KEY `siapa_add` (`siapa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `permasalahan`
--

INSERT INTO `permasalahan` (`id`, `teks`, `tanggal`, `siapa`, `jumlah_dilihat`, `jumlah_dibaca`, `jumlah_komen`, `kategori`, `status`, `beku`) VALUES
(1, 'Dalam dua minggu kedepan, saya akan mengajar materi tenses untuk siswa kelas tiga SD. Adakah yang dapat membantu merancang media presentasi yang interaktif untuk membuat siswa lebih terlibat dalam materi pelajaran? Terima kasih', '2018-11-08 23:44:36', 18, 0, 0, 0, 5, 'UNSOLVED', 'ACTIVE'),
(2, 'Saya membutuhkan bantuan untuk melaksanakan PTK untuk materi geometri di kelas VII, adakah yang bisa mengembangkan media tayangannya? Terima kasih', '2018-11-08 23:45:46', 16, 0, 0, 0, 1, 'UNSOLVED', 'ACTIVE'),
(3, 'Saya ingin melaksanakan PTK di materi tari kreasi untuk siswa SMA kelas XI, adakah yang dapat membantu merancang judul? Terima kasih', '2018-11-08 23:46:43', 14, 0, 0, 0, 2, 'UNSOLVED', 'ACTIVE'),
(4, 'saya mau menyusun PTK dimateri servis bola voli, adakah yang dapat membantu merancang proposal dan media tayangan tutorial? Terima kasih', '2018-11-08 23:47:39', 15, 1, 0, 1, 3, 'UNSOLVED', 'ACTIVE'),
(5, 'Saya membutuhkan bantuan dalam membuat lesson plan berbasis pembelajaran berbasis proyek untuk materi "perubahan zat" untuk anak kelas 5 SD. Terima kasih', '2018-11-08 23:48:52', 17, 1, 0, 1, 6, 'UNSOLVED', 'ACTIVE'),
(6, 'Saya ingin melaksanakan PTK dengan topik jenis paragraf dan tulisan, adakah model yang tepat untuk diimplementasikan? Terima kasih', '2018-11-08 23:49:49', 20, 0, 0, 0, 4, 'UNSOLVED', 'ACTIVE');

--
-- Triggers `permasalahan`
--
DROP TRIGGER IF EXISTS `kurangi_jumlah_pertanyaan_di_kategori`;
DELIMITER //
CREATE TRIGGER `kurangi_jumlah_pertanyaan_di_kategori` AFTER DELETE ON `permasalahan`
 FOR EACH ROW UPDATE kategori SET jumlah_pertanyaan = jumlah_pertanyaan - 1 WHERE id = OLD.kategori
//
DELIMITER ;
DROP TRIGGER IF EXISTS `tambah_jumlah_pertanyaan_di_kategori`;
DELIMITER //
CREATE TRIGGER `tambah_jumlah_pertanyaan_di_kategori` AFTER INSERT ON `permasalahan`
 FOR EACH ROW UPDATE kategori SET jumlah_pertanyaan = jumlah_pertanyaan + 1 WHERE id = NEW.kategori
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pesan_info`
--

CREATE TABLE IF NOT EXISTS `pesan_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `penerima` int(11) DEFAULT NULL,
  `subjek` varchar(255) DEFAULT NULL,
  `isi` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penerima` (`penerima`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_permasalahan_dilihat`
--

CREATE TABLE IF NOT EXISTS `riwayat_permasalahan_dilihat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `permasalahan` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `riwayat_permasalahan_dilihat`
--

INSERT INTO `riwayat_permasalahan_dilihat` (`id`, `id_pengguna`, `permasalahan`, `tanggal`) VALUES
(1, '6', 4, '2018-11-08 23:55:14'),
(2, '4', 5, '2018-11-08 23:58:48');

--
-- Triggers `riwayat_permasalahan_dilihat`
--
DROP TRIGGER IF EXISTS `kurangi_jumlah_dilihat_permasalahan`;
DELIMITER //
CREATE TRIGGER `kurangi_jumlah_dilihat_permasalahan` AFTER DELETE ON `riwayat_permasalahan_dilihat`
 FOR EACH ROW UPDATE permasalahan SET jumlah_dilihat = jumlah_dilihat - 1 WHERE permasalahan.id = OLD.permasalahan
//
DELIMITER ;
DROP TRIGGER IF EXISTS `tambah_jumlah_dilihat_permasalahan`;
DELIMITER //
CREATE TRIGGER `tambah_jumlah_dilihat_permasalahan` AFTER INSERT ON `riwayat_permasalahan_dilihat`
 FOR EACH ROW UPDATE permasalahan SET jumlah_dilihat = jumlah_dilihat + 1 WHERE permasalahan.id = NEW.permasalahan
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_materi` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_materi` (`id_materi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachment`
--
ALTER TABLE `attachment`
  ADD CONSTRAINT `id_materi_attachment` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `id_permasalahan_permasalahan` FOREIGN KEY (`permasalahan`) REFERENCES `permasalahan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parent_komentar` FOREIGN KEY (`parent`) REFERENCES `komentar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siapa_komen` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `komentar_message`
--
ALTER TABLE `komentar_message`
  ADD CONSTRAINT `message` FOREIGN KEY (`message`) REFERENCES `message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `siapa` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `materi`
--
ALTER TABLE `materi`
  ADD CONSTRAINT `kategori_materi` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siapa_terakhir_edit_materi` FOREIGN KEY (`siapa_terakhir_edit`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `siapa_tendik_message` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notif`
--
ALTER TABLE `notif`
  ADD CONSTRAINT `dari_pengguna` FOREIGN KEY (`dari`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notif_flag`
--
ALTER TABLE `notif_flag`
  ADD CONSTRAINT `id_notif_notif` FOREIGN KEY (`id_notif`) REFERENCES `notif` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permasalahan`
--
ALTER TABLE `permasalahan`
  ADD CONSTRAINT `kategori_apa` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siapa_add` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesan_info`
--
ALTER TABLE `pesan_info`
  ADD CONSTRAINT `penerima` FOREIGN KEY (`penerima`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `id_materi` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
