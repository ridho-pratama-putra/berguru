-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 04, 2018 at 02:45 PM
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `direct_message`
--

INSERT INTO `direct_message` (`id`, `teks`, `dari`, `untuk`, `permasalahan`, `komentar`, `tanggal`, `terpecahkan`, `rating`, `is_open`) VALUES
(1, NULL, '3', '90', '1', '9', '2018-10-31 16:33:37', NULL, NULL, NULL),
(2, NULL, '3', '7', '1', '9', '2018-10-31 16:50:44', NULL, NULL, NULL),
(3, NULL, '3', '7', '1', '9', '2018-10-31 17:11:18', NULL, NULL, NULL),
(4, NULL, '5', '2', '5', '18', '2018-11-01 08:14:38', NULL, NULL, NULL),
(5, NULL, '23', '10', '11', '19', '2018-11-02 08:35:08', NULL, NULL, NULL);

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
(1, 'Matematika', '2018-10-22', '2', '0', 'ACTIVE', 'fa-puzzle-piece', 'materi/Matematika'),
(2, 'Seni Budaya', '2018-10-22', '1', '0', 'ACTIVE', 'fa-globe', 'materi/Seni Budaya'),
(3, 'Penjaskes', '2018-10-22', '1', '0', 'ACTIVE', 'fa-flask', 'materi/Penjaskes'),
(4, 'Bahasa Indonesia', '2018-10-22', '2', '0', 'ACTIVE', 'fa-users', 'materi/Bahasa Indonesia'),
(5, 'Bahasa Inggris', '2018-10-22', '0', '0', 'ACTIVE', 'fa-book', 'materi/Bahasa Inggris'),
(6, 'Kimia', '2018-10-22', '2', '0', 'ACTIVE', 'fa-bicycle', 'materi/Kimia'),
(7, 'Fisika', '2018-10-22', '0', '0', 'ACTIVE', 'fa-flag', 'materi/Fisika');

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
  `solver` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komentar`
--

INSERT INTO `komentar` (`id`, `teks`, `tanggal`, `siapa`, `permasalahan`, `solver`, `parent`, `rating`) VALUES
(11, 'metode yang diusulkan oleh nova lebih di rekomendasikan, karen XYZ', '2018-10-31 19:35:38', 7, 4, NULL, NULL, 1),
(12, 'biasanya siswa sendiri juga ABC maka dari itu mungkin lebih baik XYZ', '2018-10-31 19:36:29', 7, 4, NULL, NULL, 3),
(13, 'sejauh pengalaman saya kondisi ABC adalah sebuah kondisi dimana XYZ. maka dari itu , saran saya mungkin siswa diarahkan untuk melakukan kegiatan FGH disela-sela kegiatan belajar', '2018-10-31 19:38:15', 8, 4, NULL, NULL, 4),
(14, 'mungkin kegiatan ABC lebih cocok, karena XYZ. atau mungkin usulan dari jamal juga tidak ada ruginya untuk dicoba', '2018-10-31 19:39:38', 2, 4, NULL, NULL, 5),
(15, 'saya kurang setuju dengan jamal. karena pada kasus ini kondisi siswa adalah XYZ maka usulan jamal bisa dibilang kurang tepat', '2018-10-31 19:40:43', 4, 4, NULL, NULL, 3),
(16, 'jika menurut A, mungkin bisa diterapkan metode A. dalam metode tersebut mengatakan bahwa ABC. berdasarkan teori tersebut, mungkin metode tersebut adalah metode yang paling tepat', '2018-10-31 19:43:10', 2, 5, NULL, NULL, 4),
(17, 'saran dari maha siswa ada benarnya. namun saya memiliki teori yang sedikit berbeda, jika kondisi A maka metode yang harus diterapkan adalah B. Dan jika siswa dalam kondisi C maka metode yang harus diterapkan adalah D. saran saya terapkan metode ABC', '2018-10-31 19:45:30', 8, 5, NULL, NULL, 3),
(18, 'Siswa diajak untuk melakukan pemecahan masalah berkaitan dengan teori yang diajarkan', '2018-11-01 08:12:56', 2, 5, NULL, NULL, 3),
(19, 'Saya pernah membuat lesson plan untuk materi benda padat bu, dengan menggunakan pendekatan inkuiri. Mungkin sangat akan membantu dalam pengembangan PBL.', '2018-11-01 21:53:22', 10, 11, NULL, NULL, 5),
(20, 'Saya mahasiswa dari Prodi Penjas pak, dulu pernah membuat video tutorial servis dan pass bola voli untuk pemula. Semoga nanti bisa membantu menyelesaikan PTK dikelas bapak.', '2018-11-02 07:11:00', 12, 10, NULL, NULL, NULL);

--
-- Triggers `komentar`
--
DELIMITER //
CREATE TRIGGER `kurangi_jumlah_komen_permasalahan` AFTER DELETE ON `komentar`
 FOR EACH ROW UPDATE permasalahan SET jumlah_komen = jumlah_komen - 1 WHERE permasalahan.id = OLD.permasalahan
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER `tambah_jumlah_komen_permasalahan` AFTER INSERT ON `komentar`
 FOR EACH ROW UPDATE permasalahan SET jumlah_komen = jumlah_komen + 1 WHERE permasalahan.id=NEW.permasalahan
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
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lowongan`
--

