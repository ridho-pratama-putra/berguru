-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 12 Feb 2019 pada 12.49
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `attachment`
--

INSERT INTO `attachment` (`id`, `id_materi`, `url_attachment`) VALUES
(1, 1, 'materi/Matematika/20181120_095836.zip'),
(2, 2, 'materi/Bahasa Inggris/20181219_143728.zip'),
(3, 3, 'materi/Matematika/20190108_222118.zip');

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
  `dibalas` varchar(255) DEFAULT NULL COMMENT 'kolom untuk mengetahui apakah user telah membalas? jika sudah dibalas maka isinya sudah, jika belum maka isinya kosong dan akan dihapus segera setelah user meninggalkan halaman direct message dengan seorang pengguna',
  `solver` varchar(6) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `direct_message`
--

INSERT INTO `direct_message` (`id`, `teks`, `dari`, `untuk`, `permasalahan`, `komentar`, `tanggal`, `terpecahkan`, `rating`, `is_open`, `jenis_pesan`, `dibalas`, `solver`) VALUES
(1, 'Saya mebutuhkan media 3D untuk pelajaran anatomi tubuh manusia dalam bentuk digital! ', '20', '7', '7', '3', '2018-11-16 19:13:35', NULL, NULL, 'sudah', 'permasalahan', 'sudah', NULL),
(2, 'Saya bisa membuat media 3D dengan aplikasi 4D dengan kombinasi kontral cerdas dari aplikasi Unity dan Google VR', '7', '20', '7', '3', '2018-11-16 19:13:35', NULL, NULL, 'sudah', 'komentarpermasalahan', 'sudah', NULL),
(3, 'software apa yang anda gunakan? dan bagaimana spesifikasi dari komputer pendukungnya?', '20', '7', '7', '3', '2018-11-16 19:14:27', NULL, NULL, 'sudah', 'komentardm', NULL, NULL),
(4, 'kombinasi aplikasi dengan spek yang minimalis seperti pentium 4 dan RAm 2 Gb', '7', '20', NULL, NULL, '2018-11-16 19:16:49', NULL, NULL, 'sudah', 'komentardm', NULL, NULL),
(5, 'Apa yang bisa dilakukan guru agar siswanya di SD tertarik dengan mata pelajaran matematika?', '17', '55', '8', '4', '2018-12-06 15:00:06', NULL, NULL, NULL, 'permasalahan', 'sudah', NULL),
(6, 'Saran saya bisa mencoba dengan media yang menarik perhatian siswa jadi tidak hanya menggunakan buku saja, terima kasih ', '55', '17', '8', '4', '2018-12-06 15:00:06', NULL, NULL, NULL, 'komentarpermasalahan', 'sudah', NULL),
(7, 'bisa diberikan contohnya?', '17', '55', '8', '4', '2018-12-06 15:00:33', NULL, NULL, NULL, 'komentardm', NULL, NULL),
(10, 'Apa yang bisa dilakukan guru agar siswanya di SD tertarik dengan mata pelajaran matematika?', '17', '52', '8', '10', '2018-12-17 10:38:32', 'UNSOLVED', NULL, NULL, 'permasalahan', 'sudah', NULL),
(11, 'Masalah yang timbul biasanya dari persepsi siswa bahwa "matematika itu sulit", disitulah siswa malas untuk mempelajari matematika. Saran saya, guru menggunakan media belajar yg cocok dengan model belajar siswa, terutama untuk jenjang SD, mereka masih senang bermain. Mengubah persepsi dari matematika itu sulit menjadi math is fun. Jadi pembelajaran disertai dengan permainan agar siswa lebih tertarik. Misalnya dengan media belajar ular tangga yang pada nomor-nomor tertentu terdapat soal yang harus dikerjakan. Jika mengalami kesulitan bisa bertanya kepada kelompok belajar atau kepada guru. Lebih banyak menggunakan media belajar yang menyenangkan agar siswa SD tertarik. ', '52', '17', '8', '10', '2018-12-17 10:38:32', NULL, '4', NULL, 'komentarpermasalahan', 'sudah', NULL),
(12, 'menurut anda, media apa yang bisa anda buat untuk masalah ini?', '17', '52', '8', '10', '2018-12-17 10:39:01', NULL, NULL, NULL, 'komentardm', NULL, NULL),
(13, 'menurut anda, media apa yang bisa anda buat untuk masalah ini?', '17', '52', NULL, NULL, '2018-12-17 10:53:32', NULL, NULL, NULL, 'komentardm', NULL, NULL),
(14, 'jhjh', '20', '7', NULL, NULL, '2019-01-03 22:55:06', NULL, NULL, NULL, 'komentardm', NULL, NULL),
(15, 'Adakah metode yang bisa digunakan untuk membuat presentasi yang baik di mata pelajaran bahasa inggris?', '3', '2', '10', '45', '2019-01-08 21:44:48', 'UNSOLVED', NULL, 'sudah', 'permasalahan', 'sudah', NULL),
(16, 'Ada Pak, bisa pakai powerpoint atau adobe flash', '2', '3', '10', '45', '2019-01-08 21:44:48', NULL, '4', 'sudah', 'komentarpermasalahan', 'sudah', NULL),
(17, 'Kalau pakai power point bagaimana caranya supaya bisa lebih interaktif tampilannya', '3', '2', '10', '45', '2019-01-08 21:45:25', NULL, NULL, 'sudah', 'komentardm', NULL, NULL),
(18, 'Bisa ditambahkan animasi dan link Pak', '3', '2', NULL, NULL, '2019-01-08 21:47:28', NULL, NULL, 'sudah', 'komentardm', NULL, NULL),
(19, 'macakciiii', '2', '3', NULL, NULL, '2019-01-08 21:57:51', NULL, NULL, 'sudah', 'komentardm', NULL, NULL),
(20, 'wauuuw keren bangettt', '2', '3', NULL, NULL, '2019-01-08 21:59:36', NULL, NULL, 'sudah', 'komentardm', NULL, NULL),
(21, 'PESAN TEGURAN|Mohon tidak sembarangan dalam menulis post permasalahan', '1', '3', NULL, NULL, '2019-02-12 00:00:00', NULL, NULL, 'sudah', 'pesaninfo', NULL, NULL),
(22, 'test dari guru', '3', '2', NULL, NULL, '2019-02-12 14:31:10', NULL, NULL, 'sudah', 'komentardm', NULL, NULL),
(23, 'test lagi', '3', '2', NULL, NULL, '2019-02-12 14:31:17', NULL, NULL, 'sudah', 'komentardm', NULL, NULL),
(24, 'test berhasil', '2', '3', NULL, NULL, '2019-02-12 15:44:26', NULL, NULL, NULL, 'komentardm', NULL, NULL);

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
  `background` varchar(255) DEFAULT NULL,
  `nama_folder` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `tanggal`, `jumlah_pertanyaan`, `jumlah_jawaban`, `status`, `icon`, `background`, `nama_folder`) VALUES
(1, 'Matematika', '2018-11-08', '1', '21', 'ACTIVE', 'icon-material-puzzle', NULL, 'materi/Matematika'),
(2, 'Seni Budaya', '2018-11-08', '0', '0', 'ACTIVE', 'icon-material-note', NULL, 'materi/Seni Budaya'),
(3, 'Penjaskes', '2018-11-08', '0', '3', 'ACTIVE', 'icon-material-stack', NULL, 'materi/Penjaskes'),
(4, 'Bahasa Indonesia', '2018-11-08', '0', '0', 'ACTIVE', 'icon-material-book', NULL, 'materi/Bahasa Indonesia'),
(5, 'Bahasa Inggris', '2018-11-08', '1', '2', 'ACTIVE', 'icon-material-stack', NULL, 'materi/Bahasa Inggris'),
(6, 'Kimia', '2018-11-08', '0', '0', 'ACTIVE', 'icon-material-people', NULL, 'materi/Kimia'),
(7, 'Fisika', '2019-01-15', '1', '19', 'ACTIVE', 'icon-material-basketball', 'bgkategori/Fisika.jpg', 'materi/Fisika');

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `komentar`
--

