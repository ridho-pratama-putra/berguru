-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 16, 2018 at 06:28 AM
-- Server version: 10.0.28-MariaDB-1~jessie
-- PHP Version: 7.0.16-1~dotdeb+8.1

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
`id` int(11) NOT NULL,
  `id_materi` int(11) DEFAULT NULL,
  `url_attachment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attachment`
--

INSERT INTO `attachment` (`id`, `id_materi`, `url_attachment`) VALUES
(1, 5, 'materi/Bahasa Indonesia/141457-ID-aplikasi-sistem-pakar-berbasis-mobile-un.pdf'),
(2, 5, 'materi/Bahasa Indonesia/174650-ID-penerapan-sistem-pakar-untuk-mendiagnosa.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `direct_message`
--

CREATE TABLE IF NOT EXISTS `direct_message` (
`id` int(11) NOT NULL,
  `teks` text,
  `dari` varchar(255) DEFAULT NULL,
  `untuk` varchar(255) DEFAULT NULL,
  `permasalahan` varchar(255) DEFAULT NULL,
  `komentar` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `terpecahkan` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  `is_open` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `direct_message`
--

INSERT INTO `direct_message` (`id`, `teks`, `dari`, `untuk`, `permasalahan`, `komentar`, `tanggal`, `terpecahkan`, `rating`, `is_open`) VALUES
(1, NULL, '20', '2', '7', '3', '2018-11-15 11:22:22', NULL, NULL, NULL),
(2, NULL, '20', '53', '7', '4', '2018-11-15 11:34:30', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
`id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jumlah_pertanyaan` varchar(255) DEFAULT NULL,
  `jumlah_jawaban` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `nama_folder` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `tanggal`, `jumlah_pertanyaan`, `jumlah_jawaban`, `status`, `icon`, `nama_folder`) VALUES
(1, 'Matematika', '2018-11-08', '1', '0', 'ACTIVE', '', 'materi/Matematika'),
(2, 'Seni Budaya', '2018-11-08', '1', '0', 'ACTIVE', '', 'materi/Seni Budaya'),
(3, 'Penjaskes', '2018-11-08', '2', '3', 'ACTIVE', '', 'materi/Penjaskes'),
(4, 'Bahasa Indonesia', '2018-11-08', '1', '0', 'ACTIVE', '', 'materi/Bahasa Indonesia'),
(5, 'Bahasa Inggris', '2018-11-08', '1', '0', 'ACTIVE', '', 'materi/Bahasa Inggris'),
(6, 'Kimia', '2018-11-08', '1', '1', 'ACTIVE', '', 'materi/Kimia'),
(7, 'Fisika', '2018-11-08', '0', '0', 'ACTIVE', '', 'materi/Fisika');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
`id` int(11) NOT NULL,
  `teks` text,
  `tanggal` datetime DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `permasalahan` int(11) DEFAULT NULL,
  `kategori_permasalahan` int(11) NOT NULL,
  `solver` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `teks`, `tanggal`, `siapa`, `permasalahan`, `kategori_permasalahan`, `solver`, `parent`, `rating`) VALUES
(1, 'Saya mahasiswa dari Prodi Penjas pak, dulu pernah membuat video tutorial servis dan pass bola voli untuk pemula. Semoga nanti bisa membantu menyelesaikan PTK dikelas bapak.', '2018-11-08 23:55:27', 6, 4, 0, NULL, NULL, NULL),
(2, 'Saya pernah membuat lesson plan untuk materi benda padat bu, dengan menggunakan pendekatan inkuiri. Mungkin sangat akan membantu dalam pengembangan PBL.', '2018-11-08 23:58:55', 4, 5, 0, NULL, NULL, NULL),
(3, 'Saya bisa Pak', '2018-11-15 11:21:52', 2, 7, 0, NULL, NULL, 5),
(4, 'saya juga bisa pak', '2018-11-15 11:29:03', 53, 7, 0, NULL, NULL, 4);

--
-- Triggers `komentar`
--
DELIMITER //
CREATE TRIGGER `kurangi_jumlah_komen_permasalahan` AFTER DELETE ON `komentar`
 FOR EACH ROW BEGIN
UPDATE permasalahan SET jumlah_komen = jumlah_komen - 1 WHERE permasalahan.id = OLD.permasalahan;
UPDATE kategori SET jumlah_jawaban = jumlah_jawaban - 1 WHERE kategori.id = (SELECT permasalahan.kategori FROM permasalahan WHERE permasalahan.id = OLD.permasalahan);
END
//
DELIMITER ;
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
`id` int(11) NOT NULL,
  `teks` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lowongan`
--

CREATE TABLE IF NOT EXISTS `lowongan` (
`id` int(11) NOT NULL,
  `nama` text,
  `instansi` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `kontak` varchar(255) DEFAULT NULL,
  `valid` int(11) DEFAULT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `dari` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
`id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `waktu_terakhir_edit` date DEFAULT NULL,
  `siapa_terakhir_edit` int(11) DEFAULT NULL,
  `jumlah_diunduh` varchar(255) DEFAULT NULL,
  `jumlah_dilihat` varchar(255) DEFAULT NULL,
  `ikon_logo` varchar(255) DEFAULT NULL,
  `ikon_warna` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materi`
--

INSERT INTO `materi` (`id`, `nama`, `kategori`, `waktu_terakhir_edit`, `siapa_terakhir_edit`, `jumlah_diunduh`, `jumlah_dilihat`, `ikon_logo`, `ikon_warna`, `deskripsi`) VALUES
(1, 'Matematika Kelas 12 Semester 1', 1, '2018-11-09', 1, '0', '0', NULL, NULL, 'pdf'),
(2, 'Bahasa Indonesia KBBI', 4, '2018-11-09', 1, '0', '0', NULL, NULL, 'kbbi offline pdf cetak'),
(3, 'Bahasa Indonesia KBBI', NULL, '2018-11-09', 1, '0', '0', NULL, NULL, NULL),
(4, 'Bahasa Indonesia KBBI', NULL, '2018-11-09', 1, '0', '0', NULL, NULL, NULL),
(5, 'Bahasa Indonesia KKBBI', 4, '2018-11-09', 1, '0', '0', NULL, NULL, 'kbbi offline pdf'),
(6, 'Bahasa Indonesia KBBI', 4, '2018-11-09', 1, '0', '0', NULL, NULL, 'bahasa indo'),
(7, 'Bahasa Indonesia KBBI', NULL, '2018-11-09', 1, '0', '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `max_notif_id_per_user`
--

CREATE TABLE IF NOT EXISTS `max_notif_id_per_user` (
`id` int(11) NOT NULL,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `max_notif_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `max_notif_id_per_user`
--

INSERT INTO `max_notif_id_per_user` (`id`, `id_pengguna`, `max_notif_id`) VALUES
(1, '1', 61),
(2, '2', 60),
(3, '3', 25),
(4, '4', 6),
(5, '5', 0),
(6, '6', 6),
(7, '7', 0),
(8, '2', 60),
(9, '3', 25),
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
(26, '20', 62),
(27, '21', 0),
(28, '22', 26),
(29, '23', 26),
(30, '24', 26),
(31, '25', 0),
(32, '26', 26),
(33, '27', 0),
(34, '28', 0),
(35, '29', 0),
(36, '30', 0),
(37, '31', 0),
(38, '32', 26),
(39, '33', 0),
(40, '34', 26),
(41, '35', 26),
(42, '36', 26),
(43, '37', 0),
(44, '38', 0),
(45, '39', 0),
(46, '40', 26),
(47, '41', 0),
(48, '42', 0),
(49, '43', 0),
(50, '44', 26),
(51, '45', 0),
(52, '46', 26),
(53, '47', 0),
(54, '48', 0),
(55, '49', 0),
(56, '50', 0),
(57, '51', 0),
(58, '52', 0),
(59, '53', 63);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
`id` int(11) NOT NULL,
  `teks` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `beku` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notif`
--

CREATE TABLE IF NOT EXISTS `notif` (
`id` int(11) NOT NULL,
  `konteks` varchar(255) DEFAULT NULL COMMENT 'isinya permasalahan || dm || lainnya || komentar',
  `id_konteks` int(11) DEFAULT NULL COMMENT 'bisa id_permasalahan || id_DM || komentar || lainlain',
  `dari` int(11) DEFAULT NULL,
  `untuk` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL COMMENT 'sudah diilhat di notif',
  `terbaca` varchar(255) DEFAULT NULL COMMENT 'terlihat dengan detil melaui klik pada notif'
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

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
(26, 'lowonganAvailable', 1, 1, 'semua', '2018-11-09 03:48:01', NULL, NULL),
(58, 'pertanyaan', 7, 20, 'mahasiswa', '2018-11-15 11:20:42', NULL, NULL),
(59, 'komentar', 7, 2, '20', '2018-11-15 11:21:52', NULL, NULL),
(60, 'ratingKomentar', 7, 20, '2', '2018-11-15 11:23:54', NULL, NULL),
(62, 'komentar', 7, 53, '20', '2018-11-15 11:29:03', NULL, NULL),
(63, 'ratingKomentar', 7, 20, '53', '2018-11-15 11:34:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notif_flag`
--

CREATE TABLE IF NOT EXISTS `notif_flag` (
`id` int(11) NOT NULL,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `id_notif` int(11) DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL,
  `terbaca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1;

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
(28, '2', 26, '1', '0'),
(34, '23', 26, '1', '0'),
(35, '23', 6, '1', '0'),
(36, '23', 5, '1', '0'),
(37, '23', 4, '1', '0'),
(38, '23', 3, '1', '0'),
(39, '23', 2, '1', '0'),
(40, '23', 1, '1', '0'),
(41, '24', 26, '1', '0'),
(42, '24', 6, '1', '0'),
(43, '24', 5, '1', '0'),
(44, '24', 4, '1', '0'),
(45, '24', 3, '1', '0'),
(46, '24', 2, '1', '0'),
(47, '24', 1, '1', '0'),
(48, '22', 26, '1', '0'),
(49, '22', 6, '1', '0'),
(50, '22', 5, '1', '0'),
(51, '22', 4, '1', '0'),
(52, '22', 3, '1', '0'),
(53, '22', 2, '1', '0'),
(54, '22', 1, '1', '0'),
(73, '35', 26, '1', '0'),
(74, '35', 6, '1', '0'),
(75, '35', 5, '1', '0'),
(76, '35', 4, '1', '0'),
(77, '35', 3, '1', '0'),
(78, '35', 2, '1', '0'),
(79, '35', 1, '1', '0'),
(80, '32', 26, '1', '0'),
(81, '32', 6, '1', '0'),
(82, '32', 5, '1', '0'),
(83, '32', 4, '1', '0'),
(84, '32', 3, '1', '0'),
(85, '32', 2, '1', '0'),
(86, '32', 1, '1', '0'),
(87, '34', 26, '1', '0'),
(88, '34', 6, '1', '0'),
(89, '34', 5, '1', '0'),
(90, '34', 4, '1', '0'),
(91, '34', 3, '1', '0'),
(92, '34', 2, '1', '0'),
(93, '34', 1, '1', '0'),
(94, '46', 26, '1', '0'),
(95, '46', 6, '1', '0'),
(96, '46', 5, '1', '0'),
(97, '46', 4, '1', '0'),
(98, '46', 3, '1', '0'),
(99, '46', 2, '1', '0'),
(100, '46', 1, '1', '0'),
(101, '26', 26, '1', '0'),
(102, '26', 6, '1', '0'),
(103, '26', 5, '1', '0'),
(104, '26', 4, '1', '0'),
(105, '26', 3, '1', '0'),
(106, '26', 2, '1', '0'),
(107, '26', 1, '1', '0'),
(108, '36', 26, '1', '0'),
(109, '36', 6, '1', '0'),
(110, '36', 5, '1', '0'),
(111, '36', 4, '1', '0'),
(112, '36', 3, '1', '0'),
(113, '36', 2, '1', '0'),
(114, '36', 1, '1', '0'),
(115, '40', 26, '1', '0'),
(116, '40', 6, '1', '0'),
(117, '40', 5, '1', '0'),
(118, '40', 4, '1', '0'),
(119, '40', 3, '1', '0'),
(120, '40', 2, '1', '0'),
(121, '40', 1, '1', '0'),
(122, '3', 25, '1', '0'),
(123, '3', 26, '1', '0'),
(124, '20', 26, '1', '0'),
(125, '2', 58, '1', '0'),
(126, '20', 59, '1', '0'),
(127, '53', 58, '1', '0'),
(128, '53', 26, '1', '0'),
(129, '53', 6, '1', '0'),
(130, '53', 5, '1', '0'),
(131, '53', 4, '1', '0'),
(132, '53', 3, '1', '0'),
(133, '53', 2, '1', '0'),
(134, '53', 1, '1', '0'),
(135, '53', 63, '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
`id` int(11) NOT NULL,
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
  `jumlah_dm_solved` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `no_hp`, `institusi_or_universitas`, `nip_or_nim`, `report`, `status`, `aktor`, `foto`, `password`, `poin`, `cookie`, `jumlah_dm`, `jumlah_dm_solved`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, NULL, NULL, 0, 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, 'nDCOmo84VzcKvMjbQ1hFF69sWZRYSI7T6EbuwGpmrnGtkelg0dP5J2PRLuwNDVx7', 0, 0),
(2, 'Maha Siswa', 'mahasiswa@mahasiswa.com', '+6289987009', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'userprofiles/Maha_Siswa_-_profil.jpg', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(3, 'Muhammad Ridho', 'guru@guru.com', '089680752154', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Guruururu_-_profil.jpg', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
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
(20, 'Yerry Soepriyanto', 'yerry@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, 'FO3aBKlomea82Zt9cKALxUisTjr612CYGVJggWHq7hDIsCXc7p4dLAzbkQTubdij', 0, 0),
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
(52, 'Faricha Alif Vaniza', 'aliffaricha@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'de27825fca35ba8492b08765cda6cf98', 0, NULL, 0, 0),
(53, 'Ibnu', 'ibnuspeedster@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permasalahan`
--

CREATE TABLE IF NOT EXISTS `permasalahan` (
`id` int(11) NOT NULL,
  `teks` text,
  `tanggal` datetime DEFAULT NULL,
  `siapa` int(11) DEFAULT NULL,
  `jumlah_dilihat` int(11) DEFAULT NULL,
  `jumlah_dibaca` int(11) DEFAULT NULL,
  `jumlah_komen` int(11) DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `beku` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permasalahan`
--

INSERT INTO `permasalahan` (`id`, `teks`, `tanggal`, `siapa`, `jumlah_dilihat`, `jumlah_dibaca`, `jumlah_komen`, `kategori`, `status`, `beku`) VALUES
(1, 'Dalam dua minggu kedepan, saya akan mengajar materi tenses untuk siswa kelas tiga SD. Adakah yang dapat membantu merancang media presentasi yang interaktif untuk membuat siswa lebih terlibat dalam materi pelajaran? Terima kasih', '2018-11-08 23:44:36', 18, 0, 0, 0, 5, 'UNSOLVED', 'ACTIVE'),
(2, 'Saya membutuhkan bantuan untuk melaksanakan PTK untuk materi geometri di kelas VII, adakah yang bisa mengembangkan media tayangannya? Terima kasih', '2018-11-08 23:45:46', 16, 0, 0, 0, 1, 'UNSOLVED', 'ACTIVE'),
(3, 'Saya ingin melaksanakan PTK di materi tari kreasi untuk siswa SMA kelas XI, adakah yang dapat membantu merancang judul? Terima kasih', '2018-11-08 23:46:43', 14, 0, 0, 0, 2, 'UNSOLVED', 'ACTIVE'),
(4, 'saya mau menyusun PTK dimateri servis bola voli, adakah yang dapat membantu merancang proposal dan media tayangan tutorial? Terima kasih', '2018-11-08 23:47:39', 15, 1, 0, 1, 3, 'UNSOLVED', 'ACTIVE'),
(5, 'Saya membutuhkan bantuan dalam membuat lesson plan berbasis pembelajaran berbasis proyek untuk materi "perubahan zat" untuk anak kelas 5 SD. Terima kasih', '2018-11-08 23:48:52', 17, 2, 0, 1, 6, 'UNSOLVED', 'ACTIVE'),
(6, 'Saya ingin melaksanakan PTK dengan topik jenis paragraf dan tulisan, adakah model yang tepat untuk diimplementasikan? Terima kasih', '2018-11-15 11:01:42', 20, 0, 0, 0, 4, 'UNSOLVED', 'ACTIVE'),
(7, 'Saya mebutuhkan media 3D untuk pelajaran anatomi tubuh manusia dalam bentuk digital!', '2018-11-15 11:20:42', 20, 2, 0, 2, 3, 'UNSOLVED', 'ACTIVE');

--
-- Triggers `permasalahan`
--
DELIMITER //
CREATE TRIGGER `kurangi_jumlah_pertanyaan_di_kategori` AFTER DELETE ON `permasalahan`
 FOR EACH ROW UPDATE kategori SET jumlah_pertanyaan = jumlah_pertanyaan - 1 WHERE id = OLD.kategori
//
DELIMITER ;
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
`id` int(11) NOT NULL,
  `penerima` int(11) DEFAULT NULL,
  `subjek` varchar(255) DEFAULT NULL,
  `isi` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_permasalahan_dilihat`
--

CREATE TABLE IF NOT EXISTS `riwayat_permasalahan_dilihat` (
`id` int(11) NOT NULL,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `permasalahan` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `riwayat_permasalahan_dilihat`
--

INSERT INTO `riwayat_permasalahan_dilihat` (`id`, `id_pengguna`, `permasalahan`, `tanggal`) VALUES
(1, '6', 4, '2018-11-08 23:55:14'),
(2, '4', 5, '2018-11-08 23:58:48'),
(3, '2', 7, '2018-11-15 11:21:35'),
(4, '53', 7, '2018-11-15 11:28:53'),
(5, '53', 5, '2018-11-15 11:31:42');

--
-- Triggers `riwayat_permasalahan_dilihat`
--
DELIMITER //
CREATE TRIGGER `kurangi_jumlah_dilihat_permasalahan` AFTER DELETE ON `riwayat_permasalahan_dilihat`
 FOR EACH ROW UPDATE permasalahan SET jumlah_dilihat = jumlah_dilihat - 1 WHERE permasalahan.id = OLD.permasalahan
//
DELIMITER ;
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
`id` int(11) NOT NULL,
  `id_materi` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `id_materi`, `tag`) VALUES
(1, 5, 'bahasa indonesia'),
(2, 5, 'kbbi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
 ADD PRIMARY KEY (`id`), ADD KEY `id_materi_attachment` (`id_materi`);

--
-- Indexes for table `direct_message`
--
ALTER TABLE `direct_message`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
 ADD PRIMARY KEY (`id`), ADD KEY `permasalahan_mana` (`permasalahan`), ADD KEY `parent_komentar` (`parent`), ADD KEY `siapa_komen` (`siapa`);

--
-- Indexes for table `komentar_message`
--
ALTER TABLE `komentar_message`
 ADD PRIMARY KEY (`id`), ADD KEY `siapa` (`siapa`), ADD KEY `message` (`message`);

--
-- Indexes for table `lowongan`
--
ALTER TABLE `lowongan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materi`
--
ALTER TABLE `materi`
 ADD PRIMARY KEY (`id`), ADD KEY `kategori_materi` (`kategori`), ADD KEY `siapa_terakhir_edit_materi` (`siapa_terakhir_edit`);

--
-- Indexes for table `max_notif_id_per_user`
--
ALTER TABLE `max_notif_id_per_user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
 ADD PRIMARY KEY (`id`), ADD KEY `siapa_tendik_message` (`siapa`);

--
-- Indexes for table `notif`
--
ALTER TABLE `notif`
 ADD PRIMARY KEY (`id`), ADD KEY `dari_pengguna` (`dari`);

--
-- Indexes for table `notif_flag`
--
ALTER TABLE `notif_flag`
 ADD PRIMARY KEY (`id`), ADD KEY `id_notif_notif` (`id_notif`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email_pengguna` (`email`);

--
-- Indexes for table `permasalahan`
--
ALTER TABLE `permasalahan`
 ADD PRIMARY KEY (`id`), ADD KEY `kategori_apa` (`kategori`), ADD KEY `siapa_add` (`siapa`);

--
-- Indexes for table `pesan_info`
--
ALTER TABLE `pesan_info`
 ADD PRIMARY KEY (`id`), ADD KEY `penerima` (`penerima`);

--
-- Indexes for table `riwayat_permasalahan_dilihat`
--
ALTER TABLE `riwayat_permasalahan_dilihat`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`), ADD KEY `id_materi` (`id_materi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `direct_message`
--
ALTER TABLE `direct_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `komentar_message`
--
ALTER TABLE `komentar_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lowongan`
--
ALTER TABLE `lowongan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `max_notif_id_per_user`
--
ALTER TABLE `max_notif_id_per_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notif`
--
ALTER TABLE `notif`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `notif_flag`
--
ALTER TABLE `notif_flag`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT for table `permasalahan`
--
ALTER TABLE `permasalahan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `pesan_info`
--
ALTER TABLE `pesan_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `riwayat_permasalahan_dilihat`
--
ALTER TABLE `riwayat_permasalahan_dilihat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