INSERT INTO `lowongan` (`id`, `nama`, `instansi`, `lokasi`, `kontak`, `valid`, `kategori`, `tanggal`) VALUES
(1, 'Guru Tingkat SD yang Ulet, Bisa Microsoft Office Nilai Plus', 'TK ABA 16 Malang', 'Jalan Gajayana Gang 3D', '08155514054', 0, NULL, '2018-10-28 18:17:08'),
(2, 'Guru Tingkat SMA yang Ulet, Bisa Microsoft Office Nilai Plus', 'SMAN 9 Malang', 'Jalan borobudur', '08155514054', 0, NULL, '2018-10-28 18:18:58');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
`id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `universitas` varchar(255) DEFAULT NULL,
  `nim` varchar(255) DEFAULT NULL,
  `report` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `max_notif_id_per_user`
--

CREATE TABLE IF NOT EXISTS `max_notif_id_per_user` (
`id` int(11) NOT NULL,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `max_notif_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `max_notif_id_per_user`
--

INSERT INTO `max_notif_id_per_user` (`id`, `id_pengguna`, `max_notif_id`) VALUES
(1, '1', 0),
(2, '2', 5),
(3, '3', 0),
(4, '4', 5),
(5, '5', 0),
(6, '6', 5),
(7, '7', 5),
(8, '8', 5),
(9, '9', 0),
(10, '10', 11),
(11, '11', 0),
(12, '12', 11),
(13, '13', 0),
(14, '14', 0),
(15, '15', 0),
(16, '16', 0),
(17, '17', 11),
(18, '18', 0),
(19, '19', 0),
(20, '20', 0),
(21, '21', 0),
(22, '22', 0),
(23, '23', 0),
(24, '24', 0),
(25, '25', 0),
(26, '26', 0),
(27, '27', 0);

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
-- Table structure for table `notif_mhs_per_user`
--