INSERT INTO `komentar` (`id`, `teks`, `tanggal`, `siapa`, `permasalahan`, `kategori_permasalahan`, `solver`, `parent`, `rating`) VALUES
(1, 'Saya bisa membuat media tersebut dengan menggunakan software Blender 3D', '2018-11-16 19:10:18', 4, 7, 0, NULL, NULL, 2),
(2, 'Saya bisa mengembangkannya dengan menggunakan software Unity 3D yang lebih interaktif', '2018-11-16 19:11:30', 6, 7, 0, NULL, NULL, 3),
(3, 'Saya bisa membuat media 3D dengan aplikasi 4D dengan kombinasi kontral cerdas dari aplikasi Unity dan Google VR', '2018-11-16 19:12:31', 7, 7, 0, NULL, NULL, 5),
(4, 'Saran saya bisa mencoba dengan media yang menarik perhatian siswa jadi tidak hanya menggunakan buku saja, terima kasih ', '2018-11-20 12:46:05', 55, 8, 0, NULL, NULL, 1),
(5, 'Untuk media tenses, saya bisa membuat video simulasi buat formula tenses', '2018-11-22 14:39:03', 7, 1, 0, NULL, NULL, NULL),
(6, 'Menurut saya, Guru harus mampu Mengajarkan dengan semangat, kemudian memberikan contoh mulai dari rumus yang paling mudah, hingga paling rumit, dan memberikan soal latihan pada siswa sesuai contoh, kemudian memberikan soal latihan yang mungkin belum di berikan contoh, agar siswa memiliki rasa ingin tau dan bersemangat dalam memecahkan masalahnya dengan mencari rumus dari berbagai buku atau juga internet.\r\nKemudian melakukan praktek dan peraga sesuai konsep materi. ', '2018-12-06 14:04:39', 49, 8, 0, NULL, NULL, 3),
(7, 'Menurut saya masalah tersebut timbul karena siswa SMP merasa bosan dengan buku mereka yg memiliki bahasa ilmiah cukup sulit dipahami . Saran saya sebaiknya bahasa di dalam buku diringkas lebih baik agar mudah dipahami dan buku diberi gambar gambar agar tidak terlihat monoton ', '2018-12-06 19:36:03', 44, 9, 0, NULL, NULL, 2),
(8, 'Menurut saya masalah itu timbul karena siswa SD merasa bahwa mata pelajaran matematika sulit dipelajari . Saran saya sebaiknya guru menjelaskan per bab mata pelajaran kepada siswa SD dengan jelas dan memberikan latihan soal dengan cara menunjuk satu satu pada tiap siswa , dari situ guru dapat menilai siapa yg sudah paham dan siapa yang belum paham sehingga guru dapat mnjelaskan lagi pada siswa yang belum paham . Dari situ siswa tidak akan merasa kesulitan dalam mata pelajaran matematika dan siswa akan senang mempelajarinya', '2018-12-06 19:41:01', 44, 8, 0, NULL, NULL, 3),
(9, 'Menurut saya, masalah yang timbul mungkin karena pembelajaran yang monoton, dan tidak ada inovasi dari guru.\r\nSaran saya, guru lebih mengkaitkan dengan kehidupan sehari-hari, menyediakan media belajar yg sumber materinya dari buku, misalnya praktikum atau tugas yang panduannya dapat ditemukan dibuku, dan menggunakan buku yang bergambar, tidak monoton teks.', '2018-12-07 21:27:50', 52, 9, 0, NULL, NULL, 4),
(10, 'Masalah yang timbul biasanya dari persepsi siswa bahwa "matematika itu sulit", disitulah siswa malas untuk mempelajari matematika. Saran saya, guru menggunakan media belajar yg cocok dengan model belajar siswa, terutama untuk jenjang SD, mereka masih senang bermain. Mengubah persepsi dari matematika itu sulit menjadi math is fun. Jadi pembelajaran disertai dengan permainan agar siswa lebih tertarik. Misalnya dengan media belajar ular tangga yang pada nomor-nomor tertentu terdapat soal yang harus dikerjakan. Jika mengalami kesulitan bisa bertanya kepada kelompok belajar atau kepada guru. Lebih banyak menggunakan media belajar yang menyenangkan agar siswa SD tertarik. ', '2018-12-07 21:37:59', 52, 8, 0, NULL, NULL, 4),
(11, 'Menurut saya, siswa SD tidak tertarik dengan mata pelajaran matematika karena cara pengajaran yang tidak mudah dimengerti atau tidak sesuai dengan karakter cara belajar anak. Saran saya, guru harus mengenal karakter siswa SD bahwa mereka ada di dunia bermain sehingga guru dapat menggunakan metode permainan untuk pembelajaran seperti metode jarimatika dan sempoa untuk berhitung sehingga membuat matematika menjadi menyenangkan dan mudah untuk dipelajari.', '2018-12-08 05:18:28', 30, 8, 0, NULL, NULL, 2),
(12, 'Menurut saya, masalah tersebut dikarenakan banyak siswa SD itu beranggapan bahwa semua yang berhubungan dengan angka itu sulit. Oleh karena itu guru matematika di SD harus menggunakan metode pembelajaran yang tidak membosankan dan membuat siswa takut akan pelajaran matematika. Jadi guru harus membuat kelas menjadi menyenangkan agar siswa dapat mengikuti pelajaran matematika dengan senang dan tidak tegang. Selain itu guru harus siap siaga untuk membantu siswanya dalam setiap kesulitan yg dialami.', '2018-12-08 13:52:30', 26, 8, 0, NULL, NULL, 2),
(13, 'Menurut saya, masalah tersebut disebabkan oleh siswa dituntut untuk menghapal rumus atau metode penyelesaian matematika sehingga membuat kebanyakan siswa merasa tertekan dan jenuh. Solusinya adalah seorang guru harus bersemangat ketika mengajar matematika dan memberi pola atau cara khusus saat menyampaikan materi matematika. Contohnya, perkalian dengan angka sembilan menggunakan jari. Misalkan: perkalian angka 1-10 dengan angka 9 menggunakan jari, 7x9 artinya jari ke tujuh dari kiri menjadi pemisah antara sisa jumlah jari di kanan (6) dan jari di kiri (3). Lalu, kedua angka tersebut digabungkan maka hasilnya adalah 63. Dari contoh pola atau cara khusus ini akan lebih memotivasi siswa untuk belajar dan tertarik karena mempermudah mereka memahami konsep matematika.', '2018-12-08 13:53:45', 43, 8, 0, NULL, NULL, 5),
(14, 'Menurut saya, agar siswa SD dapat tertarik dengan mata pelajaran matematika dengan cara guru membuka bimbingan belajar matematika.', '2018-12-08 14:22:49', 42, 8, 0, NULL, NULL, 3),
(15, 'Menurut saya, siswa SMP kebanyakan bosan dengan mata pelajaran IPA dan pemahaman siswa tersebut masih kurang. Agar siswa SMP senang membaca buku terkait materi pelajaran IPA dengan menambah materi yang dapat dipelajari.', '2018-12-08 14:29:19', 42, 9, 0, NULL, NULL, 3),
(16, 'Menurut saya mata pelajaran matematika kurang diminati oleh siswa itu karena matematika dinilai sulit dan membosankan bagi beberapa siswa, oleh karena itu perlulah dibuat suatu metode atau cara supaya mereka tertarik dengan mata pelajaran matematika. Caranya yaitu ketika mengajar siswa seorang guru harus memiliki antusias yang tinggi dalam kelas untuk memulai pelajaran dan menunjukkan sikap hangat kepada siswa. karena ketika guru antusias atau bersemangat siswa juga akan ikut bersemangat, dan ketika guru bersikap hangat maka mereka akan merasa nyaman. Selain itu, ketika dalam pelaksanaan menjelaskan materi pengajar harus mengetahui sampai mana pemahaman siswanya. Ketika mereka kurang paham dengan penjelasan materi yang diajarkan guru, maka guru harus mencari metode lain supaya siswanya bisa memahaminya. Contohnya : biasanya guru menjelaskan di dalam kelas hingga materi tersampaikan dengan lisan tetapi siswa belum paham, maka solusinya guru mengajak siswanya menjelaskan materi dengan permainan karena pada umumnya siswa sd masih cenderung suka bermain dan membuat media pembelajaran yang menarik. Dengan begitu siswa tidak akan mengantuk dan perhatian siswa akan tertuju pada pelaksanaan pembelajaran.\r\n', '2018-12-08 15:01:05', 62, 8, 0, NULL, NULL, 5),
(17, 'Menurut saya siwa kurang senang dalam membaca materi pelajaran IPA karena didalam buku tersebut hanya membahas materi-materi saja yang dapan membuat siswa menjadi bosan dan tidak tertarik. Sehingga cara yang dilakukan untuk menarik minat baca siswa yaitu di dalam buku materi IPA  disertai dengan cerita atau studi kasus yang ada dalam kehidupan sehari-hari dan disertai dengan gambar-gambar yang berwarna yang dapat menarik perhatian siswa SMP. Selain itu juga yang dapat membuat siswa tidak tertarik karena tidak nyamannya tempat untuk membaca. Sehingga di dalam kelas bisa di setting dengan baik menyesuaikan dengan kemauan siswa serta diberikan slogan-slogan untuk memotivasi siwa dalam membaca.', '2018-12-08 15:16:55', 62, 9, 0, NULL, NULL, 3),
(18, 'Menurut saya, agar siwa SD tertarik dengan pelajaran matematika sebaiknya guru menggunakan strategi,  media, dan metode pembelajaran yang relevan untuk membantu daya serap anak didik dalam pemahaman materi guru perlu menggunakan metode misalkan dengan menggunakan rumus yang tidak terlalu cepat dan pastikan media yang digunakan sesuai dengan kebutuhan anak didik. Selain itu guru juga dapat memberikan motivasi kepada anak didiknya ', '2018-12-08 16:32:28', 31, 8, 0, NULL, NULL, 3),
(19, 'Menurut saya, sebaiknya guru memberikan materi pembelajaran dengan cara menggali sendiri materi tersebut dan mengajak keperpustakaan dari hal tersebut siswa akan mempunyai kebiasaan menyukai membaca materi yang berkaitan dengan IPA ', '2018-12-08 16:46:24', 31, 9, 0, NULL, NULL, 2),
(20, 'Menurut saya itu disebabkan oleh kurang dianggap pentingnya ilmu tersebut untuk para siswa, buku tersebut kurang menarik perhat', '2018-12-08 18:36:24', 45, 9, 0, NULL, NULL, 1),
(21, 'Menurut saya itu disebabkan oleh kurang dianggap pentingnya ilmu tersebut untuk para siswa, buku tersebut kurang menarik perhatian para siswa, dan isinya kurang ringkas. Untuk solusinya yaitu dengan menyampaikan bahwa ilmu yg dipelajari itu sangat lah penting bagi kehidupan saat ini atau masa depan. Membuat buku yang lebih langsung ada penerapannya sehingga bisa langsung dipraktekkan. Terimakasih, semoga bisa bermanfaat dan memmbantu', '2018-12-08 18:40:34', 45, 9, 0, NULL, NULL, 2),
(22, 'menurut saya masalah tersebut disebabkan oleh bahasa yang ada di materi pelajaran IPA banyak menggunakan bahasa ilmiah sehingga membuat siswa malas membaacanya dan kurang mengerti bahasa-bahasa ilmiah didalamnya. yang harus dilakukan guru agar siswanya senang membaca buku adalah mengkaitkan materi-materi tersebut dengan kehidpan sehari-hari atau nyata, menanamkan motivasi belajar kepada siswa, dan menceitakan atau sharing kepada siswa pengaruh yang dihasilkan dari membaca buku sehingga siswa menjadi penasaran akan hal tersebut dan siswa akhirnya mau membaca buku tersebut lebih lanjut', '2018-12-09 09:11:56', 34, 9, 0, NULL, NULL, 2),
(23, 'menurut saya, masalah tersebut diakibatkan karena siswa menganggap bahwa materi "MATEMATIKA ITU SULIT". saran saya hal yang harus dilakukan oleh guru yaitu guru harus mampu membangkitkan minat siswa dalam kegiatan pembelajaran, menyusun strategi belajar atau suasana belajar yang bervariasi dan menyenangkan sehingga membuat siswa tersebut aktif dalam kegiatan tersebut. seperti menyajikan materi didampingi dengan permainan.', '2018-12-09 09:30:57', 34, 8, 0, NULL, NULL, 2),
(24, 'Pelajaran ipa akan sangat mudah dipahami jika guru membawa pengantar yang baik. Hal ini menjadikan ketakutan siswa mereda. Kemudian guru harus memahami Benar materi dan Menjelaskan dengan penggambaran siklus Atau urut2an pengerjaan Soal. Untuk menstimulasi siswa membawa buku, guru memberikan Soal yang bersangkutan dengan materi yang dijelaskan.', '2018-12-09 11:43:07', 57, 9, 0, NULL, NULL, 2),
(25, 'Guru memberikan contoh pengerjaan Soal secara terperinci hingga kemungkinan dibagian besar paham. Kemudian memberikan Soal yang sama Persis dengan materi, jika siswa bisa menyelesaikan dengan sedikit mudah, siswa biasanya akan terpacu Dan akhirnya menjadi lebih menyukai Pelajarannya.', '2018-12-09 11:48:19', 57, 8, 0, NULL, NULL, 2),
(26, 'Menurut saya, sebagai seorang guru harus memiliki kepribadian yang humble dan welcome dulu kepada siswa karena seorang siswa biasanya untuk suka terhadap pelajaran dilihat dulu gurunya seperti apa. kemudian setelah itu guru memberikan kegiatan pembelajaran yang menarik dan bervariasi seperti setelah memberikan pembelajaran berkaitan materi kemudian diberikan permainan sehingga siswa tidak mudah bosan. ', '2018-12-09 16:01:04', 46, 8, 0, NULL, NULL, 2),
(27, 'Menurut saya, guru seharusnya memilihkan sumber pembelajaran (buku) IPA yang mudah di pahami siswa karena tidak sedikit buku IPA yang bahasanya berat bagi siswa SMP. Setelah itu, setiap kegiatan pembelajaran dilakukan dengan membahas materi yang bersumber dari buku yang dipelajari siswa tersebut dengan cara siswa di berikan tugas meringkas materi dirumah berkaitan dengan materi yang akan dipelajari pertemuan yang akan datang. Kemudian pada saat pertemuan dikelas guru menjelaskan materi yang sudah dipelajari siswa menggunakan media pembelajaran yang menarik berdasarkan dari sumber pembelajaran (buku) yang sama. ', '2018-12-09 16:22:19', 46, 9, 0, NULL, NULL, 3),
(28, 'Menurut saya saran yang tepat adalah dalam penyampaian materi guru menggunakan contoh nyata dan sesuai dengan kondisi siswa yang di ajar.  Buku ajarnya disusun yang lebih menarik seperti desain yang menarik , bahasa yang komunukatif, dan lain-lain.', '2018-12-09 16:51:47', 24, 9, 0, NULL, NULL, 2),
(29, 'Menurut saya, siswa SD sudah terdoktrin bahwa Matematika itu sulit. Untuk mengatasi masalah ini, seorang guru seharusnya menerapkan pembelajaran matematika dengan basis bermain, atau langsung praktik sehingga siswa dapat mengetahui apa manfaat mereka belajar matematika, dan saya sebagai mahasiswa juga masih belajar membuat media pembelajaran dari gabungan beberapa aplikasi yang telah diajarkan oleh dosen saya. Media pembelajaran ini berupa suatu presentasi dengan tema yang saya ambil yaitu petualangan. Disana siswa akan ditunjukkan tema yang akan dipelajari pada pertemuan kala itu, kemudian di Level 1 akan dimulai dengan materi, untuk menuju ke level selanjutnya siswa harus bisa menyelesaikan tantangan di Level 1, dan seterusnya. sampai akhirnya siswa dapat mengevaluasi dirinya apakah dia mampu dan langsung tahu nilai yang muncul ketika dia mengerjakan evaluasi tersebut.', '2018-12-09 17:01:25', 29, 8, 0, NULL, NULL, 3),
(30, 'Mata pelajaran Matematika itu memang agak sulit jadi perlu telaten untuk mengajarkannya. Sarannya saya agar anak SD mau belajar matematika harus dengan strategi yang tepat , memberikan game, serta mengajari perkalian dasar menggunakan jari2 tangan. Guru waktu menerangkan jangan terlalu cepat, memberikan rumus dari yang mudah dipahami lalu jika anak sudah faseh baru di beri rumus cepat cara menghitung matematika. ', '2018-12-09 17:12:27', 24, 8, 0, NULL, NULL, 2),
(31, 'Menurut  masalah tersebut timbul karena buku IPA yang terlalu banyak materi saja sehingga membuat bosan dan membaca buku. Saran saya agar siswa senang membaca buku terutama materi buku IPA yaitu dengan hendaknya tidak melulu memberikan materi dalam bentuk buku, akan tetapi juga guru perlu memberikan atau membuatkan buku digital seperti flipbook yang dapat diberi animasi-animasi, gambar-gambar, dan suara atau lagu terkait materi IPA, sehingga siswa tidak mudah bosan dalam membaca buku. Selain itu, juga membiasakan sebelum memulai materi pelajaran dibiasakan untuk membaca buku terlebih dahulu, dan setelah pembelajaran selesai siswa juga dapat ditugaskan untuk merangkum materi yang akan dipelajari pada pertemuan berikutnya. Saat di kelas juga guru sebaiknya menggunakan media pembelajaran yang dapat menarik, dan menimbulkan rasa ingin tahu pada siswa, sehingga mereka mau membaca atau mencari di buku ????', '2018-12-10 16:47:38', 27, 9, 0, NULL, NULL, 3),
(32, 'Masalah tersebut mungkin sudah menjadi paradoks bahwa matematika itu sulit, ribet, apalagi jika sudah mengerjakan soal dan jawaban tidak sesuai sudah bikin males. Oleh karena itu saran saya agar siswa tertarik belajar matematika hendakanya guru dikelas menggunakan media pembelajaran yang menarik, pembelajaran interaktif dengan materi yang menarik , mudah difahami, dan juga yang melibatkan siswa itu sendiri. Dan dalam pengaplikasian nya bisa soal tersebut bisa dijadikan game-game yang menarik dan menantang untuk dikerjakan oleh siswa SD. Selain itu saat di kelas hendaknya guru memberikan reward untuk siswa yang dapat menjawab dan menyelesaikan soal, sehingga hal tersebut akan mendorong siswa untuk tertarik dan belajar matematika.', '2018-12-10 17:26:34', 27, 8, 0, NULL, NULL, 3),
(33, 'Menurut saya buku pelajaran IPA itu bahasanya banyak yang susah dipahami sehingga minat membaca siswanya berkurang. Jadi guru harus menggunakan media pembelajaran yang bervariasi agar siswa nya tidak mudah bosan terkait mata pelajaran IPA. Selain itu guru juga harus sering” memberi motivasi kepada siswa nya agar senang membaca buku karena “buku adalah jendela dunia” dan bisa mengajak siswa nya untuk pergi ke perpustakaan agar minat membaca siswanya bertambah.', '2018-12-11 09:17:26', 26, 9, 0, NULL, NULL, 3),
(34, 'Menurut saya setiap anak-anak sd biasanya merasa pelajaran matematika  sulit untuk dipahami ,padahal pelajaran ini menjadi komponen wajib dalam kurikulum dan memiliki manfaat yang baik yaitu bisa meningkatkan kemampuan anak dalam berpikir dan berargumentasi. Untuk itu agar anak bisa tertarik dalam pelajaran matematika  dan tidak merasa jika matematika itu sulit  Maka guru  dalam pengajaran matematika sebaiknya menempatkan anak sebagai subjek yang aktif dan juga menumbuhkan minat belajar matematika anak dengan cara  sebagai berikut :\r\n1)Menyampaikan materi pelajaran matematika  dengan bercerita dan memberi contoh.Misalnya,untuk materi tentang bangun ruang, anak diminta berimajinasi sedang berada dalam sebuah primas atau linmas. Mereka diminta  untuk merasakan permukaan, garis dan titik sudutnya.  Materi lain  seperti aritmatika,anak-anak bisa diminta membayangkan sedang melompat dalam bak pasir kemudian melompat lagi dan akhirnya dapat menghitung total jumlah lompatan.\r\n2)Mengajak anak berlomba  mengerjakan soal matematika. Jika terlibat dalam sebuah perlombaan, anak akan termotivasi untuk menyelesaikan soal matematika  dan cara ini lebih menyenangkan apalagi jika ada reward yang bisa diterapkan.\r\n3)Menerjemahkan soal matematika dalam bentuk permainan .Misalnya untuk konsep pengurangan dan penjumlahan pada sekolah dasar bisa dikenalkan melalui permainan peran sebagai penjual dan pembeli\r\n4)Melibatkan kemampuan anak untuk memecahkan masalah matematika. Anak diberi permasalahan matematis yang terdapat dalam kehidupan sehari-hari dan diajak untuk menyelesaikan secara sistematis. Misal: berapa jumlah kue yang bisa dimakan oleh dua anak jika dalam sehari mereka bisa makan kue sebanyak 3 kali dengan jumlah masing-masing 2 buah kue.\r\n Dengan metode pembelajaran yang seperti itu maka siswa akan lebih tertarik belajar matematika dan mereka anak merasa belajar matematika menyenangkan', '2018-12-11 10:51:37', 66, 8, 0, NULL, NULL, 5),
(35, 'Dengan memberikan inovasi baru. Agar minat baca siswa SMP menjadi lebih meningkat. Seperti belajar/membaca buku ditaman.', '2018-12-11 10:59:59', 48, 9, 0, NULL, NULL, 1),
(36, 'Menurut saya, mata pelajaran matematika terasa sulit karena semua terpaut pada angka, dan memiliki jawaban yang pasti, dan  dari awal sudah ditanamkan mindset bahwa "matematika itu sulit" dan lagi, matematika memiliki banyak rumus. Nah sebagai pendidik haruslah mengubah mindset "matematika sulit" itu, hal tersebut dapat dilakukan dengan variasi interaksi dan juga variasi media pembelajaran. Variasi media pembelajaran ini sangatlah penting dalam proses belajar mengajar, karena hal ini bisa menambah ketertarikan siswa terhadap mateti pembelajaran. Usia anak SD masih tergolong anak" dan masih suka bermain, maka guru harus membuat pelajaran matematika layaknya mereka sedang bermain, dan memberikan sesuatu yang mudah untuk dihafal, misalnya menghafalkan rumus dengan bernyanyi atau singkatan kata. Semoga bermanfaat..', '2018-12-11 11:03:12', 50, 8, 0, NULL, NULL, 3),
(37, 'Menurut saya, metode pembelajarannya diubah menjadi lebih menyenangkan agar siswa SD lebih tertarik dengan pelajaran tersebut. Tidak monoton belajar dengan buku saja.', '2018-12-11 11:04:43', 48, 8, 0, NULL, NULL, 1),
(38, 'Menurut saya  untuk membuat siswa  tertarik untuk membaca materi pelajaran ipa adalah dengan membiasakan siswa untuk membaca  buku pada setiap pertemuan dalam jangka waktu 5-10 menit  dengan begitu siswa akan terbiasa . Jika sudah terbiasa maka mereka lama-kelamaan akan menjadikan membaca buku ipa sebagai suatu kebiasaan yang menyenangkan .', '2018-12-11 11:09:37', 66, 9, 0, NULL, NULL, 2),
(39, 'Menurut saya, buku-buku yang terkait pelajaran IPA biasanya ada banyak kata kata yang sulit dipahami dan membutuhkan waktu yang lama untuk memahami buku tsb. Maka dari itu, sebaiknya pendidik/ guru harus membiasakan siswa untuk membaca buku tsb dengan cara merekomendasikan buku yg terkait pelajaran IPA pada setiap 2 minggu sekali dan menarik perhatian siswa dengan kata" yang menarik, seperti mereview buku tsb semenarik dan sebagus mungkin. Setiap buku IPA  memiliki tingkat kesulitan sendiri, untuk siswa SMP rekomendasikan buku yang menarik tapi mudah dipahami. Semoga bermanfaat..', '2018-12-11 11:26:15', 50, 9, 0, NULL, NULL, 2),
(40, '53\r\nMareta Bunga Pratiwi  Photo\r\nHome  Pertanyaan Detail\r\n×Berhasil! Jawaban anda telah dipublish\r\n Dashboard\r\nBantu Jawab\r\nApa yang guru bisa lakukan untuk membuat siswanya di SMP senang membaca buku terkait materi pelajaran IPA?\r\n Dec, 05 2018	  16	  21\r\n 16 Jawaban\r\nPenjawab  Photo   Photo   Photo   Photo  11\r\nMenurut saya masalah tersebut timbul karena siswa SMP merasa bosan dengan buku mereka yg memiliki bahasa ilmiah cukup sulit dipahami . Saran saya sebaiknya bahasa di dalam buku diringkas lebih baik agar mudah dipahami dan buku diberi gambar gambar agar tidak terlihat monoton\r\nPhoto  Dea Putri Lailatul Qudus\r\nReview Jawaban     \r\nMenurut saya, masalah yang timbul mungkin karena pembelajaran yang monoton, dan tidak ada inovasi dari guru. Saran saya, guru lebih mengkaitkan dengan kehidupan sehari-hari, menyediakan media belajar yg sumber materinya dari buku, misalnya praktikum atau tugas yang panduannya dapat ditemukan dibuku, dan menggunakan buku yang bergambar, tidak monoton teks.\r\nPhoto  Faricha Alif Vaniza\r\nReview Jawaban     \r\nMenurut saya, siswa SMP kebanyakan bosan dengan mata pelajaran IPA dan pemahaman siswa tersebut masih kurang. Agar siswa SMP senang membaca buku terkait materi pelajaran IPA dengan menambah materi yang dapat dipelajari.\r\nPhoto  Agam Firdaus Junaidi\r\nReview Jawaban     \r\nMenurut saya siwa kurang senang dalam membaca materi pelajaran IPA karena didalam buku tersebut hanya membahas materi-materi saja yang dapan membuat siswa menjadi bosan dan tidak tertarik. Sehingga cara yang dilakukan untuk menarik minat baca siswa yaitu di dalam buku materi IPA disertai dengan cerita atau studi kasus yang ada dalam kehidupan sehari-hari dan disertai dengan gambar-gambar yang berwarna yang dapat menarik perhatian siswa SMP. Selain itu juga yang dapat membuat siswa tidak tertarik karena tidak nyamannya tempat untuk membaca. Sehingga di dalam kelas bisa di setting dengan baik menyesuaikan dengan kemauan siswa serta diberikan slogan-slogan untuk memotivasi siwa dalam membaca.\r\nPhoto  Isvina Uma Izah\r\nReview Jawaban     \r\nMenurut saya, sebaiknya guru memberikan materi pembelajaran dengan cara menggali sendiri materi tersebut dan mengajak keperpustakaan dari hal tersebut siswa akan mempunyai kebiasaan menyukai membaca materi yang berkaitan dengan IPA\r\nPhoto  Made Ema Parurahwani\r\nReview Jawaban     \r\nMenurut saya itu disebabkan oleh kurang dianggap pentingnya ilmu tersebut untuk para siswa, buku tersebut kurang menarik perhat\r\nPhoto  Moh Hasan Safroni\r\nReview Jawaban     \r\nMenurut saya itu disebabkan oleh kurang dianggap pentingnya ilmu tersebut untuk para siswa, buku tersebut kurang menarik perhatian para siswa, dan isinya kurang ringkas. Untuk solusinya yaitu dengan menyampaikan bahwa ilmu yg dipelajari itu sangat lah penting bagi kehidupan saat ini atau masa depan. Membuat buku yang lebih langsung ada penerapannya sehingga bisa langsung dipraktekkan. Terimakasih, semoga bisa bermanfaat dan memmbantu\r\nPhoto  Moh Hasan Safroni\r\nReview Jawaban     \r\nmenurut saya masalah tersebut disebabkan oleh bahasa yang ada di materi pelajaran IPA banyak menggunakan bahasa ilmiah sehingga membuat siswa malas membaacanya dan kurang mengerti bahasa-bahasa ilmiah didalamnya. yang harus dilakukan guru agar siswanya senang membaca buku adalah mengkaitkan materi-materi tersebut dengan kehidpan sehari-hari atau nyata, menanamkan motivasi belajar kepada siswa, dan menceitakan atau sharing kepada siswa pengaruh yang dihasilkan dari membaca buku sehingga siswa menjadi penasaran akan hal tersebut dan siswa akhirnya mau membaca buku tersebut lebih lanjut\r\nPhoto  Maziyatus Sariroh Yusro\r\nReview Jawaban     \r\nPelajaran ipa akan sangat mudah dipahami jika guru membawa pengantar yang baik. Hal ini menjadikan ketakutan siswa mereda. Kemudian guru harus memahami Benar materi dan Menjelaskan dengan penggambaran siklus Atau urut2an pengerjaan Soal. Untuk menstimulasi siswa membawa buku, guru memberikan Soal yang bersangkutan dengan materi yang dijelaskan.\r\nPhoto  Bima Wahyu Syahputra\r\nReview Jawaban     \r\nMenurut saya, guru seharusnya memilihkan sumber pembelajaran (buku) IPA yang mudah di pahami siswa karena tidak sedikit buku IPA yang bahasanya berat bagi siswa SMP. Setelah itu, setiap kegiatan pembelajaran dilakukan dengan membahas materi yang bersumber dari buku yang dipelajari siswa tersebut dengan cara siswa di berikan tugas meringkas materi dirumah berkaitan dengan materi yang akan dipelajari pertemuan yang akan datang. Kemudian pada saat pertemuan dikelas guru menjelaskan materi yang sudah dipelajari siswa menggunakan media pembelajaran yang menarik berdasarkan dari sumber pembelajaran (buku) yang sama.\r\nPhoto  Indah Larasati\r\nReview Jawaban     \r\nMenurut saya saran yang tepat adalah dalam penyampaian materi guru menggunakan contoh nyata dan sesuai dengan kondisi siswa yang di ajar. Buku ajarnya disusun yang lebih menarik seperti desain yang menarik , bahasa yang komunukatif, dan lain-lain.\r\nPhoto  Ika Kharismadewi\r\nReview Jawaban     \r\nMenurut masalah tersebut timbul karena buku IPA yang terlalu banyak materi saja sehingga membuat bosan dan membaca buku. Saran saya agar siswa senang membaca buku terutama materi buku IPA yaitu dengan hendaknya tidak melulu memberikan materi dalam bentuk buku, akan tetapi juga guru perlu memberikan atau membuatkan buku digital seperti flipbook yang dapat diberi animasi-animasi, gambar-gambar, dan suara atau lagu terkait materi IPA, sehingga siswa tidak mudah bosan dalam membaca buku. Selain itu, juga membiasakan sebelum memulai materi pelajaran dibiasakan untuk membaca buku terlebih dahulu, dan setelah pembelajaran selesai siswa juga dapat ditugaskan untuk merangkum materi yang akan dipelajari pada pertemuan berikutnya. Saat di kelas juga guru sebaiknya menggunakan media pembelajaran yang dapat menarik, dan menimbulkan rasa ingin tahu pada siswa, sehingga mereka mau membaca atau mencari di buku ????\r\nPhoto  Lisa Helendriani\r\nReview Jawaban     \r\nMenurut saya buku pelajaran IPA itu bahasanya banyak yang susah dipahami sehingga minat membaca siswanya berkurang. Jadi guru harus menggunakan media pembelajaran yang bervariasi agar siswa nya tidak mudah bosan terkait mata pelajaran IPA. Selain itu guru juga harus sering” memberi motivasi kepada siswa nya agar senang membaca buku karena “buku adalah jendela dunia” dan bisa mengajak siswa nya untuk pergi ke perpustakaan agar minat membaca siswanya bertambah.\r\nPhoto  Mila Noni Alfiolita\r\nReview Jawaban     \r\nDengan memberikan inovasi baru. Agar minat baca siswa SMP menjadi lebih meningkat. Seperti belajar/membaca buku ditaman.\r\nPhoto  Milasari Saharuddin\r\nReview Jawaban     \r\nMenurut saya untuk membuat siswa tertarik untuk membaca materi pelajaran ipa adalah dengan membiasakan siswa untuk membaca buku pada setiap pertemuan dalam jangka waktu 5-10 menit dengan begitu siswa akan terbiasa . Jika sudah terbiasa maka mereka lama-kelamaan akan menjadikan membaca buku ipa sebagai suatu kebiasaan yang menyenangkan .\r\nPhoto  Intan Dewanti\r\nReview Jawaban     \r\nMenurut saya, buku-buku yang terkait pelajaran IPA biasanya ada banyak kata kata yang sulit dipahami dan membutuhkan waktu yang lama untuk memahami buku tsb. Maka dari itu, sebaiknya pendidik/ guru harus membiasakan siswa untuk membaca buku tsb dengan cara merekomendasikan buku yg terkait pelajaran IPA pada setiap 2 minggu sekali dan menarik perhatian siswa dengan kata" yang menarik, seperti mereview buku tsb semenarik dan sebagus mungkin. Setiap buku IPA memiliki tingkat kesulitan sendiri, untuk siswa SMP rekomendasikan buku yang menarik tapi mudah dipahami. Rekomendasikan buku secara bertahap, misalnya minggu ini buku yg menarik, banyak gambarnya dan sangat mudah dipahami. 2 minggu berikutnya rekomendasikan buku yg sedikit lebih sulit (naik tingkat) tapi tetap menarik. Dan 2 minggu berikutnya rekomendasikan buku yang sulit dipahami tapi tetap menarik. Karena bila bertahap maka kesulitan" dalam pemahaman buku tidak begitu terasa berat.\r\nSemoga bermanfaat..', '2018-12-11 11:31:48', 50, 9, 0, NULL, NULL, NULL),
(41, 'Menurut saya, buku-buku yang terkait pelajaran IPA biasanya ada banyak kata kata yang sulit dipahami dan membutuhkan waktu yang lama untuk memahami buku tsb. Maka dari itu, sebaiknya pendidik/ guru harus membiasakan siswa untuk membaca buku tsb dengan cara merekomendasikan buku yg terkait pelajaran IPA pada setiap 2 minggu sekali dan menarik perhatian siswa dengan kata" yang menarik, seperti mereview buku tsb semenarik dan sebagus mungkin. Setiap buku IPA memiliki tingkat kesulitan sendiri, untuk siswa SMP rekomendasikan buku yang menarik tapi mudah dipahami. Rekomendasikan buku secara bertahap, misalnya minggu ini buku yg menarik, banyak gambarnya dan sangat mudah dipahami. 2 minggu berikutnya rekomendasikan buku yg sedikit lebih sulit (naik tingkat) tapi tetap menarik. Dan 2 minggu berikutnya rekomendasikan buku yang sulit dipahami tapi tetap menarik. Karena bila bertahap maka kesulitan" dalam pemahaman buku tidak begitu terasa berat.\r\nSemoga bermanfaat..', '2018-12-11 11:33:19', 50, 9, 0, NULL, NULL, 2),
(42, 'menurut saya, siswa smp kurang tertarik membaca buku karena mereka kurang mendapatkan dukungan atau motivasi dari gurunya, saran saya dengan memberikan sedikit motivasi kepada siswanya, bisa juga dengan memberi tugas untuk merangkum buku, sehingga siswa tersebut mulai terbiasa untuk membaca buku', '2018-12-12 21:11:05', 65, 9, 9, NULL, NULL, 1),
(43, 'menurut saya, siswa tidak tertarik dengan pelajaran matematika bisa akibat gurunya yang kurang menarik perhatian atau karena matematika bukan bidangnya. jadi saran saya, sebagai guru harus memiliki daya tarik kepada siswanya sehingga siswa tersebut bisa mengikuti pelajarab matematika dengan pikiran yang terbuka, dan juga dengan metode pembelajaran yang tidak membuat kelas tersebut menjadi bosan maka siswa akan senang dengan pelajaran tersebut.', '2018-12-12 21:18:03', 65, 8, 8, NULL, NULL, 2),
(44, 'Menurut saya, siswa SD tidak tertarik dengan mata pelajaran matematika karena matematika cenderung hanya menggunakan angka yang melibatkan rumus yg rumit maka tertanam dalam pikiran mereka matematika itu sulit sehingga membuat jenuh dan tidak tertarik. Maka solusinya dari saya yang dulu sangat menyukai cara mengajar guru matematika SD saya adalah, yang paling awal seorang guru harus menciptakan suasana yang menyenangkan tapi serius. Contohnya: di sela penjelasan guru menyisipkan lelucon kecil yang melibatkan siswa, atau bisa menyisipkan nama-nama siswa untuk dijadikan contoh di soal yang dicontohkan guru. Dari sana, siswa akan antusias dan merasa diperhatikan. Yang kedua, dalam menjelaskan materi atau rumus yang rumit, guru harus menerjemahkannya ke daam penjelasan yang lebih sederhana, ringan dan mudah dipahami atau bisa melibatkan hal-hal yang dialami siswa. Misalnya, dalam menghitung bilangan bulat (-4) + 1 dijelaskan "pensilnya Ali berkurang 4 karena dipinjam Ani, kemudian dikembalikan Ani 1 maka tinggal berapa yang belum dikembalikan ke Ali?" Dengan melibatkan siswa dan mengasumsikan dengan metode kontekstual atau penyederhanaan penjelasan seperti itu maka siswa akan berpikir dan menganalisa sendiri perhitunhan tanpa merasa terbebani. Yang ketiga adalah lebih banyak praktik dari teori, yakni sering-sering langsung ke contoh soal darioada hanya penjelasan. Sehingg siswa tidak jenuh melihat teori, tapi mencoba langsung. Dari itu guru juga dapat melihat dimana letak kesulitan yang sering dialami siswa untuk dijadikan penjelasan yg lebih sederhana lagi.', '2018-12-13 12:05:32', 40, 8, 8, NULL, NULL, 5),
(45, 'Ada Pak, bisa pakai powerpoint atau adobe flash', '2019-01-08 21:44:18', 2, 10, 10, NULL, NULL, 4);

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
-- Struktur dari tabel `log_pengunjung`
--

