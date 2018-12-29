/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : berguru

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-12-29 00:41:27
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
INSERT INTO `attachment` VALUES ('1', '1', 'materi/Matematika/20181120_095836.zip');
INSERT INTO `attachment` VALUES ('2', '2', 'materi/Bahasa Inggris/20181219_143728.zip');

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
  `solver` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of direct_message
-- ----------------------------
INSERT INTO `direct_message` VALUES ('1', 'Saya mebutuhkan media 3D untuk pelajaran anatomi tubuh manusia dalam bentuk digital! ', '20', '7', '7', '3', '2018-11-16 19:13:35', null, null, null, 'permasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('2', 'Saya bisa membuat media 3D dengan aplikasi 4D dengan kombinasi kontral cerdas dari aplikasi Unity dan Google VR', '7', '20', '7', '3', '2018-11-16 19:13:35', null, null, null, 'komentarpermasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('3', 'software apa yang anda gunakan? dan bagaimana spesifikasi dari komputer pendukungnya?', '20', '7', '7', '3', '2018-11-16 19:14:27', null, null, null, 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('4', 'kombinasi aplikasi dengan spek yang minimalis seperti pentium 4 dan RAm 2 Gb', '7', '20', null, null, '2018-11-16 19:16:49', null, null, null, 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('5', 'Apa yang bisa dilakukan guru agar siswanya di SD tertarik dengan mata pelajaran matematika?', '17', '55', '8', '4', '2018-12-06 15:00:06', null, null, null, 'permasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('6', 'Saran saya bisa mencoba dengan media yang menarik perhatian siswa jadi tidak hanya menggunakan buku saja, terima kasih ', '55', '17', '8', '4', '2018-12-06 15:00:06', null, null, null, 'komentarpermasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('7', 'bisa diberikan contohnya?', '17', '55', '8', '4', '2018-12-06 15:00:33', null, null, null, 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('10', 'Apa yang bisa dilakukan guru agar siswanya di SD tertarik dengan mata pelajaran matematika?', '17', '52', '8', '10', '2018-12-17 10:38:32', 'UNSOLVED', null, null, 'permasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('11', 'Masalah yang timbul biasanya dari persepsi siswa bahwa \"matematika itu sulit\", disitulah siswa malas untuk mempelajari matematika. Saran saya, guru menggunakan media belajar yg cocok dengan model belajar siswa, terutama untuk jenjang SD, mereka masih senang bermain. Mengubah persepsi dari matematika itu sulit menjadi math is fun. Jadi pembelajaran disertai dengan permainan agar siswa lebih tertarik. Misalnya dengan media belajar ular tangga yang pada nomor-nomor tertentu terdapat soal yang harus dikerjakan. Jika mengalami kesulitan bisa bertanya kepada kelompok belajar atau kepada guru. Lebih banyak menggunakan media belajar yang menyenangkan agar siswa SD tertarik. ', '52', '17', '8', '10', '2018-12-17 10:38:32', null, '4', null, 'komentarpermasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('12', 'menurut anda, media apa yang bisa anda buat untuk masalah ini?', '17', '52', '8', '10', '2018-12-17 10:39:01', null, null, null, 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('13', 'menurut anda, media apa yang bisa anda buat untuk masalah ini?', '17', '52', null, null, '2018-12-17 10:53:32', null, null, null, 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('14', 'oke, bisa ketemuan hari apa?', '20', '7', null, null, '2018-12-20 06:54:00', null, null, null, 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('15', 'kalau ketemuan di perpus um bagaimana?', '20', '7', null, null, '2018-12-20 06:54:24', null, null, null, 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('16', 'Apa yang guru bisa lakukan untuk membuat siswanya di SMP senang membaca buku terkait materi pelajaran IPA?', '18', '44', '9', '7', '2018-12-20 18:49:14', 'UNSOLVED', null, 'sudah', 'permasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('17', 'Menurut saya masalah tersebut timbul karena siswa SMP merasa bosan dengan buku mereka yg memiliki bahasa ilmiah cukup sulit dipahami . Saran saya sebaiknya bahasa di dalam buku diringkas lebih baik agar mudah dipahami dan buku diberi gambar gambar agar tidak terlihat monoton ', '44', '18', '9', '7', '2018-12-20 18:49:14', null, '2', 'sudah', 'komentarpermasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('18', 'hai dea, bisa ketemu setelah duhur di perpus um?', '18', '44', '9', '7', '2018-12-20 18:49:42', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('19', 'Apa yang guru bisa lakukan untuk membuat siswanya di SMP senang membaca buku terkait materi pelajaran IPA?', '18', '52', '9', '9', '2018-12-20 18:49:55', 'UNSOLVED', null, 'sudah', 'permasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('20', 'Menurut saya, masalah yang timbul mungkin karena pembelajaran yang monoton, dan tidak ada inovasi dari guru.\r\nSaran saya, guru lebih mengkaitkan dengan kehidupan sehari-hari, menyediakan media belajar yg sumber materinya dari buku, misalnya praktikum atau tugas yang panduannya dapat ditemukan dibuku, dan menggunakan buku yang bergambar, tidak monoton teks.', '52', '18', '9', '9', '2018-12-20 18:49:55', null, '4', 'sudah', 'komentarpermasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('21', 'hai faricha, ketemuan di perpus um ya?', '18', '52', '9', '9', '2018-12-20 18:51:17', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('22', 'ayoo', '52', '18', null, null, '2018-12-20 19:37:56', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('23', 'maumau', '52', '18', null, null, '2018-12-21 15:56:07', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('24', 'Apa yang guru bisa lakukan untuk membuat siswanya di SMP senang membaca buku terkait materi pelajaran IPA?', '18', '42', '9', '15', '2018-12-21 21:07:11', 'UNSOLVED', null, 'sudah', 'permasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('25', 'Menurut saya, siswa SMP kebanyakan bosan dengan mata pelajaran IPA dan pemahaman siswa tersebut masih kurang. Agar siswa SMP senang membaca buku terkait materi pelajaran IPA dengan menambah materi yang dapat dipelajari.', '42', '18', '9', '15', '2018-12-21 21:07:11', null, '3', 'sudah', 'komentarpermasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('26', 'halo agam, saya herlina, bisa ketemuan di pak japan?', '18', '42', '9', '15', '2018-12-21 21:07:40', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('27', 'halo bu herlina, ini saya mau berangkat haji. mohon maaf ya buu', '42', '18', null, null, '2018-12-21 21:21:22', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('28', 'hoala tiwas sudah pesankan sego jagung', '18', '42', null, null, '2018-12-21 21:30:01', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('29', 'maapin ya buu', '42', '18', null, null, '2018-12-22 05:22:36', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('30', 'bu, mungkin bisa saya sempatkan sebentar sekitar 2 jam an :)', '42', '18', null, null, '2018-12-22 09:55:01', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('31', 'Apa yang guru bisa lakukan untuk membuat siswanya di SMP senang membaca buku terkait materi pelajaran IPA?', '18', '62', '9', '17', '2018-12-22 10:04:28', 'UNSOLVED', null, 'sudah', 'permasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('32', 'Menurut saya siwa kurang senang dalam membaca materi pelajaran IPA karena didalam buku tersebut hanya membahas materi-materi saja yang dapan membuat siswa menjadi bosan dan tidak tertarik. Sehingga cara yang dilakukan untuk menarik minat baca siswa yaitu di dalam buku materi IPA  disertai dengan cerita atau studi kasus yang ada dalam kehidupan sehari-hari dan disertai dengan gambar-gambar yang berwarna yang dapat menarik perhatian siswa SMP. Selain itu juga yang dapat membuat siswa tidak tertarik karena tidak nyamannya tempat untuk membaca. Sehingga di dalam kelas bisa di setting dengan baik menyesuaikan dengan kemauan siswa serta diberikan slogan-slogan untuk memotivasi siwa dalam membaca.', '62', '18', '9', '17', '2018-12-22 10:04:28', null, '3', 'sudah', 'komentarpermasalahan', 'sudah', 'bukan');
INSERT INTO `direct_message` VALUES ('33', 'kalau saya minta nomer wa boleh?', '18', '62', '9', '17', '2018-12-22 10:04:47', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('38', 'Apa yang guru bisa lakukan untuk membuat siswanya di SD senang membaca buku terkait materi pelajaran MATEMATIKA?', '18', '42', '11', '45', '2018-12-22 11:01:16', 'UNSOLVED', null, 'sudah', 'permasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('39', 'abc', '42', '18', '11', '45', '2018-12-22 11:01:16', null, '5', 'sudah', 'komentarpermasalahan', 'sudah', null);
INSERT INTO `direct_message` VALUES ('40', 'hai agam', '18', '42', '11', '45', '2018-12-22 11:01:37', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('41', 'halo bu', '42', '18', null, null, '2018-12-22 11:03:24', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('42', 'sama alamat email ya', '18', '62', null, null, '2018-12-23 23:46:28', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('43', 'alamat rumah juga ya', '18', '62', null, null, '2018-12-23 23:46:56', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('44', 'dekat sama mog?', '18', '62', null, null, '2018-12-23 23:47:59', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('45', 'kalau dekat ayok ketemuan disana', '18', '62', null, null, '2018-12-23 23:48:21', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('46', 'halo bos', '42', '18', null, null, '2018-12-26 15:12:35', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('47', 'hai bu', '42', '18', null, null, '2018-12-26 17:27:57', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('48', 'juara bos', '42', '18', null, null, '2018-12-26 21:03:15', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('49', 'juara satu', '42', '18', null, null, '2018-12-28 15:45:07', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('50', 'apik', '42', '18', null, null, '2018-12-28 15:47:12', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('51', 'joss', '42', '18', null, null, '2018-12-28 15:52:50', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('52', 'pakdeee', '42', '18', null, null, '2018-12-28 16:36:10', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('53', 'kolagen', '62', '18', null, null, '2018-12-28 16:44:45', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('54', 'bosss', '42', '18', null, null, '2018-12-28 17:01:50', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('55', 'halo', '42', '18', null, null, '2018-12-28 20:21:03', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('56', 'halo', '42', '18', null, null, '2018-12-28 20:21:08', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('57', 'bos', '42', '18', null, null, '2018-12-28 20:39:54', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('58', 'siapppp', '42', '18', null, null, '2018-12-28 20:41:10', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('59', 'bolehkah', '42', '18', null, null, '2018-12-28 20:46:19', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('60', 'asdasdasd', '62', '18', null, null, '2018-12-28 22:51:34', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('61', 'kj', '62', '18', null, null, '2018-12-28 23:14:07', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('62', 'klasdas', '62', '18', null, null, '2018-12-29 00:15:21', null, null, 'sudah', 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('63', 'asdasd', '42', '18', null, null, '2018-12-29 00:17:07', null, null, null, 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('64', 'asdfadfadf', '42', '18', null, null, '2018-12-29 00:17:24', null, null, null, 'komentardm', null, null);
INSERT INTO `direct_message` VALUES ('65', 'asfgdafasd', '62', '18', null, null, '2018-12-29 00:17:32', null, null, 'sudah', 'komentardm', null, null);

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
INSERT INTO `kategori` VALUES ('1', 'Matematika', '2018-11-08', '2', '24', 'ACTIVE', 'icon-material-puzzle', 'materi/Matematika');
INSERT INTO `kategori` VALUES ('2', 'Seni Budaya', '2018-11-08', '0', '0', 'ACTIVE', 'icon-material-note', 'materi/Seni Budaya');
INSERT INTO `kategori` VALUES ('3', 'Penjaskes', '2018-11-08', '0', '3', 'ACTIVE', 'icon-material-stack', 'materi/Penjaskes');
INSERT INTO `kategori` VALUES ('4', 'Bahasa Indonesia', '2018-11-08', '0', '0', 'ACTIVE', 'icon-material-book', 'materi/Bahasa Indonesia');
INSERT INTO `kategori` VALUES ('5', 'Bahasa Inggris', '2018-11-08', '1', '1', 'ACTIVE', 'icon-material-stack', 'materi/Bahasa Inggris');
INSERT INTO `kategori` VALUES ('6', 'Kimia', '2018-11-08', '0', '0', 'ACTIVE', 'icon-material-people', 'materi/Kimia');
INSERT INTO `kategori` VALUES ('7', 'Fisika', '2018-11-08', '1', '19', 'ACTIVE', 'icon-material-basketball', 'materi/Fisika');

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of komentar
-- ----------------------------
INSERT INTO `komentar` VALUES ('1', 'Saya bisa membuat media tersebut dengan menggunakan software Blender 3D', '2018-11-16 19:10:18', '4', '7', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('2', 'Saya bisa mengembangkannya dengan menggunakan software Unity 3D yang lebih interaktif', '2018-11-16 19:11:30', '6', '7', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('3', 'Saya bisa membuat media 3D dengan aplikasi 4D dengan kombinasi kontral cerdas dari aplikasi Unity dan Google VR', '2018-11-16 19:12:31', '7', '7', '0', null, null, '5');
INSERT INTO `komentar` VALUES ('4', 'Saran saya bisa mencoba dengan media yang menarik perhatian siswa jadi tidak hanya menggunakan buku saja, terima kasih ', '2018-11-20 12:46:05', '55', '8', '0', null, null, '1');
INSERT INTO `komentar` VALUES ('5', 'Untuk media tenses, saya bisa membuat video simulasi buat formula tenses', '2018-11-22 14:39:03', '7', '1', '0', null, null, null);
INSERT INTO `komentar` VALUES ('6', 'Menurut saya, Guru harus mampu Mengajarkan dengan semangat, kemudian memberikan contoh mulai dari rumus yang paling mudah, hingga paling rumit, dan memberikan soal latihan pada siswa sesuai contoh, kemudian memberikan soal latihan yang mungkin belum di berikan contoh, agar siswa memiliki rasa ingin tau dan bersemangat dalam memecahkan masalahnya dengan mencari rumus dari berbagai buku atau juga internet.\r\nKemudian melakukan praktek dan peraga sesuai konsep materi. ', '2018-12-06 14:04:39', '49', '8', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('7', 'Menurut saya masalah tersebut timbul karena siswa SMP merasa bosan dengan buku mereka yg memiliki bahasa ilmiah cukup sulit dipahami . Saran saya sebaiknya bahasa di dalam buku diringkas lebih baik agar mudah dipahami dan buku diberi gambar gambar agar tidak terlihat monoton ', '2018-12-06 19:36:03', '44', '9', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('8', 'Menurut saya masalah itu timbul karena siswa SD merasa bahwa mata pelajaran matematika sulit dipelajari . Saran saya sebaiknya guru menjelaskan per bab mata pelajaran kepada siswa SD dengan jelas dan memberikan latihan soal dengan cara menunjuk satu satu pada tiap siswa , dari situ guru dapat menilai siapa yg sudah paham dan siapa yang belum paham sehingga guru dapat mnjelaskan lagi pada siswa yang belum paham . Dari situ siswa tidak akan merasa kesulitan dalam mata pelajaran matematika dan siswa akan senang mempelajarinya', '2018-12-06 19:41:01', '44', '8', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('9', 'Menurut saya, masalah yang timbul mungkin karena pembelajaran yang monoton, dan tidak ada inovasi dari guru.\r\nSaran saya, guru lebih mengkaitkan dengan kehidupan sehari-hari, menyediakan media belajar yg sumber materinya dari buku, misalnya praktikum atau tugas yang panduannya dapat ditemukan dibuku, dan menggunakan buku yang bergambar, tidak monoton teks.', '2018-12-07 21:27:50', '52', '9', '0', null, null, '4');
INSERT INTO `komentar` VALUES ('10', 'Masalah yang timbul biasanya dari persepsi siswa bahwa \"matematika itu sulit\", disitulah siswa malas untuk mempelajari matematika. Saran saya, guru menggunakan media belajar yg cocok dengan model belajar siswa, terutama untuk jenjang SD, mereka masih senang bermain. Mengubah persepsi dari matematika itu sulit menjadi math is fun. Jadi pembelajaran disertai dengan permainan agar siswa lebih tertarik. Misalnya dengan media belajar ular tangga yang pada nomor-nomor tertentu terdapat soal yang harus dikerjakan. Jika mengalami kesulitan bisa bertanya kepada kelompok belajar atau kepada guru. Lebih banyak menggunakan media belajar yang menyenangkan agar siswa SD tertarik. ', '2018-12-07 21:37:59', '52', '8', '0', null, null, '4');
INSERT INTO `komentar` VALUES ('11', 'Menurut saya, siswa SD tidak tertarik dengan mata pelajaran matematika karena cara pengajaran yang tidak mudah dimengerti atau tidak sesuai dengan karakter cara belajar anak. Saran saya, guru harus mengenal karakter siswa SD bahwa mereka ada di dunia bermain sehingga guru dapat menggunakan metode permainan untuk pembelajaran seperti metode jarimatika dan sempoa untuk berhitung sehingga membuat matematika menjadi menyenangkan dan mudah untuk dipelajari.', '2018-12-08 05:18:28', '30', '8', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('12', 'Menurut saya, masalah tersebut dikarenakan banyak siswa SD itu beranggapan bahwa semua yang berhubungan dengan angka itu sulit. Oleh karena itu guru matematika di SD harus menggunakan metode pembelajaran yang tidak membosankan dan membuat siswa takut akan pelajaran matematika. Jadi guru harus membuat kelas menjadi menyenangkan agar siswa dapat mengikuti pelajaran matematika dengan senang dan tidak tegang. Selain itu guru harus siap siaga untuk membantu siswanya dalam setiap kesulitan yg dialami.', '2018-12-08 13:52:30', '26', '8', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('13', 'Menurut saya, masalah tersebut disebabkan oleh siswa dituntut untuk menghapal rumus atau metode penyelesaian matematika sehingga membuat kebanyakan siswa merasa tertekan dan jenuh. Solusinya adalah seorang guru harus bersemangat ketika mengajar matematika dan memberi pola atau cara khusus saat menyampaikan materi matematika. Contohnya, perkalian dengan angka sembilan menggunakan jari. Misalkan: perkalian angka 1-10 dengan angka 9 menggunakan jari, 7x9 artinya jari ke tujuh dari kiri menjadi pemisah antara sisa jumlah jari di kanan (6) dan jari di kiri (3). Lalu, kedua angka tersebut digabungkan maka hasilnya adalah 63. Dari contoh pola atau cara khusus ini akan lebih memotivasi siswa untuk belajar dan tertarik karena mempermudah mereka memahami konsep matematika.', '2018-12-08 13:53:45', '43', '8', '0', null, null, '5');
INSERT INTO `komentar` VALUES ('14', 'Menurut saya, agar siswa SD dapat tertarik dengan mata pelajaran matematika dengan cara guru membuka bimbingan belajar matematika.', '2018-12-08 14:22:49', '42', '8', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('15', 'Menurut saya, siswa SMP kebanyakan bosan dengan mata pelajaran IPA dan pemahaman siswa tersebut masih kurang. Agar siswa SMP senang membaca buku terkait materi pelajaran IPA dengan menambah materi yang dapat dipelajari.', '2018-12-08 14:29:19', '42', '9', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('16', 'Menurut saya mata pelajaran matematika kurang diminati oleh siswa itu karena matematika dinilai sulit dan membosankan bagi beberapa siswa, oleh karena itu perlulah dibuat suatu metode atau cara supaya mereka tertarik dengan mata pelajaran matematika. Caranya yaitu ketika mengajar siswa seorang guru harus memiliki antusias yang tinggi dalam kelas untuk memulai pelajaran dan menunjukkan sikap hangat kepada siswa. karena ketika guru antusias atau bersemangat siswa juga akan ikut bersemangat, dan ketika guru bersikap hangat maka mereka akan merasa nyaman. Selain itu, ketika dalam pelaksanaan menjelaskan materi pengajar harus mengetahui sampai mana pemahaman siswanya. Ketika mereka kurang paham dengan penjelasan materi yang diajarkan guru, maka guru harus mencari metode lain supaya siswanya bisa memahaminya. Contohnya : biasanya guru menjelaskan di dalam kelas hingga materi tersampaikan dengan lisan tetapi siswa belum paham, maka solusinya guru mengajak siswanya menjelaskan materi dengan permainan karena pada umumnya siswa sd masih cenderung suka bermain dan membuat media pembelajaran yang menarik. Dengan begitu siswa tidak akan mengantuk dan perhatian siswa akan tertuju pada pelaksanaan pembelajaran.\r\n', '2018-12-08 15:01:05', '62', '8', '0', null, null, '5');
INSERT INTO `komentar` VALUES ('17', 'Menurut saya siwa kurang senang dalam membaca materi pelajaran IPA karena didalam buku tersebut hanya membahas materi-materi saja yang dapan membuat siswa menjadi bosan dan tidak tertarik. Sehingga cara yang dilakukan untuk menarik minat baca siswa yaitu di dalam buku materi IPA  disertai dengan cerita atau studi kasus yang ada dalam kehidupan sehari-hari dan disertai dengan gambar-gambar yang berwarna yang dapat menarik perhatian siswa SMP. Selain itu juga yang dapat membuat siswa tidak tertarik karena tidak nyamannya tempat untuk membaca. Sehingga di dalam kelas bisa di setting dengan baik menyesuaikan dengan kemauan siswa serta diberikan slogan-slogan untuk memotivasi siwa dalam membaca.', '2018-12-08 15:16:55', '62', '9', '0', 'bukan', null, '3');
INSERT INTO `komentar` VALUES ('18', 'Menurut saya, agar siwa SD tertarik dengan pelajaran matematika sebaiknya guru menggunakan strategi,  media, dan metode pembelajaran yang relevan untuk membantu daya serap anak didik dalam pemahaman materi guru perlu menggunakan metode misalkan dengan menggunakan rumus yang tidak terlalu cepat dan pastikan media yang digunakan sesuai dengan kebutuhan anak didik. Selain itu guru juga dapat memberikan motivasi kepada anak didiknya ', '2018-12-08 16:32:28', '31', '8', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('19', 'Menurut saya, sebaiknya guru memberikan materi pembelajaran dengan cara menggali sendiri materi tersebut dan mengajak keperpustakaan dari hal tersebut siswa akan mempunyai kebiasaan menyukai membaca materi yang berkaitan dengan IPA ', '2018-12-08 16:46:24', '31', '9', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('20', 'Menurut saya itu disebabkan oleh kurang dianggap pentingnya ilmu tersebut untuk para siswa, buku tersebut kurang menarik perhat', '2018-12-08 18:36:24', '45', '9', '0', null, null, '1');
INSERT INTO `komentar` VALUES ('21', 'Menurut saya itu disebabkan oleh kurang dianggap pentingnya ilmu tersebut untuk para siswa, buku tersebut kurang menarik perhatian para siswa, dan isinya kurang ringkas. Untuk solusinya yaitu dengan menyampaikan bahwa ilmu yg dipelajari itu sangat lah penting bagi kehidupan saat ini atau masa depan. Membuat buku yang lebih langsung ada penerapannya sehingga bisa langsung dipraktekkan. Terimakasih, semoga bisa bermanfaat dan memmbantu', '2018-12-08 18:40:34', '45', '9', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('22', 'menurut saya masalah tersebut disebabkan oleh bahasa yang ada di materi pelajaran IPA banyak menggunakan bahasa ilmiah sehingga membuat siswa malas membaacanya dan kurang mengerti bahasa-bahasa ilmiah didalamnya. yang harus dilakukan guru agar siswanya senang membaca buku adalah mengkaitkan materi-materi tersebut dengan kehidpan sehari-hari atau nyata, menanamkan motivasi belajar kepada siswa, dan menceitakan atau sharing kepada siswa pengaruh yang dihasilkan dari membaca buku sehingga siswa menjadi penasaran akan hal tersebut dan siswa akhirnya mau membaca buku tersebut lebih lanjut', '2018-12-09 09:11:56', '34', '9', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('23', 'menurut saya, masalah tersebut diakibatkan karena siswa menganggap bahwa materi \"MATEMATIKA ITU SULIT\". saran saya hal yang harus dilakukan oleh guru yaitu guru harus mampu membangkitkan minat siswa dalam kegiatan pembelajaran, menyusun strategi belajar atau suasana belajar yang bervariasi dan menyenangkan sehingga membuat siswa tersebut aktif dalam kegiatan tersebut. seperti menyajikan materi didampingi dengan permainan.', '2018-12-09 09:30:57', '34', '8', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('24', 'Pelajaran ipa akan sangat mudah dipahami jika guru membawa pengantar yang baik. Hal ini menjadikan ketakutan siswa mereda. Kemudian guru harus memahami Benar materi dan Menjelaskan dengan penggambaran siklus Atau urut2an pengerjaan Soal. Untuk menstimulasi siswa membawa buku, guru memberikan Soal yang bersangkutan dengan materi yang dijelaskan.', '2018-12-09 11:43:07', '57', '9', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('25', 'Guru memberikan contoh pengerjaan Soal secara terperinci hingga kemungkinan dibagian besar paham. Kemudian memberikan Soal yang sama Persis dengan materi, jika siswa bisa menyelesaikan dengan sedikit mudah, siswa biasanya akan terpacu Dan akhirnya menjadi lebih menyukai Pelajarannya.', '2018-12-09 11:48:19', '57', '8', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('26', 'Menurut saya, sebagai seorang guru harus memiliki kepribadian yang humble dan welcome dulu kepada siswa karena seorang siswa biasanya untuk suka terhadap pelajaran dilihat dulu gurunya seperti apa. kemudian setelah itu guru memberikan kegiatan pembelajaran yang menarik dan bervariasi seperti setelah memberikan pembelajaran berkaitan materi kemudian diberikan permainan sehingga siswa tidak mudah bosan. ', '2018-12-09 16:01:04', '46', '8', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('27', 'Menurut saya, guru seharusnya memilihkan sumber pembelajaran (buku) IPA yang mudah di pahami siswa karena tidak sedikit buku IPA yang bahasanya berat bagi siswa SMP. Setelah itu, setiap kegiatan pembelajaran dilakukan dengan membahas materi yang bersumber dari buku yang dipelajari siswa tersebut dengan cara siswa di berikan tugas meringkas materi dirumah berkaitan dengan materi yang akan dipelajari pertemuan yang akan datang. Kemudian pada saat pertemuan dikelas guru menjelaskan materi yang sudah dipelajari siswa menggunakan media pembelajaran yang menarik berdasarkan dari sumber pembelajaran (buku) yang sama. ', '2018-12-09 16:22:19', '46', '9', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('28', 'Menurut saya saran yang tepat adalah dalam penyampaian materi guru menggunakan contoh nyata dan sesuai dengan kondisi siswa yang di ajar.  Buku ajarnya disusun yang lebih menarik seperti desain yang menarik , bahasa yang komunukatif, dan lain-lain.', '2018-12-09 16:51:47', '24', '9', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('29', 'Menurut saya, siswa SD sudah terdoktrin bahwa Matematika itu sulit. Untuk mengatasi masalah ini, seorang guru seharusnya menerapkan pembelajaran matematika dengan basis bermain, atau langsung praktik sehingga siswa dapat mengetahui apa manfaat mereka belajar matematika, dan saya sebagai mahasiswa juga masih belajar membuat media pembelajaran dari gabungan beberapa aplikasi yang telah diajarkan oleh dosen saya. Media pembelajaran ini berupa suatu presentasi dengan tema yang saya ambil yaitu petualangan. Disana siswa akan ditunjukkan tema yang akan dipelajari pada pertemuan kala itu, kemudian di Level 1 akan dimulai dengan materi, untuk menuju ke level selanjutnya siswa harus bisa menyelesaikan tantangan di Level 1, dan seterusnya. sampai akhirnya siswa dapat mengevaluasi dirinya apakah dia mampu dan langsung tahu nilai yang muncul ketika dia mengerjakan evaluasi tersebut.', '2018-12-09 17:01:25', '29', '8', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('30', 'Mata pelajaran Matematika itu memang agak sulit jadi perlu telaten untuk mengajarkannya. Sarannya saya agar anak SD mau belajar matematika harus dengan strategi yang tepat , memberikan game, serta mengajari perkalian dasar menggunakan jari2 tangan. Guru waktu menerangkan jangan terlalu cepat, memberikan rumus dari yang mudah dipahami lalu jika anak sudah faseh baru di beri rumus cepat cara menghitung matematika. ', '2018-12-09 17:12:27', '24', '8', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('31', 'Menurut  masalah tersebut timbul karena buku IPA yang terlalu banyak materi saja sehingga membuat bosan dan membaca buku. Saran saya agar siswa senang membaca buku terutama materi buku IPA yaitu dengan hendaknya tidak melulu memberikan materi dalam bentuk buku, akan tetapi juga guru perlu memberikan atau membuatkan buku digital seperti flipbook yang dapat diberi animasi-animasi, gambar-gambar, dan suara atau lagu terkait materi IPA, sehingga siswa tidak mudah bosan dalam membaca buku. Selain itu, juga membiasakan sebelum memulai materi pelajaran dibiasakan untuk membaca buku terlebih dahulu, dan setelah pembelajaran selesai siswa juga dapat ditugaskan untuk merangkum materi yang akan dipelajari pada pertemuan berikutnya. Saat di kelas juga guru sebaiknya menggunakan media pembelajaran yang dapat menarik, dan menimbulkan rasa ingin tahu pada siswa, sehingga mereka mau membaca atau mencari di buku ????', '2018-12-10 16:47:38', '27', '9', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('32', 'Masalah tersebut mungkin sudah menjadi paradoks bahwa matematika itu sulit, ribet, apalagi jika sudah mengerjakan soal dan jawaban tidak sesuai sudah bikin males. Oleh karena itu saran saya agar siswa tertarik belajar matematika hendakanya guru dikelas menggunakan media pembelajaran yang menarik, pembelajaran interaktif dengan materi yang menarik , mudah difahami, dan juga yang melibatkan siswa itu sendiri. Dan dalam pengaplikasian nya bisa soal tersebut bisa dijadikan game-game yang menarik dan menantang untuk dikerjakan oleh siswa SD. Selain itu saat di kelas hendaknya guru memberikan reward untuk siswa yang dapat menjawab dan menyelesaikan soal, sehingga hal tersebut akan mendorong siswa untuk tertarik dan belajar matematika.', '2018-12-10 17:26:34', '27', '8', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('33', 'Menurut saya buku pelajaran IPA itu bahasanya banyak yang susah dipahami sehingga minat membaca siswanya berkurang. Jadi guru harus menggunakan media pembelajaran yang bervariasi agar siswa nya tidak mudah bosan terkait mata pelajaran IPA. Selain itu guru juga harus sering” memberi motivasi kepada siswa nya agar senang membaca buku karena “buku adalah jendela dunia” dan bisa mengajak siswa nya untuk pergi ke perpustakaan agar minat membaca siswanya bertambah.', '2018-12-11 09:17:26', '26', '9', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('34', 'Menurut saya setiap anak-anak sd biasanya merasa pelajaran matematika  sulit untuk dipahami ,padahal pelajaran ini menjadi komponen wajib dalam kurikulum dan memiliki manfaat yang baik yaitu bisa meningkatkan kemampuan anak dalam berpikir dan berargumentasi. Untuk itu agar anak bisa tertarik dalam pelajaran matematika  dan tidak merasa jika matematika itu sulit  Maka guru  dalam pengajaran matematika sebaiknya menempatkan anak sebagai subjek yang aktif dan juga menumbuhkan minat belajar matematika anak dengan cara  sebagai berikut :\r\n1)Menyampaikan materi pelajaran matematika  dengan bercerita dan memberi contoh.Misalnya,untuk materi tentang bangun ruang, anak diminta berimajinasi sedang berada dalam sebuah primas atau linmas. Mereka diminta  untuk merasakan permukaan, garis dan titik sudutnya.  Materi lain  seperti aritmatika,anak-anak bisa diminta membayangkan sedang melompat dalam bak pasir kemudian melompat lagi dan akhirnya dapat menghitung total jumlah lompatan.\r\n2)Mengajak anak berlomba  mengerjakan soal matematika. Jika terlibat dalam sebuah perlombaan, anak akan termotivasi untuk menyelesaikan soal matematika  dan cara ini lebih menyenangkan apalagi jika ada reward yang bisa diterapkan.\r\n3)Menerjemahkan soal matematika dalam bentuk permainan .Misalnya untuk konsep pengurangan dan penjumlahan pada sekolah dasar bisa dikenalkan melalui permainan peran sebagai penjual dan pembeli\r\n4)Melibatkan kemampuan anak untuk memecahkan masalah matematika. Anak diberi permasalahan matematis yang terdapat dalam kehidupan sehari-hari dan diajak untuk menyelesaikan secara sistematis. Misal: berapa jumlah kue yang bisa dimakan oleh dua anak jika dalam sehari mereka bisa makan kue sebanyak 3 kali dengan jumlah masing-masing 2 buah kue.\r\n Dengan metode pembelajaran yang seperti itu maka siswa akan lebih tertarik belajar matematika dan mereka anak merasa belajar matematika menyenangkan', '2018-12-11 10:51:37', '66', '8', '0', null, null, '5');
INSERT INTO `komentar` VALUES ('35', 'Dengan memberikan inovasi baru. Agar minat baca siswa SMP menjadi lebih meningkat. Seperti belajar/membaca buku ditaman.', '2018-12-11 10:59:59', '48', '9', '0', null, null, '1');
INSERT INTO `komentar` VALUES ('36', 'Menurut saya, mata pelajaran matematika terasa sulit karena semua terpaut pada angka, dan memiliki jawaban yang pasti, dan  dari awal sudah ditanamkan mindset bahwa \"matematika itu sulit\" dan lagi, matematika memiliki banyak rumus. Nah sebagai pendidik haruslah mengubah mindset \"matematika sulit\" itu, hal tersebut dapat dilakukan dengan variasi interaksi dan juga variasi media pembelajaran. Variasi media pembelajaran ini sangatlah penting dalam proses belajar mengajar, karena hal ini bisa menambah ketertarikan siswa terhadap mateti pembelajaran. Usia anak SD masih tergolong anak\" dan masih suka bermain, maka guru harus membuat pelajaran matematika layaknya mereka sedang bermain, dan memberikan sesuatu yang mudah untuk dihafal, misalnya menghafalkan rumus dengan bernyanyi atau singkatan kata. Semoga bermanfaat..', '2018-12-11 11:03:12', '50', '8', '0', null, null, '3');
INSERT INTO `komentar` VALUES ('37', 'Menurut saya, metode pembelajarannya diubah menjadi lebih menyenangkan agar siswa SD lebih tertarik dengan pelajaran tersebut. Tidak monoton belajar dengan buku saja.', '2018-12-11 11:04:43', '48', '8', '0', null, null, '1');
INSERT INTO `komentar` VALUES ('38', 'Menurut saya  untuk membuat siswa  tertarik untuk membaca materi pelajaran ipa adalah dengan membiasakan siswa untuk membaca  buku pada setiap pertemuan dalam jangka waktu 5-10 menit  dengan begitu siswa akan terbiasa . Jika sudah terbiasa maka mereka lama-kelamaan akan menjadikan membaca buku ipa sebagai suatu kebiasaan yang menyenangkan .', '2018-12-11 11:09:37', '66', '9', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('39', 'Menurut saya, buku-buku yang terkait pelajaran IPA biasanya ada banyak kata kata yang sulit dipahami dan membutuhkan waktu yang lama untuk memahami buku tsb. Maka dari itu, sebaiknya pendidik/ guru harus membiasakan siswa untuk membaca buku tsb dengan cara merekomendasikan buku yg terkait pelajaran IPA pada setiap 2 minggu sekali dan menarik perhatian siswa dengan kata\" yang menarik, seperti mereview buku tsb semenarik dan sebagus mungkin. Setiap buku IPA  memiliki tingkat kesulitan sendiri, untuk siswa SMP rekomendasikan buku yang menarik tapi mudah dipahami. Semoga bermanfaat..', '2018-12-11 11:26:15', '50', '9', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('40', '53\r\nMareta Bunga Pratiwi  Photo\r\nHome  Pertanyaan Detail\r\n×Berhasil! Jawaban anda telah dipublish\r\n Dashboard\r\nBantu Jawab\r\nApa yang guru bisa lakukan untuk membuat siswanya di SMP senang membaca buku terkait materi pelajaran IPA?\r\n Dec, 05 2018	  16	  21\r\n 16 Jawaban\r\nPenjawab  Photo   Photo   Photo   Photo  11\r\nMenurut saya masalah tersebut timbul karena siswa SMP merasa bosan dengan buku mereka yg memiliki bahasa ilmiah cukup sulit dipahami . Saran saya sebaiknya bahasa di dalam buku diringkas lebih baik agar mudah dipahami dan buku diberi gambar gambar agar tidak terlihat monoton\r\nPhoto  Dea Putri Lailatul Qudus\r\nReview Jawaban     \r\nMenurut saya, masalah yang timbul mungkin karena pembelajaran yang monoton, dan tidak ada inovasi dari guru. Saran saya, guru lebih mengkaitkan dengan kehidupan sehari-hari, menyediakan media belajar yg sumber materinya dari buku, misalnya praktikum atau tugas yang panduannya dapat ditemukan dibuku, dan menggunakan buku yang bergambar, tidak monoton teks.\r\nPhoto  Faricha Alif Vaniza\r\nReview Jawaban     \r\nMenurut saya, siswa SMP kebanyakan bosan dengan mata pelajaran IPA dan pemahaman siswa tersebut masih kurang. Agar siswa SMP senang membaca buku terkait materi pelajaran IPA dengan menambah materi yang dapat dipelajari.\r\nPhoto  Agam Firdaus Junaidi\r\nReview Jawaban     \r\nMenurut saya siwa kurang senang dalam membaca materi pelajaran IPA karena didalam buku tersebut hanya membahas materi-materi saja yang dapan membuat siswa menjadi bosan dan tidak tertarik. Sehingga cara yang dilakukan untuk menarik minat baca siswa yaitu di dalam buku materi IPA disertai dengan cerita atau studi kasus yang ada dalam kehidupan sehari-hari dan disertai dengan gambar-gambar yang berwarna yang dapat menarik perhatian siswa SMP. Selain itu juga yang dapat membuat siswa tidak tertarik karena tidak nyamannya tempat untuk membaca. Sehingga di dalam kelas bisa di setting dengan baik menyesuaikan dengan kemauan siswa serta diberikan slogan-slogan untuk memotivasi siwa dalam membaca.\r\nPhoto  Isvina Uma Izah\r\nReview Jawaban     \r\nMenurut saya, sebaiknya guru memberikan materi pembelajaran dengan cara menggali sendiri materi tersebut dan mengajak keperpustakaan dari hal tersebut siswa akan mempunyai kebiasaan menyukai membaca materi yang berkaitan dengan IPA\r\nPhoto  Made Ema Parurahwani\r\nReview Jawaban     \r\nMenurut saya itu disebabkan oleh kurang dianggap pentingnya ilmu tersebut untuk para siswa, buku tersebut kurang menarik perhat\r\nPhoto  Moh Hasan Safroni\r\nReview Jawaban     \r\nMenurut saya itu disebabkan oleh kurang dianggap pentingnya ilmu tersebut untuk para siswa, buku tersebut kurang menarik perhatian para siswa, dan isinya kurang ringkas. Untuk solusinya yaitu dengan menyampaikan bahwa ilmu yg dipelajari itu sangat lah penting bagi kehidupan saat ini atau masa depan. Membuat buku yang lebih langsung ada penerapannya sehingga bisa langsung dipraktekkan. Terimakasih, semoga bisa bermanfaat dan memmbantu\r\nPhoto  Moh Hasan Safroni\r\nReview Jawaban     \r\nmenurut saya masalah tersebut disebabkan oleh bahasa yang ada di materi pelajaran IPA banyak menggunakan bahasa ilmiah sehingga membuat siswa malas membaacanya dan kurang mengerti bahasa-bahasa ilmiah didalamnya. yang harus dilakukan guru agar siswanya senang membaca buku adalah mengkaitkan materi-materi tersebut dengan kehidpan sehari-hari atau nyata, menanamkan motivasi belajar kepada siswa, dan menceitakan atau sharing kepada siswa pengaruh yang dihasilkan dari membaca buku sehingga siswa menjadi penasaran akan hal tersebut dan siswa akhirnya mau membaca buku tersebut lebih lanjut\r\nPhoto  Maziyatus Sariroh Yusro\r\nReview Jawaban     \r\nPelajaran ipa akan sangat mudah dipahami jika guru membawa pengantar yang baik. Hal ini menjadikan ketakutan siswa mereda. Kemudian guru harus memahami Benar materi dan Menjelaskan dengan penggambaran siklus Atau urut2an pengerjaan Soal. Untuk menstimulasi siswa membawa buku, guru memberikan Soal yang bersangkutan dengan materi yang dijelaskan.\r\nPhoto  Bima Wahyu Syahputra\r\nReview Jawaban     \r\nMenurut saya, guru seharusnya memilihkan sumber pembelajaran (buku) IPA yang mudah di pahami siswa karena tidak sedikit buku IPA yang bahasanya berat bagi siswa SMP. Setelah itu, setiap kegiatan pembelajaran dilakukan dengan membahas materi yang bersumber dari buku yang dipelajari siswa tersebut dengan cara siswa di berikan tugas meringkas materi dirumah berkaitan dengan materi yang akan dipelajari pertemuan yang akan datang. Kemudian pada saat pertemuan dikelas guru menjelaskan materi yang sudah dipelajari siswa menggunakan media pembelajaran yang menarik berdasarkan dari sumber pembelajaran (buku) yang sama.\r\nPhoto  Indah Larasati\r\nReview Jawaban     \r\nMenurut saya saran yang tepat adalah dalam penyampaian materi guru menggunakan contoh nyata dan sesuai dengan kondisi siswa yang di ajar. Buku ajarnya disusun yang lebih menarik seperti desain yang menarik , bahasa yang komunukatif, dan lain-lain.\r\nPhoto  Ika Kharismadewi\r\nReview Jawaban     \r\nMenurut masalah tersebut timbul karena buku IPA yang terlalu banyak materi saja sehingga membuat bosan dan membaca buku. Saran saya agar siswa senang membaca buku terutama materi buku IPA yaitu dengan hendaknya tidak melulu memberikan materi dalam bentuk buku, akan tetapi juga guru perlu memberikan atau membuatkan buku digital seperti flipbook yang dapat diberi animasi-animasi, gambar-gambar, dan suara atau lagu terkait materi IPA, sehingga siswa tidak mudah bosan dalam membaca buku. Selain itu, juga membiasakan sebelum memulai materi pelajaran dibiasakan untuk membaca buku terlebih dahulu, dan setelah pembelajaran selesai siswa juga dapat ditugaskan untuk merangkum materi yang akan dipelajari pada pertemuan berikutnya. Saat di kelas juga guru sebaiknya menggunakan media pembelajaran yang dapat menarik, dan menimbulkan rasa ingin tahu pada siswa, sehingga mereka mau membaca atau mencari di buku ????\r\nPhoto  Lisa Helendriani\r\nReview Jawaban     \r\nMenurut saya buku pelajaran IPA itu bahasanya banyak yang susah dipahami sehingga minat membaca siswanya berkurang. Jadi guru harus menggunakan media pembelajaran yang bervariasi agar siswa nya tidak mudah bosan terkait mata pelajaran IPA. Selain itu guru juga harus sering” memberi motivasi kepada siswa nya agar senang membaca buku karena “buku adalah jendela dunia” dan bisa mengajak siswa nya untuk pergi ke perpustakaan agar minat membaca siswanya bertambah.\r\nPhoto  Mila Noni Alfiolita\r\nReview Jawaban     \r\nDengan memberikan inovasi baru. Agar minat baca siswa SMP menjadi lebih meningkat. Seperti belajar/membaca buku ditaman.\r\nPhoto  Milasari Saharuddin\r\nReview Jawaban     \r\nMenurut saya untuk membuat siswa tertarik untuk membaca materi pelajaran ipa adalah dengan membiasakan siswa untuk membaca buku pada setiap pertemuan dalam jangka waktu 5-10 menit dengan begitu siswa akan terbiasa . Jika sudah terbiasa maka mereka lama-kelamaan akan menjadikan membaca buku ipa sebagai suatu kebiasaan yang menyenangkan .\r\nPhoto  Intan Dewanti\r\nReview Jawaban     \r\nMenurut saya, buku-buku yang terkait pelajaran IPA biasanya ada banyak kata kata yang sulit dipahami dan membutuhkan waktu yang lama untuk memahami buku tsb. Maka dari itu, sebaiknya pendidik/ guru harus membiasakan siswa untuk membaca buku tsb dengan cara merekomendasikan buku yg terkait pelajaran IPA pada setiap 2 minggu sekali dan menarik perhatian siswa dengan kata\" yang menarik, seperti mereview buku tsb semenarik dan sebagus mungkin. Setiap buku IPA memiliki tingkat kesulitan sendiri, untuk siswa SMP rekomendasikan buku yang menarik tapi mudah dipahami. Rekomendasikan buku secara bertahap, misalnya minggu ini buku yg menarik, banyak gambarnya dan sangat mudah dipahami. 2 minggu berikutnya rekomendasikan buku yg sedikit lebih sulit (naik tingkat) tapi tetap menarik. Dan 2 minggu berikutnya rekomendasikan buku yang sulit dipahami tapi tetap menarik. Karena bila bertahap maka kesulitan\" dalam pemahaman buku tidak begitu terasa berat.\r\nSemoga bermanfaat..', '2018-12-11 11:31:48', '50', '9', '0', null, null, null);
INSERT INTO `komentar` VALUES ('41', 'Menurut saya, buku-buku yang terkait pelajaran IPA biasanya ada banyak kata kata yang sulit dipahami dan membutuhkan waktu yang lama untuk memahami buku tsb. Maka dari itu, sebaiknya pendidik/ guru harus membiasakan siswa untuk membaca buku tsb dengan cara merekomendasikan buku yg terkait pelajaran IPA pada setiap 2 minggu sekali dan menarik perhatian siswa dengan kata\" yang menarik, seperti mereview buku tsb semenarik dan sebagus mungkin. Setiap buku IPA memiliki tingkat kesulitan sendiri, untuk siswa SMP rekomendasikan buku yang menarik tapi mudah dipahami. Rekomendasikan buku secara bertahap, misalnya minggu ini buku yg menarik, banyak gambarnya dan sangat mudah dipahami. 2 minggu berikutnya rekomendasikan buku yg sedikit lebih sulit (naik tingkat) tapi tetap menarik. Dan 2 minggu berikutnya rekomendasikan buku yang sulit dipahami tapi tetap menarik. Karena bila bertahap maka kesulitan\" dalam pemahaman buku tidak begitu terasa berat.\r\nSemoga bermanfaat..', '2018-12-11 11:33:19', '50', '9', '0', null, null, '2');
INSERT INTO `komentar` VALUES ('42', 'menurut saya, siswa smp kurang tertarik membaca buku karena mereka kurang mendapatkan dukungan atau motivasi dari gurunya, saran saya dengan memberikan sedikit motivasi kepada siswanya, bisa juga dengan memberi tugas untuk merangkum buku, sehingga siswa tersebut mulai terbiasa untuk membaca buku', '2018-12-12 21:11:05', '65', '9', '9', null, null, '1');
INSERT INTO `komentar` VALUES ('43', 'menurut saya, siswa tidak tertarik dengan pelajaran matematika bisa akibat gurunya yang kurang menarik perhatian atau karena matematika bukan bidangnya. jadi saran saya, sebagai guru harus memiliki daya tarik kepada siswanya sehingga siswa tersebut bisa mengikuti pelajarab matematika dengan pikiran yang terbuka, dan juga dengan metode pembelajaran yang tidak membuat kelas tersebut menjadi bosan maka siswa akan senang dengan pelajaran tersebut.', '2018-12-12 21:18:03', '65', '8', '8', null, null, '2');
INSERT INTO `komentar` VALUES ('44', 'Menurut saya, siswa SD tidak tertarik dengan mata pelajaran matematika karena matematika cenderung hanya menggunakan angka yang melibatkan rumus yg rumit maka tertanam dalam pikiran mereka matematika itu sulit sehingga membuat jenuh dan tidak tertarik. Maka solusinya dari saya yang dulu sangat menyukai cara mengajar guru matematika SD saya adalah, yang paling awal seorang guru harus menciptakan suasana yang menyenangkan tapi serius. Contohnya: di sela penjelasan guru menyisipkan lelucon kecil yang melibatkan siswa, atau bisa menyisipkan nama-nama siswa untuk dijadikan contoh di soal yang dicontohkan guru. Dari sana, siswa akan antusias dan merasa diperhatikan. Yang kedua, dalam menjelaskan materi atau rumus yang rumit, guru harus menerjemahkannya ke daam penjelasan yang lebih sederhana, ringan dan mudah dipahami atau bisa melibatkan hal-hal yang dialami siswa. Misalnya, dalam menghitung bilangan bulat (-4) + 1 dijelaskan \"pensilnya Ali berkurang 4 karena dipinjam Ani, kemudian dikembalikan Ani 1 maka tinggal berapa yang belum dikembalikan ke Ali?\" Dengan melibatkan siswa dan mengasumsikan dengan metode kontekstual atau penyederhanaan penjelasan seperti itu maka siswa akan berpikir dan menganalisa sendiri perhitunhan tanpa merasa terbebani. Yang ketiga adalah lebih banyak praktik dari teori, yakni sering-sering langsung ke contoh soal darioada hanya penjelasan. Sehingg siswa tidak jenuh melihat teori, tapi mencoba langsung. Dari itu guru juga dapat melihat dimana letak kesulitan yang sering dialami siswa untuk dijadikan penjelasan yg lebih sederhana lagi.', '2018-12-13 12:05:32', '40', '8', '8', null, null, '5');
INSERT INTO `komentar` VALUES ('45', 'abc', '2018-12-21 21:32:28', '42', '11', '11', null, null, '5');
INSERT INTO `komentar` VALUES ('46', 'CDE', '2018-12-26 17:37:50', '42', '11', '11', null, null, null);
INSERT INTO `komentar` VALUES ('47', 'begini saja', '2018-12-28 17:12:02', '42', '11', '11', null, null, null);

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
  `dari` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of lowongan
-- ----------------------------
INSERT INTO `lowongan` VALUES ('1', 'Guru SD Bidang Studi Matematika', 'SDN 1', 'Malang', '123456798', '1', null, '2018-12-17 11:14:16', '17');

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
  `ikon_cat` varchar(255) DEFAULT NULL,
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
INSERT INTO `materi` VALUES ('1', 'Aljabar Linier', '1', '2018-11-20', '20', '30', '0', null, 'fa-flask', 'materi-blue', 'Ini adalah deskripsi dari suatu materi');
INSERT INTO `materi` VALUES ('2', 'Bahasa Inggris Reading', '5', '2018-12-19', '3', '0', '0', null, 'fa-flask', 'materi-blue', 'Materi reading');

-- ----------------------------
-- Table structure for max_notif_id_per_user
-- ----------------------------
DROP TABLE IF EXISTS `max_notif_id_per_user`;
CREATE TABLE `max_notif_id_per_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(255) DEFAULT NULL,
  `max_notif_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of max_notif_id_per_user
-- ----------------------------
INSERT INTO `max_notif_id_per_user` VALUES ('1', '1', '140');
INSERT INTO `max_notif_id_per_user` VALUES ('2', '2', '151');
INSERT INTO `max_notif_id_per_user` VALUES ('3', '3', '138');
INSERT INTO `max_notif_id_per_user` VALUES ('4', '4', '7');
INSERT INTO `max_notif_id_per_user` VALUES ('5', '5', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('6', '6', '7');
INSERT INTO `max_notif_id_per_user` VALUES ('7', '7', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('8', '8', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('9', '9', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('10', '10', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('11', '11', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('12', '12', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('13', '13', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('14', '14', '19');
INSERT INTO `max_notif_id_per_user` VALUES ('15', '15', '19');
INSERT INTO `max_notif_id_per_user` VALUES ('16', '16', '19');
INSERT INTO `max_notif_id_per_user` VALUES ('17', '17', '138');
INSERT INTO `max_notif_id_per_user` VALUES ('18', '18', '182');
INSERT INTO `max_notif_id_per_user` VALUES ('19', '19', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('20', '20', '140');
INSERT INTO `max_notif_id_per_user` VALUES ('21', '21', '19');
INSERT INTO `max_notif_id_per_user` VALUES ('22', '22', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('23', '23', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('24', '24', '89');
INSERT INTO `max_notif_id_per_user` VALUES ('25', '25', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('26', '26', '77');
INSERT INTO `max_notif_id_per_user` VALUES ('27', '27', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('28', '28', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('29', '29', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('30', '30', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('31', '31', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('32', '32', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('33', '33', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('34', '34', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('35', '35', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('36', '36', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('37', '37', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('38', '38', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('39', '39', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('40', '40', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('41', '41', '151');
INSERT INTO `max_notif_id_per_user` VALUES ('42', '42', '157');
INSERT INTO `max_notif_id_per_user` VALUES ('43', '43', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('44', '44', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('45', '45', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('46', '46', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('47', '47', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('48', '48', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('49', '49', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('50', '50', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('51', '51', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('52', '52', '144');
INSERT INTO `max_notif_id_per_user` VALUES ('53', '53', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('54', '54', '23');
INSERT INTO `max_notif_id_per_user` VALUES ('55', '55', '24');
INSERT INTO `max_notif_id_per_user` VALUES ('56', '56', '19');
INSERT INTO `max_notif_id_per_user` VALUES ('57', '57', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('58', '58', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('59', '59', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('60', '60', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('61', '61', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('62', '62', '162');
INSERT INTO `max_notif_id_per_user` VALUES ('63', '63', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('64', '64', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('65', '65', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('66', '66', '27');
INSERT INTO `max_notif_id_per_user` VALUES ('67', '67', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('68', '68', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('69', '69', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('70', '70', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('71', '71', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('72', '72', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('73', '73', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('74', '74', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('75', '75', '0');
INSERT INTO `max_notif_id_per_user` VALUES ('76', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=latin1;

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
INSERT INTO `notif` VALUES ('16', 'ratingKomentar', '7', '20', '4', '2018-11-20 04:55:38', null, null);
INSERT INTO `notif` VALUES ('17', 'ratingKomentar', '7', '20', '6', '2018-11-20 04:55:39', null, null);
INSERT INTO `notif` VALUES ('18', 'ratingKomentar', '7', '20', '7', '2018-11-20 04:55:41', null, null);
INSERT INTO `notif` VALUES ('19', 'materiBaru', '1', '20', 'semua', '2018-11-20 09:58:36', null, null);
INSERT INTO `notif` VALUES ('23', 'komentar', '8', '55', '54', '2018-11-20 12:46:05', null, null);
INSERT INTO `notif` VALUES ('24', 'ratingKomentar', '8', '54', '55', '2018-11-20 12:46:41', null, null);
INSERT INTO `notif` VALUES ('25', 'komentar', '1', '7', '18', '2018-11-22 14:39:03', null, null);
INSERT INTO `notif` VALUES ('26', 'pertanyaan', '8', '17', 'mahasiswa', '2018-12-05 20:04:19', null, null);
INSERT INTO `notif` VALUES ('27', 'pertanyaan', '9', '18', 'mahasiswa', '2018-12-05 20:07:26', null, null);
INSERT INTO `notif` VALUES ('28', 'komentar', '8', '49', '17', '2018-12-06 14:04:39', null, null);
INSERT INTO `notif` VALUES ('32', 'ratingKomentar', '8', '17', '55', '2018-12-06 14:59:45', null, null);
INSERT INTO `notif` VALUES ('33', 'ratingKomentar', '8', '17', '49', '2018-12-06 15:00:00', null, null);
INSERT INTO `notif` VALUES ('34', 'dm', '7', '17', '55', '2018-12-06 15:00:33', null, null);
INSERT INTO `notif` VALUES ('35', 'komentar', '9', '44', '18', '2018-12-06 19:36:03', null, null);
INSERT INTO `notif` VALUES ('36', 'komentar', '8', '44', '17', '2018-12-06 19:41:01', null, null);
INSERT INTO `notif` VALUES ('40', 'ratingKomentar', '8', '17', '44', '2018-12-07 05:39:04', null, null);
INSERT INTO `notif` VALUES ('44', 'komentar', '9', '52', '18', '2018-12-07 21:27:50', null, null);
INSERT INTO `notif` VALUES ('45', 'komentar', '8', '52', '17', '2018-12-07 21:37:59', null, null);
INSERT INTO `notif` VALUES ('46', 'komentar', '8', '30', '17', '2018-12-08 05:18:28', null, null);
INSERT INTO `notif` VALUES ('47', 'ratingKomentar', '8', '17', '52', '2018-12-08 07:39:06', null, null);
INSERT INTO `notif` VALUES ('48', 'ratingKomentar', '8', '17', '30', '2018-12-08 07:39:13', null, null);
INSERT INTO `notif` VALUES ('49', 'ratingKomentar', '9', '18', '44', '2018-12-08 07:39:59', null, null);
INSERT INTO `notif` VALUES ('50', 'ratingKomentar', '9', '18', '52', '2018-12-08 07:40:05', null, null);
INSERT INTO `notif` VALUES ('52', 'komentar', '8', '26', '17', '2018-12-08 13:52:30', null, null);
INSERT INTO `notif` VALUES ('53', 'komentar', '8', '43', '17', '2018-12-08 13:53:45', null, null);
INSERT INTO `notif` VALUES ('54', 'komentar', '8', '42', '17', '2018-12-08 14:22:49', null, null);
INSERT INTO `notif` VALUES ('55', 'komentar', '9', '42', '18', '2018-12-08 14:29:19', null, null);
INSERT INTO `notif` VALUES ('56', 'komentar', '8', '62', '17', '2018-12-08 15:01:05', null, null);
INSERT INTO `notif` VALUES ('58', 'komentar', '9', '62', '18', '2018-12-08 15:16:55', null, null);
INSERT INTO `notif` VALUES ('59', 'komentar', '8', '31', '17', '2018-12-08 16:32:28', null, null);
INSERT INTO `notif` VALUES ('60', 'komentar', '9', '31', '18', '2018-12-08 16:46:24', null, null);
INSERT INTO `notif` VALUES ('61', 'komentar', '9', '45', '18', '2018-12-08 18:36:24', null, null);
INSERT INTO `notif` VALUES ('62', 'komentar', '9', '45', '18', '2018-12-08 18:40:34', null, null);
INSERT INTO `notif` VALUES ('63', 'komentar', '9', '34', '18', '2018-12-09 09:11:56', null, null);
INSERT INTO `notif` VALUES ('64', 'komentar', '8', '34', '17', '2018-12-09 09:30:57', null, null);
INSERT INTO `notif` VALUES ('65', 'komentar', '9', '57', '18', '2018-12-09 11:43:07', null, null);
INSERT INTO `notif` VALUES ('66', 'komentar', '8', '57', '17', '2018-12-09 11:48:19', null, null);
INSERT INTO `notif` VALUES ('67', 'komentar', '8', '46', '17', '2018-12-09 16:01:04', null, null);
INSERT INTO `notif` VALUES ('68', 'komentar', '9', '46', '18', '2018-12-09 16:22:19', null, null);
INSERT INTO `notif` VALUES ('69', 'komentar', '9', '24', '18', '2018-12-09 16:51:47', null, null);
INSERT INTO `notif` VALUES ('70', 'komentar', '8', '29', '17', '2018-12-09 17:01:25', null, null);
INSERT INTO `notif` VALUES ('71', 'komentar', '8', '24', '17', '2018-12-09 17:12:27', null, null);
INSERT INTO `notif` VALUES ('76', 'ratingKomentar', '8', '17', '26', '2018-12-10 14:21:01', null, null);
INSERT INTO `notif` VALUES ('77', 'ratingKomentar', '8', '17', '26', '2018-12-10 14:21:07', null, null);
INSERT INTO `notif` VALUES ('78', 'ratingKomentar', '8', '17', '43', '2018-12-10 14:21:21', null, null);
INSERT INTO `notif` VALUES ('79', 'ratingKomentar', '8', '17', '42', '2018-12-10 14:21:26', null, null);
INSERT INTO `notif` VALUES ('80', 'ratingKomentar', '8', '17', '42', '2018-12-10 14:22:21', null, null);
INSERT INTO `notif` VALUES ('81', 'ratingKomentar', '8', '17', '62', '2018-12-10 14:22:35', null, null);
INSERT INTO `notif` VALUES ('82', 'ratingKomentar', '8', '17', '31', '2018-12-10 14:23:33', null, null);
INSERT INTO `notif` VALUES ('83', 'ratingKomentar', '8', '17', '34', '2018-12-10 14:24:36', null, null);
INSERT INTO `notif` VALUES ('84', 'ratingKomentar', '8', '17', '57', '2018-12-10 14:24:48', null, null);
INSERT INTO `notif` VALUES ('85', 'ratingKomentar', '8', '17', '46', '2018-12-10 14:35:25', null, null);
INSERT INTO `notif` VALUES ('86', 'ratingKomentar', '8', '17', '29', '2018-12-10 14:35:36', null, null);
INSERT INTO `notif` VALUES ('87', 'ratingKomentar', '8', '17', '24', '2018-12-10 14:35:48', null, null);
INSERT INTO `notif` VALUES ('88', 'ratingKomentar', '8', '17', '24', '2018-12-10 14:35:49', null, null);
INSERT INTO `notif` VALUES ('89', 'ratingKomentar', '8', '17', '24', '2018-12-10 14:35:53', null, null);
INSERT INTO `notif` VALUES ('90', 'komentar', '9', '27', '18', '2018-12-10 16:47:38', null, null);
INSERT INTO `notif` VALUES ('91', 'komentar', '8', '27', '17', '2018-12-10 17:26:34', null, null);
INSERT INTO `notif` VALUES ('92', 'komentar', '9', '26', '18', '2018-12-11 09:17:26', null, null);
INSERT INTO `notif` VALUES ('95', 'komentar', '8', '66', '17', '2018-12-11 10:51:37', null, null);
INSERT INTO `notif` VALUES ('96', 'komentar', '9', '48', '18', '2018-12-11 10:59:59', null, null);
INSERT INTO `notif` VALUES ('97', 'komentar', '8', '50', '17', '2018-12-11 11:03:12', null, null);
INSERT INTO `notif` VALUES ('98', 'komentar', '8', '48', '17', '2018-12-11 11:04:43', null, null);
INSERT INTO `notif` VALUES ('99', 'komentar', '9', '66', '18', '2018-12-11 11:09:37', null, null);
INSERT INTO `notif` VALUES ('100', 'komentar', '9', '50', '18', '2018-12-11 11:26:15', null, null);
INSERT INTO `notif` VALUES ('101', 'komentar', '9', '50', '18', '2018-12-11 11:31:48', null, null);
INSERT INTO `notif` VALUES ('102', 'komentar', '9', '50', '18', '2018-12-11 11:33:19', null, null);
INSERT INTO `notif` VALUES ('103', 'komentar', '9', '65', '18', '2018-12-12 21:11:05', null, null);
INSERT INTO `notif` VALUES ('104', 'komentar', '8', '65', '17', '2018-12-12 21:18:03', null, null);
INSERT INTO `notif` VALUES ('105', 'komentar', '8', '40', '17', '2018-12-13 12:05:32', null, null);
INSERT INTO `notif` VALUES ('106', 'ratingKomentar', '8', '17', '27', '2018-12-14 04:14:12', null, null);
INSERT INTO `notif` VALUES ('107', 'ratingKomentar', '8', '17', '66', '2018-12-14 04:14:33', null, null);
INSERT INTO `notif` VALUES ('108', 'ratingKomentar', '8', '17', '50', '2018-12-14 04:14:54', null, null);
INSERT INTO `notif` VALUES ('109', 'ratingKomentar', '8', '17', '50', '2018-12-14 04:15:06', null, null);
INSERT INTO `notif` VALUES ('110', 'ratingKomentar', '8', '17', '48', '2018-12-14 04:15:16', null, null);
INSERT INTO `notif` VALUES ('111', 'ratingKomentar', '8', '17', '65', '2018-12-14 04:15:24', null, null);
INSERT INTO `notif` VALUES ('112', 'ratingKomentar', '8', '17', '40', '2018-12-14 04:15:32', null, null);
INSERT INTO `notif` VALUES ('113', 'ratingKomentar', '9', '18', '52', '2018-12-14 04:17:00', null, null);
INSERT INTO `notif` VALUES ('114', 'ratingKomentar', '9', '18', '42', '2018-12-14 04:17:04', null, null);
INSERT INTO `notif` VALUES ('115', 'ratingKomentar', '9', '18', '42', '2018-12-14 04:17:08', null, null);
INSERT INTO `notif` VALUES ('116', 'ratingKomentar', '9', '18', '62', '2018-12-14 06:07:31', null, null);
INSERT INTO `notif` VALUES ('117', 'ratingKomentar', '9', '18', '31', '2018-12-14 06:07:37', null, null);
INSERT INTO `notif` VALUES ('118', 'ratingKomentar', '9', '18', '45', '2018-12-14 06:07:40', null, null);
INSERT INTO `notif` VALUES ('119', 'ratingKomentar', '9', '18', '45', '2018-12-14 06:07:57', null, null);
INSERT INTO `notif` VALUES ('120', 'ratingKomentar', '9', '18', '34', '2018-12-14 06:08:28', null, null);
INSERT INTO `notif` VALUES ('121', 'ratingKomentar', '9', '18', '34', '2018-12-14 06:08:29', null, null);
INSERT INTO `notif` VALUES ('122', 'ratingKomentar', '9', '18', '57', '2018-12-14 06:08:45', null, null);
INSERT INTO `notif` VALUES ('123', 'ratingKomentar', '9', '18', '46', '2018-12-14 06:13:30', null, null);
INSERT INTO `notif` VALUES ('124', 'ratingKomentar', '9', '18', '24', '2018-12-14 06:13:35', null, null);
INSERT INTO `notif` VALUES ('125', 'ratingKomentar', '9', '18', '27', '2018-12-14 06:13:41', null, null);
INSERT INTO `notif` VALUES ('126', 'ratingKomentar', '9', '18', '27', '2018-12-14 06:13:42', null, null);
INSERT INTO `notif` VALUES ('127', 'ratingKomentar', '9', '18', '26', '2018-12-14 06:13:54', null, null);
INSERT INTO `notif` VALUES ('128', 'ratingKomentar', '9', '18', '48', '2018-12-14 06:13:58', null, null);
INSERT INTO `notif` VALUES ('129', 'ratingKomentar', '9', '18', '66', '2018-12-14 06:14:05', null, null);
INSERT INTO `notif` VALUES ('130', 'ratingKomentar', '9', '18', '50', '2018-12-14 06:14:15', null, null);
INSERT INTO `notif` VALUES ('131', 'ratingKomentar', '9', '18', '50', '2018-12-14 06:14:49', null, null);
INSERT INTO `notif` VALUES ('132', 'ratingKomentar', '9', '18', '65', '2018-12-14 06:14:52', null, null);
INSERT INTO `notif` VALUES ('134', 'dm', '12', '17', '52', '2018-12-17 10:39:02', null, null);
INSERT INTO `notif` VALUES ('135', 'dm', '13', '17', '52', '2018-12-17 10:53:32', null, null);
INSERT INTO `notif` VALUES ('137', 'lowonganValid', '1', '1', '17', '2018-12-17 11:14:46', null, null);
INSERT INTO `notif` VALUES ('138', 'lowonganAvailable', '1', '1', 'semua', '2018-12-17 11:14:46', null, null);
INSERT INTO `notif` VALUES ('139', 'pertanyaan', '10', '3', 'mahasiswa', '2018-12-19 14:27:55', null, null);
INSERT INTO `notif` VALUES ('140', 'materiBaru', '2', '3', 'semua', '2018-12-19 14:37:28', null, null);
INSERT INTO `notif` VALUES ('141', 'dm', '14', '20', '7', '2018-12-20 06:54:00', null, null);
INSERT INTO `notif` VALUES ('142', 'dm', '15', '20', '7', '2018-12-20 06:54:24', null, null);
INSERT INTO `notif` VALUES ('143', 'dm', '18', '18', '44', '2018-12-20 18:49:42', null, null);
INSERT INTO `notif` VALUES ('144', 'dm', '21', '18', '52', '2018-12-20 18:51:18', null, null);
INSERT INTO `notif` VALUES ('145', 'dm', '22', '52', '18', '2018-12-20 19:37:56', null, 'sudah');
INSERT INTO `notif` VALUES ('147', 'dm', '23', '52', '18', '2018-12-21 15:56:07', null, 'sudah');
INSERT INTO `notif` VALUES ('148', 'dm', '26', '18', '42', '2018-12-21 21:07:40', null, null);
INSERT INTO `notif` VALUES ('149', 'dm', '27', '42', '18', '2018-12-21 21:21:22', null, 'sudah');
INSERT INTO `notif` VALUES ('150', 'dm', '28', '18', '42', '2018-12-21 21:30:01', null, null);
INSERT INTO `notif` VALUES ('151', 'pertanyaan', '11', '18', 'mahasiswa', '2018-12-21 21:30:50', null, null);
INSERT INTO `notif` VALUES ('152', 'komentar', '11', '42', '18', '2018-12-21 21:32:28', null, null);
INSERT INTO `notif` VALUES ('153', 'ratingKomentar', '11', '18', '42', '2018-12-21 21:32:57', null, null);
INSERT INTO `notif` VALUES ('154', 'dm', '29', '42', '18', '2018-12-22 05:22:36', null, 'sudah');
INSERT INTO `notif` VALUES ('155', 'dm', '30', '42', '18', '2018-12-22 09:55:01', null, 'sudah');
INSERT INTO `notif` VALUES ('156', 'dm', '33', '18', '62', '2018-12-22 10:04:47', null, null);
INSERT INTO `notif` VALUES ('157', 'dm', '40', '18', '42', '2018-12-22 11:01:37', null, null);
INSERT INTO `notif` VALUES ('158', 'dm', '41', '42', '18', '2018-12-22 11:03:24', null, 'sudah');
INSERT INTO `notif` VALUES ('159', 'dm', '42', '18', '62', '2018-12-23 23:46:28', null, null);
INSERT INTO `notif` VALUES ('160', 'dm', '43', '18', '62', '2018-12-23 23:46:56', null, null);
INSERT INTO `notif` VALUES ('161', 'dm', '44', '18', '62', '2018-12-23 23:47:59', null, null);
INSERT INTO `notif` VALUES ('162', 'dm', '45', '18', '62', '2018-12-23 23:48:21', null, null);
INSERT INTO `notif` VALUES ('163', 'dm', '46', '42', '18', '2018-12-26 15:12:35', null, 'sudah');
INSERT INTO `notif` VALUES ('164', 'dm', '47', '42', '18', '2018-12-26 17:27:57', null, 'sudah');
INSERT INTO `notif` VALUES ('165', 'komentar', '11', '42', '18', '2018-12-26 17:37:50', null, null);
INSERT INTO `notif` VALUES ('166', 'dm', '48', '42', '18', '2018-12-26 21:03:15', null, 'sudah');
INSERT INTO `notif` VALUES ('167', 'dm', '49', '42', '18', '2018-12-28 15:45:07', null, 'sudah');
INSERT INTO `notif` VALUES ('168', 'dm', '50', '42', '18', '2018-12-28 15:47:12', null, 'sudah');
INSERT INTO `notif` VALUES ('169', 'dm', '51', '42', '18', '2018-12-28 15:52:51', null, 'sudah');
INSERT INTO `notif` VALUES ('170', 'dm', '52', '42', '18', '2018-12-28 16:36:10', null, 'sudah');
INSERT INTO `notif` VALUES ('171', 'dm', '53', '62', '18', '2018-12-28 16:44:45', null, 'sudah');
INSERT INTO `notif` VALUES ('172', 'dm', '54', '42', '18', '2018-12-28 17:01:50', null, 'sudah');
INSERT INTO `notif` VALUES ('173', 'komentar', '11', '42', '18', '2018-12-28 17:12:02', null, null);
INSERT INTO `notif` VALUES ('174', 'dm', '55', '42', '18', '2018-12-28 20:21:03', null, 'sudah');
INSERT INTO `notif` VALUES ('175', 'dm', '56', '42', '18', '2018-12-28 20:21:08', null, 'sudah');
INSERT INTO `notif` VALUES ('176', 'dm', '57', '42', '18', '2018-12-28 20:39:54', null, 'sudah');
INSERT INTO `notif` VALUES ('177', 'dm', '58', '42', '18', '2018-12-28 20:41:10', null, 'sudah');
INSERT INTO `notif` VALUES ('178', 'dm', '59', '42', '18', '2018-12-28 20:46:19', null, 'sudah');
INSERT INTO `notif` VALUES ('179', 'dm', '60', '62', '18', '2018-12-28 22:51:34', null, 'sudah');
INSERT INTO `notif` VALUES ('180', 'dm', '61', '62', '18', '2018-12-28 23:14:07', null, 'sudah');
INSERT INTO `notif` VALUES ('181', 'dm', '62', '62', '18', '2018-12-29 00:15:21', null, 'sudah');
INSERT INTO `notif` VALUES ('182', 'dm', '63', '42', '18', '2018-12-29 00:17:07', null, null);
INSERT INTO `notif` VALUES ('183', 'dm', '64', '42', '18', '2018-12-29 00:17:24', null, null);
INSERT INTO `notif` VALUES ('184', 'dm', '65', '62', '18', '2018-12-29 00:17:33', null, 'sudah');

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
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=latin1;

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
INSERT INTO `notif_flag` VALUES ('14', '3', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('16', '55', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('17', '55', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('18', '55', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('19', '55', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('20', '55', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('21', '55', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('22', '55', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('23', '1', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('24', '30', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('25', '30', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('26', '30', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('27', '30', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('28', '30', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('29', '30', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('30', '30', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('31', '55', '24', '1', '0');
INSERT INTO `notif_flag` VALUES ('33', '56', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('34', '56', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('35', '56', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('36', '56', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('37', '56', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('38', '56', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('39', '56', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('40', '21', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('41', '7', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('42', '7', '18', '1', '0');
INSERT INTO `notif_flag` VALUES ('43', '2', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('44', '2', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('45', '2', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('46', '2', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('47', '2', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('48', '2', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('49', '2', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('50', '7', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('51', '7', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('55', '17', '28', '1', '0');
INSERT INTO `notif_flag` VALUES ('56', '17', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('57', '44', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('58', '44', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('59', '44', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('60', '44', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('61', '44', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('62', '44', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('63', '44', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('64', '44', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('65', '44', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('66', '24', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('67', '24', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('68', '24', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('69', '24', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('70', '24', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('71', '24', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('72', '24', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('73', '24', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('74', '24', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('75', '17', '36', '1', '0');
INSERT INTO `notif_flag` VALUES ('79', '28', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('80', '28', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('81', '28', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('82', '28', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('83', '28', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('84', '28', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('85', '28', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('86', '28', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('87', '28', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('88', '52', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('89', '52', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('90', '52', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('91', '52', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('92', '52', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('93', '52', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('94', '52', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('95', '52', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('96', '52', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('97', '17', '46', '1', '0');
INSERT INTO `notif_flag` VALUES ('98', '17', '45', '1', '0');
INSERT INTO `notif_flag` VALUES ('99', '18', '44', '1', '0');
INSERT INTO `notif_flag` VALUES ('100', '18', '35', '1', '0');
INSERT INTO `notif_flag` VALUES ('101', '18', '25', '1', '0');
INSERT INTO `notif_flag` VALUES ('102', '18', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('103', '26', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('104', '26', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('105', '26', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('106', '26', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('107', '26', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('108', '26', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('109', '26', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('110', '26', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('111', '26', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('112', '42', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('113', '42', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('114', '42', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('115', '42', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('116', '42', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('117', '42', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('118', '42', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('119', '42', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('120', '42', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('121', '62', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('122', '62', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('123', '62', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('124', '62', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('125', '62', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('126', '62', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('127', '62', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('128', '62', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('129', '62', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('130', '31', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('131', '31', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('132', '31', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('133', '31', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('134', '31', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('135', '31', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('136', '31', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('137', '31', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('138', '31', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('139', '45', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('140', '45', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('141', '45', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('142', '45', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('143', '45', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('144', '45', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('145', '45', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('146', '45', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('147', '45', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('148', '34', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('149', '34', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('150', '34', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('151', '34', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('152', '34', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('153', '34', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('154', '34', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('155', '34', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('156', '34', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('157', '46', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('158', '46', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('159', '46', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('160', '46', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('161', '46', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('162', '46', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('163', '46', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('164', '46', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('165', '46', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('166', '29', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('167', '29', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('168', '29', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('169', '29', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('170', '29', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('171', '29', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('172', '29', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('173', '29', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('174', '29', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('175', '2', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('176', '2', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('177', '52', '50', '1', '0');
INSERT INTO `notif_flag` VALUES ('178', '52', '47', '1', '0');
INSERT INTO `notif_flag` VALUES ('184', '32', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('185', '32', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('186', '32', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('187', '32', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('188', '32', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('189', '32', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('190', '32', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('191', '32', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('192', '32', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('193', '17', '71', '1', '0');
INSERT INTO `notif_flag` VALUES ('194', '17', '70', '1', '0');
INSERT INTO `notif_flag` VALUES ('195', '17', '67', '1', '0');
INSERT INTO `notif_flag` VALUES ('196', '17', '66', '1', '0');
INSERT INTO `notif_flag` VALUES ('197', '17', '64', '1', '0');
INSERT INTO `notif_flag` VALUES ('198', '17', '59', '1', '0');
INSERT INTO `notif_flag` VALUES ('199', '17', '56', '1', '0');
INSERT INTO `notif_flag` VALUES ('200', '17', '54', '1', '0');
INSERT INTO `notif_flag` VALUES ('201', '17', '53', '1', '0');
INSERT INTO `notif_flag` VALUES ('202', '17', '52', '1', '0');
INSERT INTO `notif_flag` VALUES ('203', '27', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('204', '27', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('205', '27', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('206', '27', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('207', '27', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('208', '27', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('209', '27', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('210', '27', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('211', '27', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('212', '40', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('213', '40', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('214', '40', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('215', '40', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('216', '40', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('217', '40', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('218', '40', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('219', '40', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('220', '40', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('221', '26', '77', '1', '0');
INSERT INTO `notif_flag` VALUES ('222', '26', '76', '1', '0');
INSERT INTO `notif_flag` VALUES ('223', '66', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('224', '66', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('225', '66', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('226', '66', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('227', '66', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('228', '66', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('229', '66', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('230', '66', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('231', '66', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('232', '24', '89', '1', '0');
INSERT INTO `notif_flag` VALUES ('233', '24', '88', '1', '0');
INSERT INTO `notif_flag` VALUES ('234', '24', '87', '1', '0');
INSERT INTO `notif_flag` VALUES ('235', '48', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('236', '48', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('237', '48', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('238', '48', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('239', '48', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('240', '48', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('241', '48', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('242', '48', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('243', '48', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('244', '50', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('245', '50', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('246', '50', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('247', '50', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('248', '50', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('249', '50', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('250', '50', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('251', '50', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('252', '50', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('253', '65', '27', '1', '0');
INSERT INTO `notif_flag` VALUES ('254', '65', '26', '1', '0');
INSERT INTO `notif_flag` VALUES ('255', '65', '19', '1', '0');
INSERT INTO `notif_flag` VALUES ('256', '65', '7', '1', '0');
INSERT INTO `notif_flag` VALUES ('257', '65', '5', '1', '0');
INSERT INTO `notif_flag` VALUES ('258', '65', '4', '1', '0');
INSERT INTO `notif_flag` VALUES ('259', '65', '3', '1', '0');
INSERT INTO `notif_flag` VALUES ('260', '65', '2', '1', '0');
INSERT INTO `notif_flag` VALUES ('261', '65', '1', '1', '0');
INSERT INTO `notif_flag` VALUES ('262', '17', '105', '1', '0');
INSERT INTO `notif_flag` VALUES ('263', '17', '104', '1', '0');
INSERT INTO `notif_flag` VALUES ('264', '17', '98', '1', '0');
INSERT INTO `notif_flag` VALUES ('265', '17', '97', '1', '0');
INSERT INTO `notif_flag` VALUES ('266', '17', '95', '1', '0');
INSERT INTO `notif_flag` VALUES ('267', '17', '91', '1', '0');
INSERT INTO `notif_flag` VALUES ('268', '18', '103', '1', '0');
INSERT INTO `notif_flag` VALUES ('269', '18', '102', '1', '0');
INSERT INTO `notif_flag` VALUES ('270', '18', '101', '1', '0');
INSERT INTO `notif_flag` VALUES ('271', '18', '100', '1', '0');
INSERT INTO `notif_flag` VALUES ('272', '18', '99', '1', '0');
INSERT INTO `notif_flag` VALUES ('273', '18', '96', '1', '0');
INSERT INTO `notif_flag` VALUES ('274', '18', '92', '1', '0');
INSERT INTO `notif_flag` VALUES ('275', '18', '90', '1', '0');
INSERT INTO `notif_flag` VALUES ('276', '18', '69', '1', '0');
INSERT INTO `notif_flag` VALUES ('277', '18', '68', '1', '0');
INSERT INTO `notif_flag` VALUES ('278', '18', '65', '1', '0');
INSERT INTO `notif_flag` VALUES ('279', '18', '63', '1', '0');
INSERT INTO `notif_flag` VALUES ('280', '18', '62', '1', '0');
INSERT INTO `notif_flag` VALUES ('281', '18', '61', '1', '0');
INSERT INTO `notif_flag` VALUES ('282', '18', '60', '1', '0');
INSERT INTO `notif_flag` VALUES ('283', '18', '58', '1', '0');
INSERT INTO `notif_flag` VALUES ('284', '18', '55', '1', '0');
INSERT INTO `notif_flag` VALUES ('287', '17', '138', '1', '0');
INSERT INTO `notif_flag` VALUES ('288', '17', '137', '1', '0');
INSERT INTO `notif_flag` VALUES ('289', '2', '138', '1', '0');
INSERT INTO `notif_flag` VALUES ('290', '3', '138', '1', '0');
INSERT INTO `notif_flag` VALUES ('291', '2', '140', '1', '0');
INSERT INTO `notif_flag` VALUES ('292', '2', '139', '1', '0');
INSERT INTO `notif_flag` VALUES ('293', '1', '140', '1', '0');
INSERT INTO `notif_flag` VALUES ('294', '20', '140', '1', '0');
INSERT INTO `notif_flag` VALUES ('295', '20', '138', '1', '0');
INSERT INTO `notif_flag` VALUES ('296', '18', '140', '1', '0');
INSERT INTO `notif_flag` VALUES ('297', '18', '138', '1', '0');
INSERT INTO `notif_flag` VALUES ('298', '52', '144', '1', '0');
INSERT INTO `notif_flag` VALUES ('299', '52', '140', '1', '0');
INSERT INTO `notif_flag` VALUES ('300', '52', '139', '1', '0');
INSERT INTO `notif_flag` VALUES ('301', '52', '138', '1', '0');
INSERT INTO `notif_flag` VALUES ('302', '52', '135', '1', '0');
INSERT INTO `notif_flag` VALUES ('303', '52', '134', '1', '0');
INSERT INTO `notif_flag` VALUES ('304', '52', '113', '1', '0');
INSERT INTO `notif_flag` VALUES ('305', '18', '145', '1', '0');
INSERT INTO `notif_flag` VALUES ('307', '18', '147', '1', '0');
INSERT INTO `notif_flag` VALUES ('308', '42', '148', '1', '0');
INSERT INTO `notif_flag` VALUES ('309', '42', '140', '1', '0');
INSERT INTO `notif_flag` VALUES ('310', '42', '139', '1', '0');
INSERT INTO `notif_flag` VALUES ('311', '42', '138', '1', '0');
INSERT INTO `notif_flag` VALUES ('312', '42', '115', '1', '0');
INSERT INTO `notif_flag` VALUES ('313', '42', '114', '1', '0');
INSERT INTO `notif_flag` VALUES ('314', '42', '80', '1', '0');
INSERT INTO `notif_flag` VALUES ('315', '42', '79', '1', '0');
INSERT INTO `notif_flag` VALUES ('316', '18', '149', '1', '0');
INSERT INTO `notif_flag` VALUES ('317', '42', '151', '1', '0');
INSERT INTO `notif_flag` VALUES ('318', '42', '150', '1', '0');
INSERT INTO `notif_flag` VALUES ('319', '18', '152', '1', '0');
INSERT INTO `notif_flag` VALUES ('320', '42', '153', '1', '0');
INSERT INTO `notif_flag` VALUES ('321', '18', '154', '1', '0');
INSERT INTO `notif_flag` VALUES ('322', '18', '155', '1', '0');
INSERT INTO `notif_flag` VALUES ('323', '18', '158', '1', '0');
INSERT INTO `notif_flag` VALUES ('324', '42', '157', '1', '0');
INSERT INTO `notif_flag` VALUES ('325', '18', '165', '1', '0');
INSERT INTO `notif_flag` VALUES ('326', '18', '170', '1', '0');
INSERT INTO `notif_flag` VALUES ('327', '18', '172', '1', '0');
INSERT INTO `notif_flag` VALUES ('365', '18', '173', '1', '0');
INSERT INTO `notif_flag` VALUES ('371', '18', '181', '1', '0');
INSERT INTO `notif_flag` VALUES ('372', '18', '184', '1', '0');
INSERT INTO `notif_flag` VALUES ('373', '18', '182', '1', '0');
INSERT INTO `notif_flag` VALUES ('374', '18', '183', '1', '0');

-- ----------------------------
-- Table structure for pengguna
-- ----------------------------
DROP TABLE IF EXISTS `pengguna`;
CREATE TABLE `pengguna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `jumlah_dm_solved` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_pengguna` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pengguna
-- ----------------------------
INSERT INTO `pengguna` VALUES ('1', 'Admin', 'Admin', 'admin@admin.com', null, null, null, '0', 'ACTIVE', 'admin', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', 'SHiC7WGtgjcRFXsgXVwa6ykJJk4h89QA4KH3cBTPnfMuV3oIRWxdE0MOBZ8jPdFy', '0', '0');
INSERT INTO `pengguna` VALUES ('2', 'Maha Siswa', 'Maha Siswa', 'mahasiswa@mahasiswa.com', '+6289987009', null, null, '0', 'ACTIVE', 'mahasiswa', 'userprofiles/Maha_Siswa_-_profil2.jpg', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('3', 'Muhammad Ridho', 'Muhammad Ridho', 'guru@guru.com', '089680752154', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Muhammad_Ridho_-_profil1.jpg', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('4', 'Anton Bayangkara', 'Anton Bayangkara', 'anton@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '2', null, '0', '0');
INSERT INTO `pengguna` VALUES ('5', 'Bagus Sandika', 'Bagus Sandika', 'bagus@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('6', 'Cintya Restu', 'Cintya Restu', 'cintya@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '3', null, '0', '0');
INSERT INTO `pengguna` VALUES ('7', 'Dea Amanda', 'Dea Amanda', 'dea@student.com', '', null, null, '0', 'ACTIVE', 'mahasiswa', 'userprofiles/Dea_Amanda_-_profil.png', '202cb962ac59075b964b07152d234b70', '5', null, '0', '0');
INSERT INTO `pengguna` VALUES ('8', 'Emilia Rina', 'Emilia Rina', 'emil@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('9', 'Farah Nabila', 'Farah Nabila', 'farah@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('10', 'Gina Sabrina', 'Gina Sabrina', 'gina@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('11', 'Hamid Dian', 'Hamid Dian', 'hamid@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('12', 'Irfan Joni', 'Irfan Joni', 'irfan@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('13', 'Jaka Umbara', 'Jaka Umbara', 'jaka@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('14', 'Mulyadi Fadil', 'Mulyadi Fadil', 'mulyadi@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Mulyadi_Fadil_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('15', 'Hasan Wirayudha', 'Hasan Wirayudha', 'hasan@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Hasan_Wirayudha_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('16', 'Evania Yafie', 'Evania Yafie', 'evania@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Evania_Yafie_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('17', 'Ni Luh Sakinah', 'Ni Luh Sakinah', 'niluh@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Ni_Luh_Sakinah_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('18', 'Herlina Ike', 'Herlina Ike', 'herlina@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Herlina_Ike_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', '5u91ZqC7N1jNijtAUp8FBmvrsTSAdS6nsDWPgKoIH9HXVkMFBgTrhIw4zRVKPGxv', '0', '0');
INSERT INTO `pengguna` VALUES ('19', 'Ence Surahman', 'Ence Surahman', 'ence@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Ence_Surahman_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('20', 'Yerry Soepriyanto', 'Yerry Soepriyanto', 'yerry@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Yerry_Soepriyanto_-_profil.jpeg', 'e10adc3949ba59abbe56e057f20f883e', '0', 'FO3aBKlomea82Zt9cKALxUisTjr612CYGVJggWHq7hDIsCXc7p4dLAzbkQTubdij', '0', '0');
INSERT INTO `pengguna` VALUES ('21', 'Henry Praherdhiono', 'Henry Praherdhiono', 'henry@teacher.com', '', null, null, '0', 'ACTIVE', 'pendidik', 'userprofiles/Henry_Praherdhiono_-_profil.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('22', 'Miftakhul Sholikhah', 'Miftakhul Sholikhah', 'miftakhulsholikhah@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'c68737b0ef27a9a79d936caa9b0ec1fe', '0', 'NTYIwLaQxvJchDukEBaT0LFn2Qg7ecgbXOdCSp2UKR9hdtu9M4rklwy7G6rzWsFz', '0', '0');
INSERT INTO `pengguna` VALUES ('23', 'Ginanjar Septiana Supardiansyah', 'Ginanjar Septiana S', 'ginanjarsetiana4@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '0fae158952bdf312208d5b2d1d94d657', '0', 'uhqQNSNjcb2J98kU6ZDSfVXmZGdv644odTAWIgCCwxMzLnc3g5OvQTEk8FyxKXzf', '0', '0');
INSERT INTO `pengguna` VALUES ('24', 'Ika Kharismadewi', 'Ika Kharismadewi', 'rismaika016@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'd4da8d9e6e5c4b1c9db7b01bb7c6c5b3', '4', null, '0', '0');
INSERT INTO `pengguna` VALUES ('25', 'Irfan Agung Purnomo', 'Irfan Agung Purnomo', 'agungirfan630@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'ccbc7fda6d3cf74cf2a0c6be76ef05bf', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('26', 'Mila Noni Alfiolita', 'Mila Noni Alfiolita', 'milanoni99@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'aef2afc5eceadab86921beb9b02b1904', '5', null, '0', '0');
INSERT INTO `pengguna` VALUES ('27', 'Lisa Helendriani', 'Lisa Helendriani', 'lisahelend19@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '822ad60fd167aff9c07af373cbe0ef72', '6', 'QEcyWft8s2GDw6bXnJLaFe3T7Y9VzfRkI4UizMpOLjRaUvO6KV8Cdm5mhKlx1oAo', '0', '0');
INSERT INTO `pengguna` VALUES ('28', 'Ermian Hotnauli Silalahi', 'Ermian Hotnauli S', 'ermianhotnauli@yahoo.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86f9933c52433750c83590a234555e67', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('29', 'Nafika Fikria Arifianda', 'Nafika Fikria A', 'nafikafikriaarifianda@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8941a8eff97ee4405e9e2781e32ffbf5', '3', 'uhxcyUdzZmarJjsfpH087MLYOtztAEBQiMa4HpVlq4EqCIv50vC1wuSkYw8Z3l3r', '0', '0');
INSERT INTO `pengguna` VALUES ('30', 'Nur Roudlotul Jannah', 'Nur Roudlotul J', 'nurroudloh.nrj@gmail.com', '085851597531', null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'becb73795b3cdf701973a5f4c46a7c0a', '2', null, '0', '0');
INSERT INTO `pengguna` VALUES ('31', 'Made Ema Parurahwani', 'Made Ema P', 'emamade4@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '4d7ef38325543457eb2cb9cefce36214', '5', null, '0', '0');
INSERT INTO `pengguna` VALUES ('32', 'Lailatul Mufida', 'Lailatul Mufida', 'ellamufida.00@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'ac03ebfafd59b65f494bf5d9cda778ad', '0', 'Ntpd1XMzP92YuXA4FrDWcqT4kEnyhLcSzISNJebyFZbio8QqW5ajpox7JOBlemi2', '0', '0');
INSERT INTO `pengguna` VALUES ('33', 'Deah Arta Muviana', 'Deah Arta Muviana', 'damuviana@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'cfb5a8202eb4e890a9195c9a7e08c7c1', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('34', 'Maziyatus Sariroh Yusro', 'Maziyatus Sariroh Y', 'sariroh74@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '3e06f2af88392a8943c423d7d36d307a', '4', 'wrj3LfiE79QGW0NjfIpRLuCeihBJXlp7YAtMzMZ6EK6N29H4q5vs3cngUamh2Wvb', '0', '0');
INSERT INTO `pengguna` VALUES ('35', 'Maulidiyah Wiahnanda', 'Maulidiyah W', 'diyahnanda6@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '77c84df87bcf58cc132ce5119f4623a8', '0', '5RhbmLiN8dCzkGn7pBoD4mkEvMjLKuoYsz0Oyl3XTVerthMFXN37b9x2gZBqeQPI', '0', '0');
INSERT INTO `pengguna` VALUES ('36', 'Meridza Nur Audina', 'Meridza Nur Audina', 'audinameridza@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '9c38e42876b09f089ea4a4b5dc7b84ae', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('37', 'Kurniawan Prasetyo', 'Kurniawan Prasetyo', 'kurniawan1161@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '2803f0d8de6c6b2d80121f23489e3553', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('38', 'Maqfirotul Laily', 'Maqfirotul Laily', 'maqfirotullaily23@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'a24229a75305bf7052d5b2f1a2a428b8', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('39', 'Kurniawan Prasetyo 1161', 'Kurniawan Prasetyo 1', 'kurniawan1161@yahoo.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '3ee2a3262b635039690c7ffa88db860f', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('40', 'Eka Zunita Nurfadilah', 'Eka Zunita N', 'ekazunitanurfadila@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6a1b3f1a6f1facf5e9c940b34c76b092', '5', 'ZeffyJnqwbYEv3TNcl1VUkCQ2nPwilkx8Sy06K3O87OCHFqFVdAdhs4YutguxRUa', '0', '0');
INSERT INTO `pengguna` VALUES ('41', 'Isvina Uma Izah', 'Isvina Uma Izah', 'isvinaumaizah1@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('42', 'Agam Firdaus Junaidi', 'Agam Firdaus J', 'agamjunaidi010@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '11', null, '0', '0');
INSERT INTO `pengguna` VALUES ('43', 'Istiqomah Ahsanu Amala', 'Istiqomah Ahsanu A', 'istiamala28@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86d9bcae56114714da37d1a7938e8d59', '5', 'jJKw71gAuW9BRnlOX5E0rhTtJdgOacRs2NbW1q8doPhubzFqrI2MwE5NlTvU0Yya', '0', '0');
INSERT INTO `pengguna` VALUES ('44', 'Dea Putri Lailatul Qudus', 'Dea Putri Lailatul Q', 'deaputri0527@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '331dfed457ebeee3e3bceb98f54a7243', '5', '1fCJurTyWC0PVNStRbN6dB9HqscAKWd7zDPQqf48vLUcoX1yGQeZSOen3Oh5E3GD', '0', '0');
INSERT INTO `pengguna` VALUES ('45', 'Moh Hasan Safroni', 'Moh Hasan Safroni', 'hassansaffroni@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6dc08c1e5df2e0152d1fb6a3eaf6b726', '3', 'AiADspuESZFclopmNU0MdkKhZQ91BXqJVtn4TGHCkbFRIeUVxqt9La5PchWJLws0', '0', '0');
INSERT INTO `pengguna` VALUES ('46', 'Indah Larasati', 'Indah Larasati', '1999indah@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '347101d0ff2538bc3f71a4c17831bdbc', '5', 'FISP3zDdlpYMAGo80LHrq9Lz2hGRuOAltiEMPJSmUbX6UC5nXWxBK7fodYN1bQWc', '0', '0');
INSERT INTO `pengguna` VALUES ('47', 'Moch. Romadhoni', 'Moch. Romadhoni', 'mochromadhoni20@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '261a794363c16c2a9969c2ee093673d6', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('48', 'Milasari Saharuddin', 'Milasari Saharuddin', 'Milathahir@yahoo.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '5fc81072e9e3ea0558f417741d5da990', '2', null, '0', '0');
INSERT INTO `pengguna` VALUES ('49', 'Leonarda Indra Suryati', 'Leonarda Indra S', 'nardasuryati@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '1762c9584d2822920b91ea8d0a83d1ec', '3', null, '0', '0');
INSERT INTO `pengguna` VALUES ('50', 'Mareta Bunga Pratiwi', 'Mareta Bunga P', 'maretabungapratiwi@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '65f5613ed4048b905a51997d67cd0d80', '7', '3nbDjBtmcqGdal0Bw9Fpiz8aGgsWYwJyhNxvukEoLIC7MfjUeQQ7WLR5KR0Kr8A3', '0', '0');
INSERT INTO `pengguna` VALUES ('51', 'Ahmad Dian Tri Raharjo', 'Ahmad Dian Tri R', 'ahmaddiantriraharjo@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '41fe7581cfcb26bcbe22700512c6fcd0', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('52', 'Faricha Alif Vaniza', 'Faricha Alif Vaniza', 'aliffaricha@gmail.com', '', null, null, '0', 'ACTIVE', 'mahasiswa', 'userprofiles/Faricha_Alif_Vaniza_-_profil1.jpg', '202cb962ac59075b964b07152d234b70', '8', 'HMfn47bJhGOEaNIv31BUkqmSCwRCLlkOt3iyWcbY8zu9itsnXl6aR1jS4Ys2gAFq', '0', '0');
INSERT INTO `pengguna` VALUES ('53', 'Ibnu', 'Ibnu', 'ibnuspeedster@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('54', 'Johnson Martin', 'Johnson Martin', 'johnson@teacher.com', null, null, null, '0', 'ACTIVE', 'pendidik', 'assets/dashboard/assets/images/reading.png', 'a426dcf72ba25d046591f81a5495eab7', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('55', 'Ilham Kurniawan', 'Ilham Kurniawan', 'ahmad@student.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8de13959395270bf9d6819f818ab1a00', '1', null, '0', '0');
INSERT INTO `pengguna` VALUES ('56', 'Si Kabayan', 'Si Kabayan', 'kabayan@students.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('57', 'Bima Wahyu Syahputra', 'Bima Wahyu S', 'bimakhun98@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '8e7e48ef20e3b93440ac3529e37f282a', '4', null, '0', '0');
INSERT INTO `pengguna` VALUES ('58', 'Hizzam Alief Aditya', 'Hizzam Alief Aditya', 'hisamadit@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'c39ebcc31aa2316b4fb869e40f90248e', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('59', 'Krisma Sari', 'Krisma Sari', 'krismasari.1999@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'de5957036e471ac139b11527f4468d5f', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('60', 'Kurniawan9628', 'Kurniawan9628', 'kurniawan9628@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '83b39376740639dcd68bd19dd9381722', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('61', 'Kurniawan1161', 'Kurniawan1161', 'kurniawan9628@yahoo.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '83b39376740639dcd68bd19dd9381722', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('62', 'Isvina Uma Izah', 'Isvina Uma Izah', 'isvinaumaizahh1@gmail.com', '', null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '202cb962ac59075b964b07152d234b70', '8', null, '0', '0');
INSERT INTO `pengguna` VALUES ('63', 'Ermian Hotnauli', 'Ermian Hotnauli', 'ermianhotnauli@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '86f9933c52433750c83590a234555e67', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('64', '1Ginanjar Septiana Supardiansyah', '1Ginanjar Septiana S', 'ginanjarseptiana4@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '0fae158952bdf312208d5b2d1d94d657', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('65', 'Bayu Aji', 'Bayu Aji', 'bayuuaji24@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'c360eabd5dab25c89050d0a44b3514a0', '3', null, '0', '0');
INSERT INTO `pengguna` VALUES ('66', 'Intan  Dewanti', 'Intan  Dewanti', 'intandewanti0211@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '089d35901cb27c86abb922a6e8a14079', '7', null, '0', '0');
INSERT INTO `pengguna` VALUES ('67', 'Maulidiyah Wn', 'Maulidiyah Wn', 'diyahnanda07@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '77c84df87bcf58cc132ce5119f4623a8', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('68', 'Ekazunitaa.n', 'Ekazunitaa.n', 'ekazunita.n@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '6a1b3f1a6f1facf5e9c940b34c76b092', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('69', 'INTAN DEWANTI', 'INTAN DEWANTI', 'intandewanti0211@gmail.cm', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '089d35901cb27c86abb922a6e8a14079', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('70', 'INTAN DEWANTI22', 'INTAN DEWANTI22', 'dewantiintan0211@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '089d35901cb27c86abb922a6e8a14079', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('71', 'Hisam Alief Aditya', 'Hisam Alief Aditya', 'danteinferno944@yahoo.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'f067936105e945d36b6a11615a6a9b20', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('72', 'MARETA BUNGA P', 'MARETA BUNGA P', 'maretabungap@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '65f5613ed4048b905a51997d67cd0d80', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('73', 'Maretabunga_p', 'Maretabunga_p', 'maretabungaa@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '65f5613ed4048b905a51997d67cd0d80', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('74', 'LUCIA MEGA YULIANA', 'LUCIA MEGA YULIANA', 'luciamega84@gmail.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', '2db66c39052af722cdc6d12c3be87985', '0', null, '0', '0');
INSERT INTO `pengguna` VALUES ('75', 'Fasukan Sekuda', 'Fasukan Sekuda', 'herlinaa@teacher.com', null, null, null, '0', 'ACTIVE', 'mahasiswa', 'assets/dashboard/assets/images/reading.png', 'e10adc3949ba59abbe56e057f20f883e', '0', null, '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permasalahan
-- ----------------------------
INSERT INTO `permasalahan` VALUES ('8', 'Apa yang bisa dilakukan guru agar siswanya di SD tertarik dengan mata pelajaran matematika?', '2018-12-05 20:04:19', '17', '21', '0', '20', '1', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('9', 'Apa yang guru bisa lakukan untuk membuat siswanya di SMP senang membaca buku terkait materi pelajaran IPA?', '2018-12-05 20:07:26', '18', '23', '0', '19', '7', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('10', 'Adakah metode yang bisa digunakan untuk membuat presentasi yang baik di mata pelajaran bahasa inggris?', '2018-12-19 14:27:55', '3', '0', '0', '0', '5', 'UNSOLVED', 'ACTIVE');
INSERT INTO `permasalahan` VALUES ('11', 'Apa yang guru bisa lakukan untuk membuat siswanya di SD senang membaca buku terkait materi pelajaran MATEMATIKA?', '2018-12-21 21:30:50', '18', '1', '0', '3', '1', 'UNSOLVED', 'ACTIVE');

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of riwayat_permasalahan_dilihat
-- ----------------------------
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('1', '4', '7', '2018-11-16 19:09:46');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('2', '6', '7', '2018-11-16 19:11:00');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('3', '7', '7', '2018-11-16 19:11:55');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('4', '55', '8', '2018-11-20 12:44:19');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('5', '55', '7', '2018-11-20 12:44:23');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('6', '7', '1', '2018-11-22 14:38:32');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('7', '56', '7', '2018-11-22 19:55:37');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('8', '56', '3', '2018-11-22 19:55:53');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('9', '56', '4', '2018-11-22 19:56:06');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('10', '7', '2', '2018-11-26 13:28:28');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('11', '7', '9', '2018-12-06 03:37:22');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('12', '49', '8', '2018-12-06 13:59:54');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('13', '44', '9', '2018-12-06 19:33:39');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('14', '44', '8', '2018-12-06 19:37:29');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('15', '24', '9', '2018-12-06 21:52:21');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('16', '52', '9', '2018-12-07 21:23:02');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('17', '52', '8', '2018-12-07 21:30:11');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('18', '30', '8', '2018-12-08 04:51:00');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('19', '43', '8', '2018-12-08 13:35:40');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('20', '26', '8', '2018-12-08 13:45:33');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('21', '26', '9', '2018-12-08 13:54:59');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('22', '43', '9', '2018-12-08 13:55:23');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('23', '42', '8', '2018-12-08 14:21:06');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('24', '42', '9', '2018-12-08 14:24:06');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('25', '62', '8', '2018-12-08 14:42:40');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('26', '62', '9', '2018-12-08 15:02:27');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('27', '31', '8', '2018-12-08 16:23:49');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('28', '31', '9', '2018-12-08 16:33:30');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('29', '59', '9', '2018-12-08 16:43:26');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('30', '45', '9', '2018-12-08 18:34:01');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('31', '34', '9', '2018-12-09 09:00:00');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('32', '34', '8', '2018-12-09 09:12:38');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('33', '57', '9', '2018-12-09 11:36:23');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('34', '57', '8', '2018-12-09 11:44:46');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('35', '46', '8', '2018-12-09 15:54:37');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('36', '46', '9', '2018-12-09 16:08:18');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('37', '29', '8', '2018-12-09 16:50:57');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('38', '29', '9', '2018-12-09 17:01:50');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('39', '24', '8', '2018-12-09 17:06:50');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('40', '2', '8', '2018-12-09 22:04:27');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('41', '32', '9', '2018-12-10 08:41:02');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('42', '27', '9', '2018-12-10 15:40:59');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('43', '27', '8', '2018-12-10 16:49:50');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('44', '40', '8', '2018-12-10 21:52:31');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('45', '40', '9', '2018-12-10 21:57:44');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('46', '66', '8', '2018-12-11 10:20:40');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('47', '50', '8', '2018-12-11 10:46:03');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('48', '66', '9', '2018-12-11 10:55:30');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('49', '48', '9', '2018-12-11 10:58:26');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('50', '48', '8', '2018-12-11 11:02:09');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('51', '50', '9', '2018-12-11 11:07:38');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('52', '65', '9', '2018-12-12 21:02:43');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('53', '65', '8', '2018-12-12 21:04:03');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('54', '2', '9', '2018-12-19 13:58:05');
INSERT INTO `riwayat_permasalahan_dilihat` VALUES ('55', '42', '11', '2018-12-21 21:31:26');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('1', '1', 'matematika');
INSERT INTO `tags` VALUES ('2', '1', 'sma');
INSERT INTO `tags` VALUES ('3', '1', 'gratis');
INSERT INTO `tags` VALUES ('4', '2', '#bahasainggris #wordpress');
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