CREATE TABLE IF NOT EXISTS `notif_mhs_per_user` (
`id` int(11) NOT NULL,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `id_notif` varchar(255) DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL,
  `terbaca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notif_mhs_per_user`
--

INSERT INTO `notif_mhs_per_user` (`id`, `id_pengguna`, `id_notif`, `terlihat`, `terbaca`) VALUES
(1, '2', '1', '1', '0'),
(2, '2', '2', '1', '0'),
(3, '4', '2', '1', '0'),
(4, '4', '1', '1', '0'),
(5, '2', '3', '1', '0'),
(6, '4', '3', '1', '0'),
(7, '6', '3', '1', '0'),
(8, '6', '2', '1', '0'),
(9, '6', '1', '1', '0'),
(10, '8', '3', '1', '0'),
(11, '8', '2', '1', '0'),
(12, '8', '1', '1', '0'),
(13, '7', '3', '1', '0'),
(14, '7', '2', '1', '0'),
(15, '7', '1', '1', '0'),
(16, '6', '5', '1', '0'),
(17, '6', '4', '1', '0'),
(18, '7', '5', '1', '0'),
(19, '7', '4', '1', '0'),
(20, '8', '5', '1', '0'),
(21, '8', '4', '1', '0'),
(22, '2', '5', '1', '0'),
(23, '2', '4', '1', '0'),
(24, '4', '5', '1', '0'),
(25, '4', '4', '1', '0');

-- --------------------------------------------------------

--
-- Table structure for table `notif_permasalahan`
--

CREATE TABLE IF NOT EXISTS `notif_permasalahan` (
`id` int(11) NOT NULL,
  `id_permasalahan` int(11) DEFAULT NULL,
  `dari` varchar(255) DEFAULT NULL,
  `untuk` varchar(255) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL COMMENT 'sudah diilhat di notif',
  `terbaca` varchar(255) DEFAULT NULL COMMENT 'terlihat dengan detil melaui klik pada notif'
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notif_permasalahan`
--

INSERT INTO `notif_permasalahan` (`id`, `id_permasalahan`, `dari`, `untuk`, `datetime`, `terlihat`, `terbaca`) VALUES
(1, 1, '3', 'mahasiswa', '2018-10-22 22:24:02', NULL, NULL),
(2, 2, '3', 'mahasiswa', '2018-10-23 17:36:32', NULL, NULL),
(3, 3, '5', 'mahasiswa', '2018-10-28 15:32:50', NULL, NULL),
(4, 4, '3', 'mahasiswa', '2018-10-31 19:24:22', NULL, NULL),
(5, 5, '5', 'mahasiswa', '2018-10-31 19:29:22', NULL, NULL),
(6, 6, '24', 'mahasiswa', '2018-11-01 21:22:22', NULL, NULL),
(7, 7, '24', 'mahasiswa', '2018-11-01 21:23:30', NULL, NULL),
(8, 8, '22', 'mahasiswa', '2018-11-01 21:27:12', NULL, NULL),
(9, 9, '20', 'mahasiswa', '2018-11-01 21:29:37', NULL, NULL),
(10, 10, '21', 'mahasiswa', '2018-11-01 21:46:50', NULL, NULL),
(11, 11, '23', 'mahasiswa', '2018-11-01 21:50:51', NULL, NULL),
(12, 12, '26', 'mahasiswa', '2018-11-02 08:42:44', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `no_hp`, `institusi_or_universitas`, `nip_or_nim`, `report`, `status`, `aktor`, `foto`, `password`, `poin`, `cookie`, `jumlah_dm`, `jumlah_dm_solved`) VALUES
(1, 'admin', 'admin@admin.com', '+6289987009', NULL, NULL, 0, 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, 'B5iOYauFR5f27ROKCQYSLGKJDZ0EPMACuq4NtsohQ13mj8AbFzgV67y9JtwEzXv0', 0, 0),
(2, 'Maha Siswa', 'mahasiswa@mahasiswa.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, '4XsSfAfj10b3rZo7oxM5b3uUKGzrD1ZOFMkWqmjEWl6zYAiVCeI9YOVy0tqaaNPS', 0, 0),
(3, 'Maha Guru', 'guru@guru.com', '', NULL, NULL, 0, 'DIBEKUKAN', 'pendidik', 'userprofiles/Maha_Guru_-_profil1.jpg', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(4, 'Siswa Siswi', 'siswa@siswa.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(7, 'Hasan Jamil', 'hasan@hasan.com', '', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'userprofiles/Hasan_Jamil_-_profil2.jpg', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(8, 'Jamal Khashoggi', 'jamal@jamal.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(9, 'Ibnu Suhaemy', 'is_september@yahoo.com', NULL, NULL, NULL, 0, 'DIBEKUKAN', 'pendidik', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(10, 'Anton Bayangkara', 'anton@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, 'j3HIvSfAGqHV3zlK7rXpsYPbgtUpS4gJ7om2Z2EnQhyCYMNJiBUcxVvFnPw0j8R6', 0, 0),
(11, 'Bagus Sandika', 'bagus@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(12, 'Cintya Restu', 'cintya@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(13, 'Dea Amanda', 'dea@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(14, 'Emilia Rina', 'emil@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(15, 'Farah Nabila', 'farah@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(16, 'Gina Sabrina', 'gina@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(17, 'Hamid Dian', 'hamid@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(18, 'Irfan Joni', 'irfan@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(19, 'Jaka Umbara', 'jaka@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(20, 'Mulyadi Fadil', 'mulyadi@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Mulyadi_Fadil_-_profil', 'e10adc3949ba59abbe56e057f20f883e', 0, '98PnfdmhgKGu0OH8os7taeZxJLeDVwVUXtziNRvkABq06y5qxbCInlFfEpPAXg54', 0, 0),
(21, 'Hasan Wirayudha', 'hasan@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Hasan_Wirayudha_-_profil', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(22, 'Evania Yafie', 'evania@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Evania_Yafie_-_profil', 'e10adc3949ba59abbe56e057f20f883e', 0, 'HTDe0b8lvtPoHVy3aUq1oURrNcgs1M7Ir6a2dWX90SLixAsuqx6dtfKXcTpbWzGV', 0, 0),
(23, 'Ni Luh Sakinah', 'niluh@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Ni_Luh_Sakinah_-_profil', 'e10adc3949ba59abbe56e057f20f883e', 0, '84uYKDgoEhtoabOT5BJnxMCeWCF6dkQXJ433HOd0UiSIRjBs2luPW0LGSIpPwfUt', 0, 0),
(24, 'Herlina Ike', 'herlina@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Herlina_Ike_-_profil', 'e10adc3949ba59abbe56e057f20f883e', 0, '6n3hDIjid17pBuyPEl9QRtCYr5ayXcgWEGf8C0wMqT0YODt25JeelsT9ULpQhu4M', 0, 0),
(25, 'Ence Surahman', 'ence@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(26, 'Yerry Soepriyanto', 'yerry@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Yerry_Soepriyanto_-_profil', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(27, 'Henry Praherdhiono', 'henry@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permasalahan`
--

INSERT INTO `permasalahan` (`id`, `teks`, `tanggal`, `siapa`, `jumlah_dilihat`, `jumlah_dibaca`, `jumlah_komen`, `kategori`, `status`, `beku`) VALUES
(4, 'Saya mengalami kesulitan dalam menyampaikan mata pelajaran matematikakarena murid saya kurang antusias. Kira2 apa yg harus saya lakukan supaya motivasi murid saya ini meningkat? terimakasih.', '2018-10-31 19:24:22', 3, 5, 0, 6, 1, 'UNSOLVED', 'ACTIVE'),
(6, 'Dalam dua minggu kedepan, saya akan mengajar materi tenses untuk siswa kelas tiga SD. Adakah yang dapat membantu merancang media presentasi yang interaktif untuk membuat siswa lebih terlibat dalam materi pelajaran? Terima kasih', '2018-11-02 07:42:21', 24, 0, 0, 0, 5, 'UNSOLVED', 'ACTIVE'),
(8, 'Saya membutuhkan bantuan untuk melaksanakan PTK untuk materi geometri di kelas VII, adakah yang bisa mengembangkan media tayangannya? Terima kasih', '2018-11-01 21:27:12', 22, 0, 0, 0, 1, 'UNSOLVED', 'ACTIVE'),
(9, 'Saya ingin melaksanakan PTK di materi tari kreasi untuk siswa SMA kelas XI, adakah yang dapat membantu merancang judul? Terima kasih', '2018-11-01 21:29:37', 20, 0, 0, 0, 2, 'UNSOLVED', 'ACTIVE'),
(10, 'saya mau menyusun PTK dimateri servis bola voli, adakah yang dapat membantu merancang proposal dan media tayangan tutorial? Terima kasih', '2018-11-01 21:46:50', 21, 1, 0, 1, 3, 'UNSOLVED', 'ACTIVE'),
(11, 'Saya membutuhkan bantuan dalam membuat lesson plan berbasis pembelajaran berbasis proyek untuk materi ''perubahan zat'' untuk anak kelas 5 SD. Terima kasih', '2018-11-01 21:50:51', 23, 1, 0, 1, 6, 'UNSOLVED', 'ACTIVE'),
(12, 'Saya ingin melaksanakan PTK dengan topik jenis paragraf dan tulisan, adakah model yang tepat untuk diimplementasikan? Terima kasih', '2018-11-02 08:42:44', 26, 0, 0, 0, 4, 'UNSOLVED', 'ACTIVE');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `riwayat_permasalahan_dilihat`
--

INSERT INTO `riwayat_permasalahan_dilihat` (`id`, `id_pengguna`, `permasalahan`, `tanggal`) VALUES
(1, '2', 2, '2018-10-24 09:21:18'),
(2, '2', 1, '2018-10-24 09:23:51'),
(3, '4', 1, '2018-10-24 09:24:43'),
(4, '2', 3, '2018-10-28 15:33:59'),
(5, '4', 3, '2018-10-28 15:34:32'),
(6, '6', 3, '2018-10-28 16:13:55'),
(7, '6', 1, '2018-10-28 16:14:41'),
(8, '8', 1, '2018-10-28 16:32:41'),
(9, '7', 1, '2018-10-28 16:33:58'),
(10, '6', 4, '2018-10-31 19:30:21'),
(11, '7', 4, '2018-10-31 19:34:56'),
(12, '8', 4, '2018-10-31 19:36:53'),
(13, '2', 4, '2018-10-31 19:38:49'),
(14, '4', 4, '2018-10-31 19:39:57'),
(15, '2', 5, '2018-10-31 19:41:48'),
(16, '8', 5, '2018-10-31 19:43:29'),
(17, '6', 5, '2018-10-31 19:45:48'),
(18, '10', 11, '2018-11-01 21:52:09'),
(19, '12', 10, '2018-11-02 07:09:41');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
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
-- Indexes for table `notif_mhs_per_user`
--
ALTER TABLE `notif_mhs_per_user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notif_permasalahan`
--
ALTER TABLE `notif_permasalahan`
 ADD PRIMARY KEY (`id`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `direct_message`
--
ALTER TABLE `direct_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `komentar_message`
--
ALTER TABLE `komentar_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lowongan`
--
ALTER TABLE `lowongan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `max_notif_id_per_user`
--
ALTER TABLE `max_notif_id_per_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notif_mhs_per_user`
--
ALTER TABLE `notif_mhs_per_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `notif_permasalahan`
--
ALTER TABLE `notif_permasalahan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `permasalahan`
--
ALTER TABLE `permasalahan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `pesan_info`
--
ALTER TABLE `pesan_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `riwayat_permasalahan_dilihat`
--
ALTER TABLE `riwayat_permasalahan_dilihat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
