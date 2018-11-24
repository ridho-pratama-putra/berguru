-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 24 Nov 2018 pada 13.24
-- Versi Server: 10.0.28-MariaDB-1~jessie
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
-- Struktur dari tabel `attachment`
--

CREATE TABLE IF NOT EXISTS `attachment` (
`id` int(11) NOT NULL,
  `id_materi` int(11) DEFAULT NULL,
  `url_attachment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `attachment`
--

INSERT INTO `attachment` (`id`, `id_materi`, `url_attachment`) VALUES
(1, 1, 'materi/Matematika/20181120_095836.zip');

-- --------------------------------------------------------

--
-- Struktur dari tabel `direct_message`
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
  `is_open` varchar(255) DEFAULT NULL,
  `jenis_pesan` varchar(255) DEFAULT NULL COMMENT 'isinya permasalahan | komentarpermasalahan, dua2 nya memilikikemungkinan dihapus oleh function deleteInitializedDm. Selain itu juga dapat berisi komentardm yang tidak dapat dihapus',
  `dibalas` varchar(255) DEFAULT NULL COMMENT 'kolom untuk mengetahui apakah user telah membalas? jika sudah dibalas maka isinya sudah, jika belum maka isinya kosong dan akan dihapus segera setelah user meninggalkan halaman direct message dengan seorang pengguna'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `direct_message`
--

INSERT INTO `direct_message` (`id`, `teks`, `dari`, `untuk`, `permasalahan`, `komentar`, `tanggal`, `terpecahkan`, `rating`, `is_open`, `jenis_pesan`, `dibalas`) VALUES
(1, 'Saya mebutuhkan media 3D untuk pelajaran anatomi tubuh manusia dalam bentuk digital! ', '20', '7', '7', '3', '2018-11-16 19:13:35', NULL, NULL, NULL, 'permasalahan', 'sudah'),
(2, 'Saya bisa membuat media 3D dengan aplikasi 4D dengan kombinasi kontral cerdas dari aplikasi Unity dan Google VR', '7', '20', '7', '3', '2018-11-16 19:13:35', NULL, NULL, NULL, 'komentarpermasalahan', 'sudah'),
(3, 'software apa yang anda gunakan? dan bagaimana spesifikasi dari komputer pendukungnya?', '20', '7', '7', '3', '2018-11-16 19:14:27', NULL, NULL, NULL, 'komentardm', NULL),
(4, 'kombinasi aplikasi dengan spek yang minimalis seperti pentium 4 dan RAm 2 Gb', '7', '20', NULL, NULL, '2018-11-16 19:16:49', NULL, NULL, NULL, 'komentardm', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
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
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `tanggal`, `jumlah_pertanyaan`, `jumlah_jawaban`, `status`, `icon`, `nama_folder`) VALUES
(1, 'Matematika', '2018-11-08', '1', '1', 'ACTIVE', 'bgicon-learn-indo', 'materi/Matematika'),
(2, 'Seni Budaya', '2018-11-08', '1', '0', 'ACTIVE', 'bgicon-learn-history', 'materi/Seni Budaya'),
(3, 'Penjaskes', '2018-11-08', '2', '3', 'ACTIVE', 'bgicon-learn-indo', 'materi/Penjaskes'),
(4, 'Bahasa Indonesia', '2018-11-08', '0', '0', 'ACTIVE', 'bgicon-learn-indo', 'materi/Bahasa Indonesia'),
(5, 'Bahasa Inggris', '2018-11-08', '1', '1', 'ACTIVE', 'bgicon-learn-social', 'materi/Bahasa Inggris'),
(6, 'Kimia', '2018-11-08', '1', '0', 'ACTIVE', 'bgicon-learn-history', 'materi/Kimia'),
(7, 'Fisika', '2018-11-08', '0', '0', 'ACTIVE', 'bgicon-learn-physics', 'materi/Fisika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `komentar`
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`id`, `teks`, `tanggal`, `siapa`, `permasalahan`, `kategori_permasalahan`, `solver`, `parent`, `rating`) VALUES
(1, 'Saya bisa membuat media tersebut dengan menggunakan software Blender 3D', '2018-11-16 19:10:18', 4, 7, 0, NULL, NULL, 2),
(2, 'Saya bisa mengembangkannya dengan menggunakan software Unity 3D yang lebih interaktif', '2018-11-16 19:11:30', 6, 7, 0, NULL, NULL, 3),
(3, 'Saya bisa membuat media 3D dengan aplikasi 4D dengan kombinasi kontral cerdas dari aplikasi Unity dan Google VR', '2018-11-16 19:12:31', 7, 7, 0, NULL, NULL, 5),
(4, 'Saran saya bisa mencoba dengan media yang menarik perhatian siswa jadi tidak hanya menggunakan buku saja, terima kasih ', '2018-11-20 12:46:05', 55, 8, 0, NULL, NULL, 5),
(5, 'Untuk media tenses, saya bisa membuat video simulasi buat formula tenses', '2018-11-22 14:39:03', 7, 1, 0, NULL, NULL, NULL);

--
-- Trigger `komentar`
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
-- Struktur dari tabel `komentar_message`
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
-- Struktur dari tabel `lowongan`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id`, `nama`, `kategori`, `waktu_terakhir_edit`, `siapa_terakhir_edit`, `jumlah_diunduh`, `jumlah_dilihat`, `ikon_logo`, `ikon_warna`, `deskripsi`) VALUES
(1, 'Aljabar Linier', 1, '2018-11-20', 20, '20', '0', 'fa-flask', 'materi-blue', 'Ini adalah deskripsi dari suatu materi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `max_notif_id_per_user`
--

CREATE TABLE IF NOT EXISTS `max_notif_id_per_user` (
`id` int(11) NOT NULL,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `max_notif_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `max_notif_id_per_user`
--

INSERT INTO `max_notif_id_per_user` (`id`, `id_pengguna`, `max_notif_id`) VALUES
(1, '1', 19),
(2, '2', 19),
(3, '3', 19),
(4, '4', 7),
(5, '5', 0),
(6, '6', 7),
(7, '7', 19),
(8, '8', 0),
(9, '9', 0),
(10, '10', 0),
(11, '11', 0),
(12, '12', 0),
(13, '13', 0),
(14, '14', 0),
(15, '15', 0),
(16, '16', 0),
(17, '17', 0),
(18, '18', 0),
(19, '19', 0),
(20, '20', 15),
(21, '21', 19),
(22, '22', 0),
(23, '23', 0),
(24, '24', 0),
(25, '25', 0),
(26, '26', 0),
(27, '27', 0),
(28, '28', 0),
(29, '29', 0),
(30, '30', 19),
(31, '31', 0),
(32, '32', 0),
(33, '33', 0),
(34, '34', 0),
(35, '35', 0),
(36, '36', 0),
(37, '37', 0),
(38, '38', 0),
(39, '39', 0),
(40, '40', 0),
(41, '41', 0),
(42, '42', 0),
(43, '43', 0),
(44, '44', 0),
(45, '45', 0),
(46, '46', 0),
(47, '47', 0),
(48, '48', 0),
(49, '49', 0),
(50, '50', 0),
(51, '51', 0),
(52, '52', 0),
(53, '53', 0),
(54, '54', 23),
(55, '55', 24),
(56, '56', 19);

-- --------------------------------------------------------

--
-- Struktur dari tabel `message`
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
-- Struktur dari tabel `notif`
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notif`
--

INSERT INTO `notif` (`id`, `konteks`, `id_konteks`, `dari`, `untuk`, `datetime`, `terlihat`, `terbaca`) VALUES
(1, 'pertanyaan', 1, 18, 'mahasiswa', '2018-11-16 14:20:35', NULL, NULL),
(2, 'pertanyaan', 2, 16, 'mahasiswa', '2018-11-16 14:21:57', NULL, NULL),
(3, 'pertanyaan', 3, 14, 'mahasiswa', '2018-11-16 14:22:59', NULL, NULL),
(4, 'pertanyaan', 4, 15, 'mahasiswa', '2018-11-16 14:24:53', NULL, NULL),
(5, 'pertanyaan', 5, 17, 'mahasiswa', '2018-11-16 14:25:42', NULL, NULL),
(7, 'pertanyaan', 7, 20, 'mahasiswa', '2018-11-16 14:27:10', NULL, NULL),
(8, 'komentar', 7, 4, '20', '2018-11-16 19:10:18', NULL, NULL),
(9, 'komentar', 7, 6, '20', '2018-11-16 19:11:30', NULL, NULL),
(10, 'komentar', 7, 7, '20', '2018-11-16 19:12:31', NULL, NULL),
(11, 'ratingKomentar', 7, 20, '4', '2018-11-16 19:13:26', NULL, NULL),
(12, 'ratingKomentar', 7, 20, '6', '2018-11-16 19:13:28', NULL, NULL),
(13, 'ratingKomentar', 7, 20, '7', '2018-11-16 19:13:30', NULL, NULL),
(14, 'dm', 3, 20, '7', '2018-11-16 19:14:27', NULL, NULL),
(15, 'dm', 4, 7, '20', '2018-11-16 19:16:49', NULL, NULL),
(16, 'ratingKomentar', 7, 20, '4', '2018-11-20 04:55:38', NULL, NULL),
(17, 'ratingKomentar', 7, 20, '6', '2018-11-20 04:55:39', NULL, NULL),
(18, 'ratingKomentar', 7, 20, '7', '2018-11-20 04:55:41', NULL, NULL),
(19, 'materiBaru', 1, 20, 'semua', '2018-11-20 09:58:36', NULL, NULL),
(23, 'komentar', 8, 55, '54', '2018-11-20 12:46:05', NULL, NULL),
(24, 'ratingKomentar', 8, 54, '55', '2018-11-20 12:46:41', NULL, NULL),
(25, 'komentar', 1, 7, '18', '2018-11-22 14:39:03', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notif_flag`
--

CREATE TABLE IF NOT EXISTS `notif_flag` (
`id` int(11) NOT NULL,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `id_notif` int(11) DEFAULT NULL,
  `terlihat` varchar(255) DEFAULT NULL,
  `terbaca` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `notif_flag`
--

INSERT INTO `notif_flag` (`id`, `id_pengguna`, `id_notif`, `terlihat`, `terbaca`) VALUES
(1, '20', 10, '1', '0'),
(2, '20', 9, '1', '0'),
(3, '20', 8, '1', '0'),
(4, '7', 14, '1', '0'),
(5, '7', 13, '1', '0'),
(6, '7', 7, '1', '0'),
(8, '7', 5, '1', '0'),
(9, '7', 4, '1', '0'),
(10, '7', 3, '1', '0'),
(11, '7', 2, '1', '0'),
(12, '7', 1, '1', '0'),
(13, '20', 15, '1', '0'),
(14, '3', 19, '1', '0'),
(16, '55', 19, '1', '0'),
(17, '55', 7, '1', '0'),
(18, '55', 5, '1', '0'),
(19, '55', 4, '1', '0'),
(20, '55', 3, '1', '0'),
(21, '55', 2, '1', '0'),
(22, '55', 1, '1', '0'),
(23, '1', 19, '1', '0'),
(24, '30', 19, '1', '0'),
(25, '30', 7, '1', '0'),
(26, '30', 5, '1', '0'),
(27, '30', 4, '1', '0'),
(28, '30', 3, '1', '0'),
(29, '30', 2, '1', '0'),
(30, '30', 1, '1', '0'),
(31, '55', 24, '1', '0'),
(33, '56', 19, '1', '0'),
(34, '56', 7, '1', '0'),
(35, '56', 5, '1', '0'),
(36, '56', 4, '1', '0'),
(37, '56', 3, '1', '0'),
(38, '56', 2, '1', '0'),
(39, '56', 1, '1', '0'),
(40, '21', 19, '1', '0'),
(41, '7', 19, '1', '0'),
(42, '7', 18, '1', '0'),
(43, '2', 19, '1', '0'),
(44, '2', 7, '1', '0'),
(45, '2', 5, '1', '0'),
(46, '2', 4, '1', '0'),
(47, '2', 3, '1', '0'),
(48, '2', 2, '1', '0'),
(49, '2', 1, '1', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `email`, `no_hp`, `institusi_or_universitas`, `nip_or_nim`, `report`, `status`, `aktor`, `foto`, `password`, `poin`, `cookie`, `jumlah_dm`, `jumlah_dm_solved`) VALUES
(1, 'Admin', 'admin@admin.com', NULL, NULL, NULL, 0, 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, 'rHsTVEHQSClRehBL7ItfxZ8zFxCFnfQtO7vpzVAUyNa58cvuWWAPqYkndLqKgPKD', 0, 0),
(2, 'Maha Siswa', 'mahasiswa@mahasiswa.com', '+6289987009', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'userprofiles/Maha_Siswa_-_profil2.jpg', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(3, 'Muhammad Ridho', 'guru@guru.com', '089680752154', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Muhammad_Ridho_-_profil1.jpg', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(4, 'Anton Bayangkara', 'anton@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 2, NULL, 0, 0),
(5, 'Bagus Sandika', 'bagus@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(6, 'Cintya Restu', 'cintya@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 3, NULL, 0, 0),
(7, 'Dea Amanda', 'dea@student.com', '', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'userprofiles/Dea_Amanda_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 5, NULL, 0, 0),
(8, 'Emilia Rina', 'emil@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(9, 'Farah Nabila', 'farah@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(10, 'Gina Sabrina', 'gina@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(11, 'Hamid Dian', 'hamid@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(12, 'Irfan Joni', 'irfan@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(13, 'Jaka Umbara', 'jaka@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(14, 'Mulyadi Fadil', 'mulyadi@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Mulyadi_Fadil_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(15, 'Hasan Wirayudha', 'hasan@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Hasan_Wirayudha_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(16, 'Evania Yafie', 'evania@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(17, 'Ni Luh Sakinah', 'niluh@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Ni_Luh_Sakinah_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(18, 'Herlina Ike', 'herlina@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(19, 'Ence Surahman', 'ence@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Ence_Surahman_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(20, 'Yerry Soepriyanto', 'yerry@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Yerry_Soepriyanto_-_profil.jpeg', 'e10adc3949ba59abbe56e057f20f883e', 0, 'FO3aBKlomea82Zt9cKALxUisTjr612CYGVJggWHq7hDIsCXc7p4dLAzbkQTubdij', 0, 0),
(21, 'Henry Praherdhiono', 'henry@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Henry_Praherdhiono_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(22, 'Miftakhul Sholikhah', 'miftakhulsholikhah@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'c68737b0ef27a9a79d936caa9b0ec1fe', 0, 'NTYIwLaQxvJchDukEBaT0LFn2Qg7ecgbXOdCSp2UKR9hdtu9M4rklwy7G6rzWsFz', 0, 0),
(23, 'Ginanjar Septiana Supardiansyah', 'ginanjarsetiana4@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '0fae158952bdf312208d5b2d1d94d657', 0, 'uhqQNSNjcb2J98kU6ZDSfVXmZGdv644odTAWIgCCwxMzLnc3g5OvQTEk8FyxKXzf', 0, 0),
(24, 'Ika Kharismadewi', 'rismaika016@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'd4da8d9e6e5c4b1c9db7b01bb7c6c5b3', 0, NULL, 0, 0),
(25, 'Irfan Agung Purnomo', 'agungirfan630@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'ccbc7fda6d3cf74cf2a0c6be76ef05bf', 0, NULL, 0, 0),
(26, 'Mila Noni Alfiolita', 'milanoni99@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'aef2afc5eceadab86921beb9b02b1904', 0, NULL, 0, 0),
(27, 'Lisa Helendriani', 'lisahelend19@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '822ad60fd167aff9c07af373cbe0ef72', 0, NULL, 0, 0),
(28, 'Ermian Hotnauli Silalahi', 'ermianhotnauli@yahoo.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86f9933c52433750c83590a234555e67', 0, NULL, 0, 0),
(29, 'Nafika Fikria Arifianda', 'nafikafikriaarifianda@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8941a8eff97ee4405e9e2781e32ffbf5', 0, NULL, 0, 0),
(30, 'Nur Roudlotul Jannah', 'nurroudloh.nrj@gmail.com', '085851597531', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'becb73795b3cdf701973a5f4c46a7c0a', 0, NULL, 0, 0),
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
(53, 'Ibnu', 'ibnuspeedster@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(54, 'Johnson Martin', 'johnson@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'a426dcf72ba25d046591f81a5495eab7', 0, NULL, 0, 0),
(55, 'Ilham Kurniawan', 'ahmad@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8de13959395270bf9d6819f818ab1a00', 5, NULL, 0, 0),
(56, 'Si Kabayan', 'kabayan@students.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `permasalahan`
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `permasalahan`
--

INSERT INTO `permasalahan` (`id`, `teks`, `tanggal`, `siapa`, `jumlah_dilihat`, `jumlah_dibaca`, `jumlah_komen`, `kategori`, `status`, `beku`) VALUES
(1, 'Dalam dua minggu kedepan, saya akan mengajar materi tenses untuk siswa kelas tiga SD. Adakah yang dapat membantu merancang media presentasi yang interaktif untuk membuat siswa lebih terlibat dalam materi pelajaran? Terima kasih', '2018-11-16 14:20:35', 18, 1, 0, 1, 5, 'UNSOLVED', 'ACTIVE'),
(2, 'Saya membutuhkan bantuan untuk melaksanakan PTK untuk materi geometri di kelas VII, adakah yang bisa mengembangkan media tayangannya? Terima kasih', '2018-11-16 14:21:57', 16, 0, 0, 0, 1, 'UNSOLVED', 'ACTIVE'),
(3, 'Saya ingin melaksanakan PTK di materi tari kreasi untuk siswa SMA kelas XI, adakah yang dapat membantu merancang judul? Terima kasih', '2018-11-16 14:22:59', 14, 1, 0, 0, 2, 'UNSOLVED', 'ACTIVE'),
(4, 'saya mau menyusun PTK dimateri servis bola voli, adakah yang dapat membantu merancang proposal dan media tayangan tutorial? Terima kasih', '2018-11-16 14:24:53', 15, 1, 0, 0, 3, 'UNSOLVED', 'ACTIVE'),
(5, 'Saya membutuhkan bantuan dalam membuat lesson plan berbasis pembelajaran berbasis proyek untuk materi "perubahan zat" untuk anak kelas 5 SD. Terima kasih ', '2018-11-16 14:25:42', 17, 0, 0, 0, 6, 'UNSOLVED', 'ACTIVE'),
(7, 'Saya mebutuhkan media 3D untuk pelajaran anatomi tubuh manusia dalam bentuk digital! ', '2018-11-16 19:15:13', 20, 5, 0, 3, 3, 'UNSOLVED', 'ACTIVE');

--
-- Trigger `permasalahan`
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
-- Struktur dari tabel `pesan_info`
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
-- Struktur dari tabel `riwayat_permasalahan_dilihat`
--

CREATE TABLE IF NOT EXISTS `riwayat_permasalahan_dilihat` (
`id` int(11) NOT NULL,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `permasalahan` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `riwayat_permasalahan_dilihat`
--

INSERT INTO `riwayat_permasalahan_dilihat` (`id`, `id_pengguna`, `permasalahan`, `tanggal`) VALUES
(1, '4', 7, '2018-11-16 19:09:46'),
(2, '6', 7, '2018-11-16 19:11:00'),
(3, '7', 7, '2018-11-16 19:11:55'),
(4, '55', 8, '2018-11-20 12:44:19'),
(5, '55', 7, '2018-11-20 12:44:23'),
(6, '7', 1, '2018-11-22 14:38:32'),
(7, '56', 7, '2018-11-22 19:55:37'),
(8, '56', 3, '2018-11-22 19:55:53'),
(9, '56', 4, '2018-11-22 19:56:06');

--
-- Trigger `riwayat_permasalahan_dilihat`
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
-- Struktur dari tabel `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` int(11) NOT NULL,
  `id_materi` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `id_materi`, `tag`) VALUES
(1, 1, 'matematika'),
(2, 1, 'sma'),
(3, 1, 'gratis');

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `direct_message`
--
ALTER TABLE `direct_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `komentar_message`
--
ALTER TABLE `komentar_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lowongan`
--
ALTER TABLE `lowongan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `max_notif_id_per_user`
--
ALTER TABLE `max_notif_id_per_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notif`
--
ALTER TABLE `notif`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `notif_flag`
--
ALTER TABLE `notif_flag`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `permasalahan`
--
ALTER TABLE `permasalahan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pesan_info`
--
ALTER TABLE `pesan_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `riwayat_permasalahan_dilihat`
--
ALTER TABLE `riwayat_permasalahan_dilihat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `attachment`
--
ALTER TABLE `attachment`
ADD CONSTRAINT `id_materi_attachment` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komentar`
--
ALTER TABLE `komentar`
ADD CONSTRAINT `parent_komentar` FOREIGN KEY (`parent`) REFERENCES `komentar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `siapa_komen` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `komentar_message`
--
ALTER TABLE `komentar_message`
ADD CONSTRAINT `message` FOREIGN KEY (`message`) REFERENCES `message` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `siapa` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `materi`
--
ALTER TABLE `materi`
ADD CONSTRAINT `kategori_materi` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `siapa_terakhir_edit_materi` FOREIGN KEY (`siapa_terakhir_edit`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `message`
--
ALTER TABLE `message`
ADD CONSTRAINT `siapa_tendik_message` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `notif`
--
ALTER TABLE `notif`
ADD CONSTRAINT `dari_pengguna` FOREIGN KEY (`dari`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `notif_flag`
--
ALTER TABLE `notif_flag`
ADD CONSTRAINT `id_notif_notif` FOREIGN KEY (`id_notif`) REFERENCES `notif` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `permasalahan`
--
ALTER TABLE `permasalahan`
ADD CONSTRAINT `kategori_apa` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `siapa_add` FOREIGN KEY (`siapa`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pesan_info`
--
ALTER TABLE `pesan_info`
ADD CONSTRAINT `penerima` FOREIGN KEY (`penerima`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `tags`
--
ALTER TABLE `tags`
ADD CONSTRAINT `id_materi` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