CREATE TABLE IF NOT EXISTS `log_pengunjung` (
`id` int(11) NOT NULL,
  `pengunjung` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log_pengunjung`
--

INSERT INTO `log_pengunjung` (`id`, `pengunjung`, `tanggal`) VALUES
(1, 1, '2019-02-06 22:48:23'),
(2, 1, '2019-02-08 17:16:17'),
(3, 1, '2019-02-08 17:23:48'),
(4, 3, '2019-02-12 11:55:27'),
(5, 1, '2019-02-12 12:27:21'),
(6, 2, '2019-02-12 12:34:10'),
(7, 1, '2019-02-12 13:45:24'),
(8, 2, '2019-02-12 14:23:27'),
(9, 3, '2019-02-12 14:28:41'),
(10, 1, '2019-02-12 14:55:15'),
(11, 1, '2019-02-12 15:02:13'),
(12, 1, '2019-02-12 15:27:32'),
(13, 2, '2019-02-12 15:28:05'),
(14, 1, '2019-02-12 15:31:11'),
(15, 1, '2019-02-12 15:39:07'),
(16, 2, '2019-02-12 15:42:29'),
(17, 3, '2019-02-12 15:47:26'),
(18, 2, '2019-02-12 15:48:36'),
(19, 2, '2019-02-12 19:35:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE IF NOT EXISTS `lokasi` (
`id` int(11) NOT NULL,
  `lokasi` varchar(255) NOT NULL
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
  `tanggal` datetime DEFAULT NULL,
  `dari` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `lowongan`
--

INSERT INTO `lowongan` (`id`, `nama`, `instansi`, `lokasi`, `kontak`, `valid`, `kategori`, `tanggal`, `dari`) VALUES
(1, 'Guru SD Bidang Studi Matematika', 'SDN 1', 'Malang', '123456798', 1, NULL, '2018-12-17 11:14:16', '17');

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
  `ikon_cat` varchar(255) DEFAULT NULL,
  `ikon_logo` varchar(255) DEFAULT NULL,
  `ikon_warna` varchar(255) DEFAULT NULL,
  `deskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id`, `nama`, `kategori`, `waktu_terakhir_edit`, `siapa_terakhir_edit`, `jumlah_diunduh`, `jumlah_dilihat`, `ikon_cat`, `ikon_logo`, `ikon_warna`, `deskripsi`) VALUES
(1, 'Aljabar Linier', 1, '2018-11-20', 20, '35', '0', 'cat-diamond', 'icon-material-diamond', 'blue', 'Ini adalah deskripsi dari suatu materi'),
(2, 'Bahasa Inggris Reading', 5, '2018-12-19', 3, '1', '0', 'cat-diamond', 'icon-material-plane', 'green', 'Materi reading'),
(3, 'Sifat Angka', 1, '2019-01-08', 3, '2', '0', 'cat-diamond', 'icon-material-diamond', 'gray', 'Sifat - sifat angka');

-- --------------------------------------------------------

--
-- Struktur dari tabel `max_notif_id_per_user`
--

CREATE TABLE IF NOT EXISTS `max_notif_id_per_user` (
`id` int(11) NOT NULL,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `max_notif_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `max_notif_id_per_user`
--

INSERT INTO `max_notif_id_per_user` (`id`, `id_pengguna`, `max_notif_id`) VALUES
(1, '1', 152),
(2, '2', 148),
(3, '3', 153),
(4, '4', 7),
(5, '5', 0),
(6, '6', 7),
(7, '7', 27),
(8, '8', 0),
(9, '9', 0),
(10, '10', 0),
(11, '11', 0),
(12, '12', 0),
(13, '13', 0),
(14, '14', 19),
(15, '15', 19),
(16, '16', 19),
(17, '17', 138),
(18, '18', 140),
(19, '19', 0),
(20, '20', 148),
(21, '21', 19),
(22, '22', 0),
(23, '23', 0),
(24, '24', 89),
(25, '25', 0),
(26, '26', 77),
(27, '27', 27),
(28, '28', 27),
(29, '29', 27),
(30, '30', 27),
(31, '31', 27),
(32, '32', 27),
(33, '33', 0),
(34, '34', 27),
(35, '35', 0),
(36, '36', 0),
(37, '37', 0),
(38, '38', 0),
(39, '39', 0),
(40, '40', 27),
(41, '41', 0),
(42, '42', 27),
(43, '43', 27),
(44, '44', 27),
(45, '45', 27),
(46, '46', 27),
(47, '47', 0),
(48, '48', 27),
(49, '49', 27),
(50, '50', 27),
(51, '51', 0),
(52, '52', 50),
(53, '53', 0),
(54, '54', 23),
(55, '55', 24),
(56, '56', 19),
(57, '57', 27),
(58, '58', 0),
(59, '59', 27),
(60, '60', 0),
(61, '61', 0),
(62, '62', 27),
(63, '63', 0),
(64, '64', 0),
(65, '65', 27),
(66, '66', 27),
(67, '67', 0),
(68, '68', 0),
(69, '69', 0),
(70, '70', 0),
(71, '71', 0),
(72, '72', 0),
(73, '73', 0),
(74, '74', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=latin1;

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
(15, 'dm', 4, 7, '20', '2018-11-16 19:16:49', NULL, 'sudah'),
(16, 'ratingKomentar', 7, 20, '4', '2018-11-20 04:55:38', NULL, NULL),
(17, 'ratingKomentar', 7, 20, '6', '2018-11-20 04:55:39', NULL, NULL),
(18, 'ratingKomentar', 7, 20, '7', '2018-11-20 04:55:41', NULL, NULL),
(19, 'materiBaru', 1, 20, 'semua', '2018-11-20 09:58:36', NULL, NULL),
(23, 'komentar', 8, 55, '54', '2018-11-20 12:46:05', NULL, NULL),
(24, 'ratingKomentar', 8, 54, '55', '2018-11-20 12:46:41', NULL, NULL),
(25, 'komentar', 1, 7, '18', '2018-11-22 14:39:03', NULL, NULL),
(26, 'pertanyaan', 8, 17, 'mahasiswa', '2018-12-05 20:04:19', NULL, NULL),
(27, 'pertanyaan', 9, 18, 'mahasiswa', '2018-12-05 20:07:26', NULL, NULL),
(28, 'komentar', 8, 49, '17', '2018-12-06 14:04:39', NULL, NULL),
(32, 'ratingKomentar', 8, 17, '55', '2018-12-06 14:59:45', NULL, NULL),
(33, 'ratingKomentar', 8, 17, '49', '2018-12-06 15:00:00', NULL, NULL),
(34, 'dm', 7, 17, '55', '2018-12-06 15:00:33', NULL, NULL),
(35, 'komentar', 9, 44, '18', '2018-12-06 19:36:03', NULL, NULL),
(36, 'komentar', 8, 44, '17', '2018-12-06 19:41:01', NULL, NULL),
(40, 'ratingKomentar', 8, 17, '44', '2018-12-07 05:39:04', NULL, NULL),
(44, 'komentar', 9, 52, '18', '2018-12-07 21:27:50', NULL, NULL),
(45, 'komentar', 8, 52, '17', '2018-12-07 21:37:59', NULL, NULL),
(46, 'komentar', 8, 30, '17', '2018-12-08 05:18:28', NULL, NULL),
(47, 'ratingKomentar', 8, 17, '52', '2018-12-08 07:39:06', NULL, NULL),
(48, 'ratingKomentar', 8, 17, '30', '2018-12-08 07:39:13', NULL, NULL),
(49, 'ratingKomentar', 9, 18, '44', '2018-12-08 07:39:59', NULL, NULL),
(50, 'ratingKomentar', 9, 18, '52', '2018-12-08 07:40:05', NULL, NULL),
(52, 'komentar', 8, 26, '17', '2018-12-08 13:52:30', NULL, NULL),
(53, 'komentar', 8, 43, '17', '2018-12-08 13:53:45', NULL, NULL),
(54, 'komentar', 8, 42, '17', '2018-12-08 14:22:49', NULL, NULL),
(55, 'komentar', 9, 42, '18', '2018-12-08 14:29:19', NULL, NULL),
(56, 'komentar', 8, 62, '17', '2018-12-08 15:01:05', NULL, NULL),
(58, 'komentar', 9, 62, '18', '2018-12-08 15:16:55', NULL, NULL),
(59, 'komentar', 8, 31, '17', '2018-12-08 16:32:28', NULL, NULL),
(60, 'komentar', 9, 31, '18', '2018-12-08 16:46:24', NULL, NULL),
(61, 'komentar', 9, 45, '18', '2018-12-08 18:36:24', NULL, NULL),
(62, 'komentar', 9, 45, '18', '2018-12-08 18:40:34', NULL, NULL),
(63, 'komentar', 9, 34, '18', '2018-12-09 09:11:56', NULL, NULL),
(64, 'komentar', 8, 34, '17', '2018-12-09 09:30:57', NULL, NULL),
(65, 'komentar', 9, 57, '18', '2018-12-09 11:43:07', NULL, NULL),
(66, 'komentar', 8, 57, '17', '2018-12-09 11:48:19', NULL, NULL),
(67, 'komentar', 8, 46, '17', '2018-12-09 16:01:04', NULL, NULL),
(68, 'komentar', 9, 46, '18', '2018-12-09 16:22:19', NULL, NULL),
(69, 'komentar', 9, 24, '18', '2018-12-09 16:51:47', NULL, NULL),
(70, 'komentar', 8, 29, '17', '2018-12-09 17:01:25', NULL, NULL),
(71, 'komentar', 8, 24, '17', '2018-12-09 17:12:27', NULL, NULL),
(76, 'ratingKomentar', 8, 17, '26', '2018-12-10 14:21:01', NULL, NULL),
(77, 'ratingKomentar', 8, 17, '26', '2018-12-10 14:21:07', NULL, NULL),
(78, 'ratingKomentar', 8, 17, '43', '2018-12-10 14:21:21', NULL, NULL),
(79, 'ratingKomentar', 8, 17, '42', '2018-12-10 14:21:26', NULL, NULL),
(80, 'ratingKomentar', 8, 17, '42', '2018-12-10 14:22:21', NULL, NULL),
(81, 'ratingKomentar', 8, 17, '62', '2018-12-10 14:22:35', NULL, NULL),
(82, 'ratingKomentar', 8, 17, '31', '2018-12-10 14:23:33', NULL, NULL),
(83, 'ratingKomentar', 8, 17, '34', '2018-12-10 14:24:36', NULL, NULL),
(84, 'ratingKomentar', 8, 17, '57', '2018-12-10 14:24:48', NULL, NULL),
(85, 'ratingKomentar', 8, 17, '46', '2018-12-10 14:35:25', NULL, NULL),
(86, 'ratingKomentar', 8, 17, '29', '2018-12-10 14:35:36', NULL, NULL),
(87, 'ratingKomentar', 8, 17, '24', '2018-12-10 14:35:48', NULL, NULL),
(88, 'ratingKomentar', 8, 17, '24', '2018-12-10 14:35:49', NULL, NULL),
(89, 'ratingKomentar', 8, 17, '24', '2018-12-10 14:35:53', NULL, NULL),
(90, 'komentar', 9, 27, '18', '2018-12-10 16:47:38', NULL, NULL),
(91, 'komentar', 8, 27, '17', '2018-12-10 17:26:34', NULL, NULL),
(92, 'komentar', 9, 26, '18', '2018-12-11 09:17:26', NULL, NULL),
(95, 'komentar', 8, 66, '17', '2018-12-11 10:51:37', NULL, NULL),
(96, 'komentar', 9, 48, '18', '2018-12-11 10:59:59', NULL, NULL),
(97, 'komentar', 8, 50, '17', '2018-12-11 11:03:12', NULL, NULL),
(98, 'komentar', 8, 48, '17', '2018-12-11 11:04:43', NULL, NULL),
(99, 'komentar', 9, 66, '18', '2018-12-11 11:09:37', NULL, NULL),
(100, 'komentar', 9, 50, '18', '2018-12-11 11:26:15', NULL, NULL),
(101, 'komentar', 9, 50, '18', '2018-12-11 11:31:48', NULL, NULL),
(102, 'komentar', 9, 50, '18', '2018-12-11 11:33:19', NULL, NULL),
(103, 'komentar', 9, 65, '18', '2018-12-12 21:11:05', NULL, NULL),
(104, 'komentar', 8, 65, '17', '2018-12-12 21:18:03', NULL, NULL),
(105, 'komentar', 8, 40, '17', '2018-12-13 12:05:32', NULL, NULL),
(106, 'ratingKomentar', 8, 17, '27', '2018-12-14 04:14:12', NULL, NULL),
(107, 'ratingKomentar', 8, 17, '66', '2018-12-14 04:14:33', NULL, NULL),
(108, 'ratingKomentar', 8, 17, '50', '2018-12-14 04:14:54', NULL, NULL),
(109, 'ratingKomentar', 8, 17, '50', '2018-12-14 04:15:06', NULL, NULL),
(110, 'ratingKomentar', 8, 17, '48', '2018-12-14 04:15:16', NULL, NULL),
(111, 'ratingKomentar', 8, 17, '65', '2018-12-14 04:15:24', NULL, NULL),
(112, 'ratingKomentar', 8, 17, '40', '2018-12-14 04:15:32', NULL, NULL),
(113, 'ratingKomentar', 9, 18, '52', '2018-12-14 04:17:00', NULL, NULL),
(114, 'ratingKomentar', 9, 18, '42', '2018-12-14 04:17:04', NULL, NULL),
(115, 'ratingKomentar', 9, 18, '42', '2018-12-14 04:17:08', NULL, NULL),
(116, 'ratingKomentar', 9, 18, '62', '2018-12-14 06:07:31', NULL, NULL),
(117, 'ratingKomentar', 9, 18, '31', '2018-12-14 06:07:37', NULL, NULL),
(118, 'ratingKomentar', 9, 18, '45', '2018-12-14 06:07:40', NULL, NULL),
(119, 'ratingKomentar', 9, 18, '45', '2018-12-14 06:07:57', NULL, NULL),
(120, 'ratingKomentar', 9, 18, '34', '2018-12-14 06:08:28', NULL, NULL),
(121, 'ratingKomentar', 9, 18, '34', '2018-12-14 06:08:29', NULL, NULL),
(122, 'ratingKomentar', 9, 18, '57', '2018-12-14 06:08:45', NULL, NULL),
(123, 'ratingKomentar', 9, 18, '46', '2018-12-14 06:13:30', NULL, NULL),
(124, 'ratingKomentar', 9, 18, '24', '2018-12-14 06:13:35', NULL, NULL),
(125, 'ratingKomentar', 9, 18, '27', '2018-12-14 06:13:41', NULL, NULL),
(126, 'ratingKomentar', 9, 18, '27', '2018-12-14 06:13:42', NULL, NULL),
(127, 'ratingKomentar', 9, 18, '26', '2018-12-14 06:13:54', NULL, NULL),
(128, 'ratingKomentar', 9, 18, '48', '2018-12-14 06:13:58', NULL, NULL),
(129, 'ratingKomentar', 9, 18, '66', '2018-12-14 06:14:05', NULL, NULL),
(130, 'ratingKomentar', 9, 18, '50', '2018-12-14 06:14:15', NULL, NULL),
(131, 'ratingKomentar', 9, 18, '50', '2018-12-14 06:14:49', NULL, NULL),
(132, 'ratingKomentar', 9, 18, '65', '2018-12-14 06:14:52', NULL, NULL),
(134, 'dm', 12, 17, '52', '2018-12-17 10:39:02', NULL, NULL),
(135, 'dm', 13, 17, '52', '2018-12-17 10:53:32', NULL, NULL),
(137, 'lowonganValid', 1, 1, '17', '2018-12-17 11:14:46', NULL, NULL),
(138, 'lowonganAvailable', 1, 1, 'semua', '2018-12-17 11:14:46', NULL, NULL),
(139, 'pertanyaan', 10, 3, 'mahasiswa', '2018-12-19 14:27:55', NULL, NULL),
(140, 'materiBaru', 2, 3, 'semua', '2018-12-19 14:37:28', NULL, NULL),
(141, 'dm', 14, 20, '7', '2019-01-03 22:55:06', NULL, NULL),
(142, 'komentar', 10, 2, '3', '2019-01-08 21:44:18', NULL, NULL),
(143, 'ratingKomentar', 10, 3, '2', '2019-01-08 21:44:47', NULL, NULL),
(144, 'dm', 17, 3, '2', '2019-01-08 21:45:25', NULL, 'sudah'),
(145, 'dm', 18, 3, '2', '2019-01-08 21:47:28', NULL, 'sudah'),
(146, 'dm', 19, 2, '3', '2019-01-08 21:57:51', NULL, 'sudah'),
(147, 'dm', 20, 2, '3', '2019-01-08 21:59:36', NULL, 'sudah'),
(148, 'materiBaru', 3, 3, 'semua', '2019-01-08 22:21:18', NULL, NULL),
(149, 'pesaninfo', 21, 1, '3', '2019-02-12 14:15:47', NULL, NULL),
(150, 'dm', 22, 3, '2', '2019-02-12 14:31:10', NULL, 'sudah'),
(151, 'dm', 23, 3, '2', '2019-02-12 14:31:17', NULL, 'sudah'),
(152, 'testimonial', 1, 3, 'admin', '2019-02-12 14:34:06', NULL, NULL),
(153, 'dm', 24, 2, '3', '2019-02-12 15:44:26', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=latin1;

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
(49, '2', 1, '1', '0'),
(50, '7', 27, '1', '0'),
(51, '7', 26, '1', '0'),
(55, '17', 28, '1', '0'),
(56, '17', 19, '1', '0'),
(57, '44', 27, '1', '0'),
(58, '44', 26, '1', '0'),
(59, '44', 19, '1', '0'),
(60, '44', 7, '1', '0'),
(61, '44', 5, '1', '0'),
(62, '44', 4, '1', '0'),
(63, '44', 3, '1', '0'),
(64, '44', 2, '1', '0'),
(65, '44', 1, '1', '0'),
(66, '24', 27, '1', '0'),
(67, '24', 26, '1', '0'),
(68, '24', 19, '1', '0'),
(69, '24', 7, '1', '0'),
(70, '24', 5, '1', '0'),
(71, '24', 4, '1', '0'),
(72, '24', 3, '1', '0'),
(73, '24', 2, '1', '0'),
(74, '24', 1, '1', '0'),
(75, '17', 36, '1', '0'),
(79, '28', 27, '1', '0'),
(80, '28', 26, '1', '0'),
(81, '28', 19, '1', '0'),
(82, '28', 7, '1', '0'),
(83, '28', 5, '1', '0'),
(84, '28', 4, '1', '0'),
(85, '28', 3, '1', '0'),
(86, '28', 2, '1', '0'),
(87, '28', 1, '1', '0'),
(88, '52', 27, '1', '0'),
(89, '52', 26, '1', '0'),
(90, '52', 19, '1', '0'),
(91, '52', 7, '1', '0'),
(92, '52', 5, '1', '0'),
(93, '52', 4, '1', '0'),
(94, '52', 3, '1', '0'),
(95, '52', 2, '1', '0'),
(96, '52', 1, '1', '0'),
(97, '17', 46, '1', '0'),
(98, '17', 45, '1', '0'),
(99, '18', 44, '1', '0'),
(100, '18', 35, '1', '0'),
(101, '18', 25, '1', '0'),
(102, '18', 19, '1', '0'),
(103, '26', 27, '1', '0'),
(104, '26', 26, '1', '0'),
(105, '26', 19, '1', '0'),
(106, '26', 7, '1', '0'),
(107, '26', 5, '1', '0'),
(108, '26', 4, '1', '0'),
(109, '26', 3, '1', '0'),
(110, '26', 2, '1', '0'),
(111, '26', 1, '1', '0'),
(112, '42', 27, '1', '0'),
(113, '42', 26, '1', '0'),
(114, '42', 19, '1', '0'),
(115, '42', 7, '1', '0'),
(116, '42', 5, '1', '0'),
(117, '42', 4, '1', '0'),
(118, '42', 3, '1', '0'),
(119, '42', 2, '1', '0'),
(120, '42', 1, '1', '0'),
(121, '62', 27, '1', '0'),
(122, '62', 26, '1', '0'),
(123, '62', 19, '1', '0'),
(124, '62', 7, '1', '0'),
(125, '62', 5, '1', '0'),
(126, '62', 4, '1', '0'),
(127, '62', 3, '1', '0'),
(128, '62', 2, '1', '0'),
(129, '62', 1, '1', '0'),
(130, '31', 27, '1', '0'),
(131, '31', 26, '1', '0'),
(132, '31', 19, '1', '0'),
(133, '31', 7, '1', '0'),
(134, '31', 5, '1', '0'),
(135, '31', 4, '1', '0'),
(136, '31', 3, '1', '0'),
(137, '31', 2, '1', '0'),
(138, '31', 1, '1', '0'),
(139, '45', 27, '1', '0'),
(140, '45', 26, '1', '0'),
(141, '45', 19, '1', '0'),
(142, '45', 7, '1', '0'),
(143, '45', 5, '1', '0'),
(144, '45', 4, '1', '0'),
(145, '45', 3, '1', '0'),
(146, '45', 2, '1', '0'),
(147, '45', 1, '1', '0'),
(148, '34', 27, '1', '0'),
(149, '34', 26, '1', '0'),
(150, '34', 19, '1', '0'),
(151, '34', 7, '1', '0'),
(152, '34', 5, '1', '0'),
(153, '34', 4, '1', '0'),
(154, '34', 3, '1', '0'),
(155, '34', 2, '1', '0'),
(156, '34', 1, '1', '0'),
(157, '46', 27, '1', '0'),
(158, '46', 26, '1', '0'),
(159, '46', 19, '1', '0'),
(160, '46', 7, '1', '0'),
(161, '46', 5, '1', '0'),
(162, '46', 4, '1', '0'),
(163, '46', 3, '1', '0'),
(164, '46', 2, '1', '0'),
(165, '46', 1, '1', '0'),
(166, '29', 27, '1', '0'),
(167, '29', 26, '1', '0'),
(168, '29', 19, '1', '0'),
(169, '29', 7, '1', '0'),
(170, '29', 5, '1', '0'),
(171, '29', 4, '1', '0'),
(172, '29', 3, '1', '0'),
(173, '29', 2, '1', '0'),
(174, '29', 1, '1', '0'),
(175, '2', 27, '1', '0'),
(176, '2', 26, '1', '0'),
(177, '52', 50, '1', '0'),
(178, '52', 47, '1', '0'),
(184, '32', 27, '1', '0'),
(185, '32', 26, '1', '0'),
(186, '32', 19, '1', '0'),
(187, '32', 7, '1', '0'),
(188, '32', 5, '1', '0'),
(189, '32', 4, '1', '0'),
(190, '32', 3, '1', '0'),
(191, '32', 2, '1', '0'),
(192, '32', 1, '1', '0'),
(193, '17', 71, '1', '0'),
(194, '17', 70, '1', '0'),
(195, '17', 67, '1', '0'),
(196, '17', 66, '1', '0'),
(197, '17', 64, '1', '0'),
(198, '17', 59, '1', '0'),
(199, '17', 56, '1', '0'),
(200, '17', 54, '1', '0'),
(201, '17', 53, '1', '0'),
(202, '17', 52, '1', '0'),
(203, '27', 27, '1', '0'),
(204, '27', 26, '1', '0'),
(205, '27', 19, '1', '0'),
(206, '27', 7, '1', '0'),
(207, '27', 5, '1', '0'),
(208, '27', 4, '1', '0'),
(209, '27', 3, '1', '0'),
(210, '27', 2, '1', '0'),
(211, '27', 1, '1', '0'),
(212, '40', 27, '1', '0'),
(213, '40', 26, '1', '0'),
(214, '40', 19, '1', '0'),
(215, '40', 7, '1', '0'),
(216, '40', 5, '1', '0'),
(217, '40', 4, '1', '0'),
(218, '40', 3, '1', '0'),
(219, '40', 2, '1', '0'),
(220, '40', 1, '1', '0'),
(221, '26', 77, '1', '0'),
(222, '26', 76, '1', '0'),
(223, '66', 27, '1', '0'),
(224, '66', 26, '1', '0'),
(225, '66', 19, '1', '0'),
(226, '66', 7, '1', '0'),
(227, '66', 5, '1', '0'),
(228, '66', 4, '1', '0'),
(229, '66', 3, '1', '0'),
(230, '66', 2, '1', '0'),
(231, '66', 1, '1', '0'),
(232, '24', 89, '1', '0'),
(233, '24', 88, '1', '0'),
(234, '24', 87, '1', '0'),
(235, '48', 27, '1', '0'),
(236, '48', 26, '1', '0'),
(237, '48', 19, '1', '0'),
(238, '48', 7, '1', '0'),
(239, '48', 5, '1', '0'),
(240, '48', 4, '1', '0'),
(241, '48', 3, '1', '0'),
(242, '48', 2, '1', '0'),
(243, '48', 1, '1', '0'),
(244, '50', 27, '1', '0'),
(245, '50', 26, '1', '0'),
(246, '50', 19, '1', '0'),
(247, '50', 7, '1', '0'),
(248, '50', 5, '1', '0'),
(249, '50', 4, '1', '0'),
(250, '50', 3, '1', '0'),
(251, '50', 2, '1', '0'),
(252, '50', 1, '1', '0'),
(253, '65', 27, '1', '0'),
(254, '65', 26, '1', '0'),
(255, '65', 19, '1', '0'),
(256, '65', 7, '1', '0'),
(257, '65', 5, '1', '0'),
(258, '65', 4, '1', '0'),
(259, '65', 3, '1', '0'),
(260, '65', 2, '1', '0'),
(261, '65', 1, '1', '0'),
(262, '17', 105, '1', '0'),
(263, '17', 104, '1', '0'),
(264, '17', 98, '1', '0'),
(265, '17', 97, '1', '0'),
(266, '17', 95, '1', '0'),
(267, '17', 91, '1', '0'),
(268, '18', 103, '1', '0'),
(269, '18', 102, '1', '0'),
(270, '18', 101, '1', '0'),
(271, '18', 100, '1', '0'),
(272, '18', 99, '1', '0'),
(273, '18', 96, '1', '0'),
(274, '18', 92, '1', '0'),
(275, '18', 90, '1', '0'),
(276, '18', 69, '1', '0'),
(277, '18', 68, '1', '0'),
(278, '18', 65, '1', '0'),
(279, '18', 63, '1', '0'),
(280, '18', 62, '1', '0'),
(281, '18', 61, '1', '0'),
(282, '18', 60, '1', '0'),
(283, '18', 58, '1', '0'),
(284, '18', 55, '1', '0'),
(287, '17', 138, '1', '0'),
(288, '17', 137, '1', '0'),
(289, '2', 138, '1', '0'),
(290, '3', 138, '1', '0'),
(291, '2', 140, '1', '0'),
(292, '2', 139, '1', '0'),
(293, '1', 140, '1', '0'),
(294, '20', 140, '1', '0'),
(295, '20', 138, '1', '0'),
(296, '3', 142, '1', '0'),
(297, '2', 144, '1', '0'),
(298, '2', 145, '1', '0'),
(299, '2', 143, '1', '0'),
(300, '3', 146, '1', '0'),
(301, '1', 148, '1', '0'),
(302, '2', 148, '1', '0'),
(303, '20', 148, '1', '0'),
(306, '2', 150, '1', '0'),
(307, '2', 151, '1', '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
`id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `alias`, `email`, `no_hp`, `institusi_or_universitas`, `nip_or_nim`, `report`, `status`, `aktor`, `foto`, `password`, `poin`, `cookie`, `jumlah_dm`, `jumlah_dm_solved`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', '089680752154', NULL, NULL, 0, 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, 'uQV9j4wWPbJi6NcmWfPoFTvXUTerafcKswNRFO5CdK2h0DYq8zRhebvZp3EX7mlk', 0, 0),
(2, 'Maha Siswa', 'Maha Siswa', 'mahasiswa@mahasiswa.com', '+6289987009', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'userprofiles/Maha_Siswa_-_profil2.jpg', '202cb962ac59075b964b07152d234b70', 4, NULL, 0, 0),
(3, 'Muhammad Ridho', 'Muhammad Ridho', 'guru@guru.com', '089680752154', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Muhammad_Ridho_-_profil1.jpg', '202cb962ac59075b964b07152d234b70', 0, '2U4D6NlYSA5XPPmQVYFpMBaS7ekxxg30eLrcUq94hnmvLcv7wrsu8NidWn9wFHBf', 0, 0),
(4, 'Anton Bayangkara', 'Anton Bayangkara', 'anton@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 2, NULL, 0, 0),
(5, 'Bagus Sandika', 'Bagus Sandika', 'bagus@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(6, 'Cintya Restu', 'Cintya Restu', 'cintya@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 3, NULL, 0, 0),
(7, 'Dea Amanda', 'Dea Amanda', 'dea@student.com', '', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'userprofiles/Dea_Amanda_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 5, NULL, 0, 0),
(8, 'Emilia Rina', 'Emilia Rina', 'emil@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(9, 'Farah Nabila', 'Farah Nabila', 'farah@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(10, 'Gina Sabrina', 'Gina Sabrina', 'gina@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(11, 'Hamid Dian', 'Hamid Dian', 'hamid@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(12, 'Irfan Joni', 'Irfan Joni', 'irfan@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(13, 'Jaka Umbara', 'Jaka Umbara', 'jaka@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(14, 'Mulyadi Fadil', 'Mulyadi Fadil', 'mulyadi@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Mulyadi_Fadil_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(15, 'Hasan Wirayudha', 'Hasan Wirayudha', 'hasan@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Hasan_Wirayudha_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(16, 'Evania Yafie', 'Evania Yafie', 'evania@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Evania_Yafie_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(17, 'Ni Luh Sakinah', 'Ni Luh Sakinah', 'niluh@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Ni_Luh_Sakinah_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(18, 'Herlina Ike', 'Herlina Ike', 'herlina@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Herlina_Ike_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(19, 'Ence Surahman', 'Ence Surahman', 'ence@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Ence_Surahman_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(20, 'Yerry Soepriyanto', 'Yerry Soepriyanto', 'yerry@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Yerry_Soepriyanto_-_profil.jpeg', 'e10adc3949ba59abbe56e057f20f883e', 0, 'FO3aBKlomea82Zt9cKALxUisTjr612CYGVJggWHq7hDIsCXc7p4dLAzbkQTubdij', 0, 0),
(21, 'Henry Praherdhiono', 'Henry Praherdhiono', 'henry@teacher.com', '', NULL, NULL, 0, 'ACTIVE', 'pendidik', 'userprofiles/Henry_Praherdhiono_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', 0, NULL, 0, 0),
(22, 'Miftakhul Sholikhah', 'Miftakhul Sholikhah', 'miftakhulsholikhah@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'c68737b0ef27a9a79d936caa9b0ec1fe', 0, 'NTYIwLaQxvJchDukEBaT0LFn2Qg7ecgbXOdCSp2UKR9hdtu9M4rklwy7G6rzWsFz', 0, 0),
(23, 'Ginanjar Septiana Supardiansyah', 'Ginanjar Septiana S', 'ginanjarsetiana4@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '0fae158952bdf312208d5b2d1d94d657', 0, 'uhqQNSNjcb2J98kU6ZDSfVXmZGdv644odTAWIgCCwxMzLnc3g5OvQTEk8FyxKXzf', 0, 0),
(24, 'Ika Kharismadewi', 'Ika Kharismadewi', 'rismaika016@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'd4da8d9e6e5c4b1c9db7b01bb7c6c5b3', 4, NULL, 0, 0),
(25, 'Irfan Agung Purnomo', 'Irfan Agung Purnomo', 'agungirfan630@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'ccbc7fda6d3cf74cf2a0c6be76ef05bf', 0, NULL, 0, 0),
(26, 'Mila Noni Alfiolita', 'Mila Noni Alfiolita', 'milanoni99@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'aef2afc5eceadab86921beb9b02b1904', 5, NULL, 0, 0),
(27, 'Lisa Helendriani', 'Lisa Helendriani', 'lisahelend19@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '822ad60fd167aff9c07af373cbe0ef72', 6, 'QEcyWft8s2GDw6bXnJLaFe3T7Y9VzfRkI4UizMpOLjRaUvO6KV8Cdm5mhKlx1oAo', 0, 0),
(28, 'Ermian Hotnauli Silalahi', 'Ermian Hotnauli S', 'ermianhotnauli@yahoo.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86f9933c52433750c83590a234555e67', 0, NULL, 0, 0),
(29, 'Nafika Fikria Arifianda', 'Nafika Fikria A', 'nafikafikriaarifianda@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8941a8eff97ee4405e9e2781e32ffbf5', 3, 'uhxcyUdzZmarJjsfpH087MLYOtztAEBQiMa4HpVlq4EqCIv50vC1wuSkYw8Z3l3r', 0, 0),
(30, 'Nur Roudlotul Jannah', 'Nur Roudlotul J', 'nurroudloh.nrj@gmail.com', '085851597531', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'becb73795b3cdf701973a5f4c46a7c0a', 2, NULL, 0, 0),
(31, 'Made Ema Parurahwani', 'Made Ema P', 'emamade4@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '4d7ef38325543457eb2cb9cefce36214', 5, NULL, 0, 0),
(32, 'Lailatul Mufida', 'Lailatul Mufida', 'ellamufida.00@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'ac03ebfafd59b65f494bf5d9cda778ad', 0, 'Ntpd1XMzP92YuXA4FrDWcqT4kEnyhLcSzISNJebyFZbio8QqW5ajpox7JOBlemi2', 0, 0),
(33, 'Deah Arta Muviana', 'Deah Arta Muviana', 'damuviana@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'cfb5a8202eb4e890a9195c9a7e08c7c1', 0, NULL, 0, 0),
(34, 'Maziyatus Sariroh Yusro', 'Maziyatus Sariroh Y', 'sariroh74@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '3e06f2af88392a8943c423d7d36d307a', 4, 'wrj3LfiE79QGW0NjfIpRLuCeihBJXlp7YAtMzMZ6EK6N29H4q5vs3cngUamh2Wvb', 0, 0),
(35, 'Maulidiyah Wiahnanda', 'Maulidiyah W', 'diyahnanda6@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '77c84df87bcf58cc132ce5119f4623a8', 0, '5RhbmLiN8dCzkGn7pBoD4mkEvMjLKuoYsz0Oyl3XTVerthMFXN37b9x2gZBqeQPI', 0, 0),
(36, 'Meridza Nur Audina', 'Meridza Nur Audina', 'audinameridza@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '9c38e42876b09f089ea4a4b5dc7b84ae', 0, NULL, 0, 0),
(37, 'Kurniawan Prasetyo', 'Kurniawan Prasetyo', 'kurniawan1161@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '2803f0d8de6c6b2d80121f23489e3553', 0, NULL, 0, 0),
(38, 'Maqfirotul Laily', 'Maqfirotul Laily', 'maqfirotullaily23@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'a24229a75305bf7052d5b2f1a2a428b8', 0, NULL, 0, 0),
(39, 'Kurniawan Prasetyo 1161', 'Kurniawan Prasetyo 1', 'kurniawan1161@yahoo.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '3ee2a3262b635039690c7ffa88db860f', 0, NULL, 0, 0),
(40, 'Eka Zunita Nurfadilah', 'Eka Zunita N', 'ekazunitanurfadila@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6a1b3f1a6f1facf5e9c940b34c76b092', 5, 'ZeffyJnqwbYEv3TNcl1VUkCQ2nPwilkx8Sy06K3O87OCHFqFVdAdhs4YutguxRUa', 0, 0),
(41, 'Isvina Uma Izah', 'Isvina Uma Izah', 'isvinaumaizah1@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'b4e1cb52739e7a0340881d40b1cd95fe', 0, NULL, 0, 0),
(42, 'Agam Firdaus Junaidi', 'Agam Firdaus J', 'agamjunaidi010@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'd7bf52d2a0b546a735cc9f15730bfc82', 6, NULL, 0, 0),
(43, 'Istiqomah Ahsanu Amala', 'Istiqomah Ahsanu A', 'istiamala28@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86d9bcae56114714da37d1a7938e8d59', 5, 'jJKw71gAuW9BRnlOX5E0rhTtJdgOacRs2NbW1q8doPhubzFqrI2MwE5NlTvU0Yya', 0, 0),
(44, 'Dea Putri Lailatul Qudus', 'Dea Putri Lailatul Q', 'deaputri0527@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '331dfed457ebeee3e3bceb98f54a7243', 5, '1fCJurTyWC0PVNStRbN6dB9HqscAKWd7zDPQqf48vLUcoX1yGQeZSOen3Oh5E3GD', 0, 0),
(45, 'Moh Hasan Safroni', 'Moh Hasan Safroni', 'hassansaffroni@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6dc08c1e5df2e0152d1fb6a3eaf6b726', 3, 'AiADspuESZFclopmNU0MdkKhZQ91BXqJVtn4TGHCkbFRIeUVxqt9La5PchWJLws0', 0, 0),
(46, 'Indah Larasati', 'Indah Larasati', '1999indah@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '347101d0ff2538bc3f71a4c17831bdbc', 5, 'FISP3zDdlpYMAGo80LHrq9Lz2hGRuOAltiEMPJSmUbX6UC5nXWxBK7fodYN1bQWc', 0, 0),
(47, 'Moch. Romadhoni', 'Moch. Romadhoni', 'mochromadhoni20@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '261a794363c16c2a9969c2ee093673d6', 0, NULL, 0, 0),
(48, 'Milasari Saharuddin', 'Milasari Saharuddin', 'Milathahir@yahoo.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '5fc81072e9e3ea0558f417741d5da990', 2, NULL, 0, 0),
(49, 'Leonarda Indra Suryati', 'Leonarda Indra S', 'nardasuryati@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '1762c9584d2822920b91ea8d0a83d1ec', 3, NULL, 0, 0),
(50, 'Mareta Bunga Pratiwi', 'Mareta Bunga P', 'maretabungapratiwi@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '65f5613ed4048b905a51997d67cd0d80', 7, '3nbDjBtmcqGdal0Bw9Fpiz8aGgsWYwJyhNxvukEoLIC7MfjUeQQ7WLR5KR0Kr8A3', 0, 0),
(51, 'Ahmad Dian Tri Raharjo', 'Ahmad Dian Tri R', 'ahmaddiantriraharjo@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '41fe7581cfcb26bcbe22700512c6fcd0', 0, NULL, 0, 0),
(52, 'Faricha Alif Vaniza', 'Faricha Alif Vaniza', 'aliffaricha@gmail.com', '', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'userprofiles/Faricha_Alif_Vaniza_-_profil1.jpg', 'de27825fca35ba8492b08765cda6cf98', 8, 'HMfn47bJhGOEaNIv31BUkqmSCwRCLlkOt3iyWcbY8zu9itsnXl6aR1jS4Ys2gAFq', 0, 0),
(53, 'Ibnu', 'Ibnu', 'ibnuspeedster@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(54, 'Johnson Martin', 'Johnson Martin', 'johnson@teacher.com', NULL, NULL, NULL, 0, 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'a426dcf72ba25d046591f81a5495eab7', 0, NULL, 0, 0),
(55, 'Ilham Kurniawan', 'Ilham Kurniawan', 'ahmad@student.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8de13959395270bf9d6819f818ab1a00', 1, NULL, 0, 0),
(56, 'Si Kabayan', 'Si Kabayan', 'kabayan@students.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', 0, NULL, 0, 0),
(57, 'Bima Wahyu Syahputra', 'Bima Wahyu S', 'bimakhun98@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8e7e48ef20e3b93440ac3529e37f282a', 4, NULL, 0, 0),
(58, 'Hizzam Alief Aditya', 'Hizzam Alief Aditya', 'hisamadit@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'c39ebcc31aa2316b4fb869e40f90248e', 0, NULL, 0, 0),
(59, 'Krisma Sari', 'Krisma Sari', 'krismasari.1999@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'de5957036e471ac139b11527f4468d5f', 0, NULL, 0, 0),
(60, 'Kurniawan9628', 'Kurniawan9628', 'kurniawan9628@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '83b39376740639dcd68bd19dd9381722', 0, NULL, 0, 0),
(61, 'Kurniawan1161', 'Kurniawan1161', 'kurniawan9628@yahoo.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '83b39376740639dcd68bd19dd9381722', 0, NULL, 0, 0),
(62, 'Isvina Uma Izah', 'Isvina Uma Izah', 'isvinaumaizahh1@gmail.com', '', NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'b4e1cb52739e7a0340881d40b1cd95fe', 8, NULL, 0, 0),
(63, 'Ermian Hotnauli', 'Ermian Hotnauli', 'ermianhotnauli@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86f9933c52433750c83590a234555e67', 0, NULL, 0, 0),
(64, '1Ginanjar Septiana Supardiansyah', '1Ginanjar Septiana S', 'ginanjarseptiana4@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '0fae158952bdf312208d5b2d1d94d657', 0, NULL, 0, 0),
(65, 'Bayu Aji', 'Bayu Aji', 'bayuuaji24@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'c360eabd5dab25c89050d0a44b3514a0', 3, NULL, 0, 0),
(66, 'Intan  Dewanti', 'Intan  Dewanti', 'intandewanti0211@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '089d35901cb27c86abb922a6e8a14079', 7, NULL, 0, 0),
(67, 'Maulidiyah Wn', 'Maulidiyah Wn', 'diyahnanda07@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '77c84df87bcf58cc132ce5119f4623a8', 0, NULL, 0, 0),
(68, 'Ekazunitaa.n', 'Ekazunitaa.n', 'ekazunita.n@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6a1b3f1a6f1facf5e9c940b34c76b092', 0, NULL, 0, 0),
(69, 'INTAN DEWANTI', 'INTAN DEWANTI', 'intandewanti0211@gmail.cm', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '089d35901cb27c86abb922a6e8a14079', 0, NULL, 0, 0),
(70, 'INTAN DEWANTI22', 'INTAN DEWANTI22', 'dewantiintan0211@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '089d35901cb27c86abb922a6e8a14079', 0, NULL, 0, 0),
(71, 'Hisam Alief Aditya', 'Hisam Alief Aditya', 'danteinferno944@yahoo.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'f067936105e945d36b6a11615a6a9b20', 0, NULL, 0, 0),
(72, 'MARETA BUNGA P', 'MARETA BUNGA P', 'maretabungap@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '65f5613ed4048b905a51997d67cd0d80', 0, NULL, 0, 0),
(73, 'Maretabunga_p', 'Maretabunga_p', 'maretabungaa@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '65f5613ed4048b905a51997d67cd0d80', 0, NULL, 0, 0),
(74, 'LUCIA MEGA YULIANA', 'LUCIA MEGA YULIANA', 'luciamega84@gmail.com', NULL, NULL, NULL, 0, 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '2db66c39052af722cdc6d12c3be87985', 0, NULL, 0, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `permasalahan`
--

INSERT INTO `permasalahan` (`id`, `teks`, `tanggal`, `siapa`, `jumlah_dilihat`, `jumlah_dibaca`, `jumlah_komen`, `kategori`, `status`, `beku`) VALUES
(8, 'Apa yang bisa dilakukan guru agar siswanya di SD tertarik dengan mata pelajaran matematika?', '2018-12-05 20:04:19', 17, 21, 0, 20, 1, 'UNSOLVED', 'ACTIVE'),
(9, 'Apa yang guru bisa lakukan untuk membuat siswanya di SMP senang membaca buku terkait materi pelajaran IPA?', '2018-12-05 20:07:26', 18, 23, 0, 19, 7, 'UNSOLVED', 'ACTIVE'),
(10, 'Adakah metode yang bisa digunakan untuk membuat presentasi yang baik di mata pelajaran bahasa inggris?', '2018-12-19 14:27:55', 3, 1, 0, 1, 5, 'UNSOLVED', 'ACTIVE');

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
-- Struktur dari tabel `pertanyaan_saran`
--

CREATE TABLE IF NOT EXISTS `pertanyaan_saran` (
`id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subjek` varchar(255) DEFAULT NULL,
  `pesan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

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
(9, '56', 4, '2018-11-22 19:56:06'),
(10, '7', 2, '2018-11-26 13:28:28'),
(11, '7', 9, '2018-12-06 03:37:22'),
(12, '49', 8, '2018-12-06 13:59:54'),
(13, '44', 9, '2018-12-06 19:33:39'),
(14, '44', 8, '2018-12-06 19:37:29'),
(15, '24', 9, '2018-12-06 21:52:21'),
(16, '52', 9, '2018-12-07 21:23:02'),
(17, '52', 8, '2018-12-07 21:30:11'),
(18, '30', 8, '2018-12-08 04:51:00'),
(19, '43', 8, '2018-12-08 13:35:40'),
(20, '26', 8, '2018-12-08 13:45:33'),
(21, '26', 9, '2018-12-08 13:54:59'),
(22, '43', 9, '2018-12-08 13:55:23'),
(23, '42', 8, '2018-12-08 14:21:06'),
(24, '42', 9, '2018-12-08 14:24:06'),
(25, '62', 8, '2018-12-08 14:42:40'),
(26, '62', 9, '2018-12-08 15:02:27'),
(27, '31', 8, '2018-12-08 16:23:49'),
(28, '31', 9, '2018-12-08 16:33:30'),
(29, '59', 9, '2018-12-08 16:43:26'),
(30, '45', 9, '2018-12-08 18:34:01'),
(31, '34', 9, '2018-12-09 09:00:00'),
(32, '34', 8, '2018-12-09 09:12:38'),
(33, '57', 9, '2018-12-09 11:36:23'),
(34, '57', 8, '2018-12-09 11:44:46'),
(35, '46', 8, '2018-12-09 15:54:37'),
(36, '46', 9, '2018-12-09 16:08:18'),
(37, '29', 8, '2018-12-09 16:50:57'),
(38, '29', 9, '2018-12-09 17:01:50'),
(39, '24', 8, '2018-12-09 17:06:50'),
(40, '2', 8, '2018-12-09 22:04:27'),
(41, '32', 9, '2018-12-10 08:41:02'),
(42, '27', 9, '2018-12-10 15:40:59'),
(43, '27', 8, '2018-12-10 16:49:50'),
(44, '40', 8, '2018-12-10 21:52:31'),
(45, '40', 9, '2018-12-10 21:57:44'),
(46, '66', 8, '2018-12-11 10:20:40'),
(47, '50', 8, '2018-12-11 10:46:03'),
(48, '66', 9, '2018-12-11 10:55:30'),
(49, '48', 9, '2018-12-11 10:58:26'),
(50, '48', 8, '2018-12-11 11:02:09'),
(51, '50', 9, '2018-12-11 11:07:38'),
(52, '65', 9, '2018-12-12 21:02:43'),
(53, '65', 8, '2018-12-12 21:04:03'),
(54, '2', 9, '2018-12-19 13:58:05'),
(55, '2', 10, '2019-01-08 21:43:43');

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
-- Struktur dari tabel `subscriber`
--

CREATE TABLE IF NOT EXISTS `subscriber` (
`id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `subscriber`
--

INSERT INTO `subscriber` (`id`, `email`) VALUES
(45, '1999indah@gmail.com'),
(41, 'agamjunaidi010@gmail.com'),
(24, 'agungirfan630@gmail.com'),
(54, 'ahmad@student.com'),
(50, 'ahmaddiantriraharjo@gmail.com'),
(51, 'aliffaricha@gmail.com'),
(3, 'anton@student.com'),
(35, 'audinameridza@gmail.com'),
(4, 'bagus@student.com'),
(64, 'bayuuaji24@gmail.com'),
(56, 'bimakhun98@gmail.com'),
(5, 'cintya@student.com'),
(32, 'damuviana@gmail.com'),
(70, 'danteinferno944@yahoo.com'),
(6, 'dea@student.com'),
(43, 'deaputri0527@gmail.com'),
(69, 'dewantiintan0211@gmail.com'),
(66, 'diyahnanda07@gmail.com'),
(34, 'diyahnanda6@gmail.com'),
(67, 'ekazunita.n@gmail.com'),
(39, 'ekazunitanurfadila@gmail.com'),
(31, 'ellamufida.00@gmail.com'),
(30, 'emamade4@gmail.com'),
(7, 'emil@student.com'),
(18, 'ence@teacher.com'),
(62, 'ermianhotnauli@gmail.com'),
(27, 'ermianhotnauli@yahoo.com'),
(15, 'evania@teacher.com'),
(8, 'farah@student.com'),
(9, 'gina@student.com'),
(63, 'ginanjarseptiana4@gmail.com'),
(22, 'ginanjarsetiana4@gmail.com'),
(2, 'guru@guru.com'),
(10, 'hamid@student.com'),
(14, 'hasan@teacher.com'),
(44, 'hassansaffroni@gmail.com'),
(20, 'henry@teacher.com'),
(17, 'herlina@teacher.com'),
(57, 'hisamadit@gmail.com'),
(52, 'ibnuspeedster@gmail.com'),
(68, 'intandewanti0211@gmail.cm'),
(65, 'intandewanti0211@gmail.com'),
(11, 'irfan@student.com'),
(42, 'istiamala28@gmail.com'),
(40, 'isvinaumaizah1@gmail.com'),
(61, 'isvinaumaizahh1@gmail.com'),
(12, 'jaka@student.com'),
(53, 'johnson@teacher.com'),
(55, 'kabayan@students.com'),
(58, 'krismasari.1999@gmail.com'),
(36, 'kurniawan1161@gmail.com'),
(38, 'kurniawan1161@yahoo.com'),
(59, 'kurniawan9628@gmail.com'),
(60, 'kurniawan9628@yahoo.com'),
(26, 'lisahelend19@gmail.com'),
(73, 'luciamega84@gmail.com'),
(1, 'mahasiswa@mahasiswa.com'),
(37, 'maqfirotullaily23@gmail.com'),
(72, 'maretabungaa@gmail.com'),
(71, 'maretabungap@gmail.com'),
(49, 'maretabungapratiwi@gmail.com'),
(21, 'miftakhulsholikhah@gmail.com'),
(25, 'milanoni99@gmail.com'),
(47, 'Milathahir@yahoo.com'),
(46, 'mochromadhoni20@gmail.com'),
(13, 'mulyadi@teacher.com'),
(28, 'nafikafikriaarifianda@gmail.com'),
(48, 'nardasuryati@gmail.com'),
(16, 'niluh@teacher.com'),
(74, 'niluhi@teacher.com'),
(29, 'nurroudloh.nrj@gmail.com'),
(23, 'rismaika016@gmail.com'),
(33, 'sariroh74@gmail.com'),
(19, 'yerry@teacher.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` int(11) NOT NULL,
  `id_materi` int(11) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `id_materi`, `tag`) VALUES
(1, 1, 'matematika'),
(2, 1, 'sma'),
(3, 1, 'gratis'),
(4, 2, '#bahasainggris #wordpress'),
(5, 3, '#matematika #angka');

-- --------------------------------------------------------

--
-- Struktur dari tabel `testimonial`
--

CREATE TABLE IF NOT EXISTS `testimonial` (
`id` int(11) NOT NULL,
  `teks` varchar(255) DEFAULT NULL,
  `dari` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `testimonial`
--

INSERT INTO `testimonial` (`id`, `teks`, `dari`, `tanggal`) VALUES
(1, 'berguru.com sangat membantu saya menyelesaikan masalah di pembelajaran. mantap!!!', 3, '2019-02-12');

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
-- Indexes for table `log_pengunjung`
--
ALTER TABLE `log_pengunjung`
 ADD PRIMARY KEY (`id`), ADD KEY `pengguna yang datang` (`pengunjung`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
 ADD PRIMARY KEY (`id`);

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
-- Indexes for table `pertanyaan_saran`
--
ALTER TABLE `pertanyaan_saran`
 ADD PRIMARY KEY (`id`);

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
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email unik subscriber` (`email`) USING BTREE;

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`), ADD KEY `id_materi` (`id_materi`);

--
-- Indexes for table `testimonial`
--
ALTER TABLE `testimonial`
 ADD PRIMARY KEY (`id`), ADD KEY `testimoni pengguna` (`dari`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachment`
--
ALTER TABLE `attachment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `direct_message`
--
ALTER TABLE `direct_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `komentar_message`
--
ALTER TABLE `komentar_message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `log_pengunjung`
--
ALTER TABLE `log_pengunjung`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lowongan`
--
ALTER TABLE `lowongan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `materi`
--
ALTER TABLE `materi`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `max_notif_id_per_user`
--
ALTER TABLE `max_notif_id_per_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notif`
--
ALTER TABLE `notif`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=154;
--
-- AUTO_INCREMENT for table `notif_flag`
--
ALTER TABLE `notif_flag`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=308;
--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `permasalahan`
--
ALTER TABLE `permasalahan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `pertanyaan_saran`
--
ALTER TABLE `pertanyaan_saran`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pesan_info`
--
ALTER TABLE `pesan_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `riwayat_permasalahan_dilihat`
--
ALTER TABLE `riwayat_permasalahan_dilihat`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=75;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `testimonial`
--
ALTER TABLE `testimonial`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
-- Ketidakleluasaan untuk tabel `log_pengunjung`
--
ALTER TABLE `log_pengunjung`
ADD CONSTRAINT `pengguna yang datang` FOREIGN KEY (`pengunjung`) REFERENCES `pengguna` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Ketidakleluasaan untuk tabel `testimonial`
--
ALTER TABLE `testimonial`
ADD CONSTRAINT `testimoni pengguna` FOREIGN KEY (`dari`) REFERENCES `pengguna` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
