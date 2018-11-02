<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
		if ($this->session->userdata('loginSession')['aktor'] !== 'mahasiswa') {
			alert('login','warning','Peringatan!',"Anda harus login terlebih dahulu untuk menjawab pertanyaan tersebut. Atau daftar <a href='".base_url()."register'>disini</a> jika belum memiliki akun");
			redirect(base_url().'login');
		}
		// set array koasong untuk simpan notif2
		$this->menu['notif'] = array();
		$this->menu['belum_dilihat'] = array();
		$this->notifikasiMenu();
	}
	/*
	* function untuk menampilkan halaman dashboard
	*/
	function dashboard()
	{
		$header['title'] = "Mahasiswa - Dashboard";
		$this->menu['breadcrumb'] = "Dashboard";
		$this->menu['active'] = "dashboard";
		$record['kategori'] = $this->model->readS('kategori')->result();

		$this->load->view("statis/header",$header);
		$this->load->view("mahasiswa/menu",$this->menu);
		$this->load->view("mahasiswa/dashboard",$record);
		$this->load->view("statis/footer");
	}

	/*
	* function untuk handle ajax request untuk onclick pilih kategori. function ini dipanggil di halaman dashboard.
	*/
	function getPermasalahanByKategori()
	{
		if ($this->input->get() !== '') {
			if ($this->input->get('kategori') == "all") {
				$record['permasalahan'] = $this->model->rawQuery("
				SELECT
						permasalahan.id,
						permasalahan.teks,
						permasalahan.tanggal,
						pengguna.nama AS nama_pengguna,
						permasalahan.jumlah_komen,
						permasalahan.jumlah_dilihat,
						permasalahan.kategori,
						kategori.nama AS nama_kategori,
						permasalahan.status,
						permasalahan.beku,
						pengguna.foto
				FROM permasalahan
				LEFT JOIN pengguna ON permasalahan.siapa = pengguna.id
				LEFT JOIN kategori ON permasalahan.kategori = kategori.id
				ORDER BY permasalahan.tanggal
				")->result();
				
			}else{
				$record['permasalahan'] = $this->model->rawQuery("
				SELECT
						permasalahan.id,
						permasalahan.teks,
						permasalahan.tanggal,
						pengguna.nama AS nama_pengguna,
						permasalahan.jumlah_komen,
						permasalahan.jumlah_dilihat,
						permasalahan.kategori,
						kategori.nama AS nama_kategori,
						permasalahan.status,
						permasalahan.beku,
						pengguna.foto
				FROM permasalahan
				LEFT JOIN pengguna ON permasalahan.siapa = pengguna.id 
				LEFT JOIN kategori ON permasalahan.kategori = kategori.id 
				WHERE permasalahan.kategori = '".$this->input->get('kategori')."' 
				ORDER BY permasalahan.tanggal
				")->result();
				
			}
			foreach ($record['permasalahan'] as $key => $value) {
				$record['permasalahan'][$key]->komentator = $this->getPenjawab($value->id)['foto_nama'];
				$record['permasalahan'][$key]->remaining_penjawab = $this->getPenjawab($value->id)['remaining_penjawab'];
			}
			echo json_encode($record);
		}
	}

	/*
	* function untuk search sesuatu pada array, bisa multidimensi
	*/
	function in_array_r($needle, $haystack, $strict = false) {
		foreach ($haystack as $item) {
			if (($strict ? $item === $needle : $item == $needle) || (is_array($item) && $this->in_array_r($needle, $item, $strict))) {
				return true;
			}
		}
		return false;
	}

	/*
	* function untuk menampilkan pesan
	*/
	function pesan()
	{
		$header['title'] = "Mahasiswa - Pesan";
		$this->menu['breadcrumb'] = "Pesan";
		$this->menu['active'] = "pesan";
		$this->load->view('statis/header',$header);
		$this->load->view('mahasiswa/menu',$this->menu);
		$this->load->view('mahasiswa/pesan');
		$this->load->view('statis/footer');
	}

	/*
	* function untuk menampilkan profil
	*/
	function profil(){
		$header['title'] = "Mahasiswa - Profil";
		$this->menu['breadcrumb'] = "Profil";
		$this->menu['active'] = "";
		$this->load->view('statis/header',$header);
		$this->load->view('mahasiswa/menu',$this->menu);
		$this->load->view('mahasiswa/profil');
		$this->load->view('statis/footer');

	}

	/*
	* function untuk menampilkan halaman edit profil
	*/
	function editProfil()
	{
		$record['pengguna'] = $this->model->read('pengguna',array('id'=>$this->session->userdata('loginSession')['id']))->result();
		$header['title'] = "Mahasiswa - Edit Profil";
		$this->menu['breadcrumb'] = "Profil";
		$this->load->view('statis/header',$header);
		$this->load->view('mahasiswa/menu',$this->menu);
		$this->load->view('mahasiswa/edit-profil',$record);
		$this->load->view('statis/footer');
	}

	/*
	* function untuk handling form edit profil
	*/
	function submitEditProfil()
	{
		if ($this->input->post() !== array()) {

			// cek apakah ada pergantian password
			$recordPengguna = ''; // variabel akan tidak kosong apabila ada perintah update password. untuk simpan record pengguna sebagai pencocokan
			if ($this->input->post('password') !== '') {
				$recordPengguna = $this->model->read('pengguna',array('id'=>$this->input->post('id')))->result();
				if (md5($this->input->post('password')) !== $recordPengguna[0]->password) {
					alert('editProfil','danger','Gagal!','Edit profil gagal. Password salah');
					redirect('edit-profil-mahasiswa');
					return true;
				}else{
					// cek apakah password_ ada isinya
					if ($this->input->post('password_') == '') {
						alert('editProfil','danger','Gagal!','Password baru tidak dimasukkan. Isilah kolom password hanya jika ingin mengganti password');
						redirect('edit-profil-mahasiswa');
						return true;
					}else{
						// masukkan password baru ke array untuk bahan eksekusi
						$queryUpdate['password'] = md5($this->input->post('password'));
					}
				}
			}
			
			// cek apakah ada perintah update foto
			if ($_FILES['foto']['name'] !== '') {
				$config['upload_path']	= FCPATH.'userprofiles/';
				$config['allowed_types']= 'gif|jpg|png';
				$config['file_name'] = $this->input->post('nama')." - profil";
				$this->load->library('upload', $config);

				if ( ! $this->upload->do_upload('foto'))
				{
					alert('editProfil','danger','Gagal!',$this->upload->display_errors());
					redirect('edit-profil-mahasiswa');
					return false;
				}
				else
				{
					$queryUpdate['foto'] = "userprofiles/".$this->upload->data()['file_name'];
				}
			}

			$this->form_validation->set_rules('nama','Nama','trim|required');
			$this->form_validation->set_rules('email','Email','trim|required|valid_email');
			$this->form_validation->set_rules('no_hp','Nomor telepon','trim');

			if ($this->form_validation->run() !== FALSE) {
				$queryUpdate['nama'] = ucwords($this->input->post('nama'));
				$queryUpdate['email'] = $this->input->post('email');
				$queryUpdate['no_hp'] = $this->input->post('no_hp');
				$runUpdate = $this->model->update('pengguna',array('id'=>$this->input->post('id')),$queryUpdate);
				$runUpdate = json_decode($runUpdate);

				if ($runUpdate->status) {
					alert('editProfil','success','Barhasil!','Profil telah di perbarui di database. Saat ini data yang ditampilkan belum berubah, anda harus login kembali untuk melihat perubahan.');
					redirect('edit-profil-mahasiswa');
				}else{
					if ($runUpdate->error_message->code == 1062) {
						alert('editProfil','danger','Gagal!',$runUpdate->error_message->message);
						redirect('edit-profil-mahasiswa');
					}else{
						echo "<pre>";
						var_dump($runUpdate);
						die();
					}
				}
			}else{
				$register = validation_errors("<div class='alert alert-warning alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>",
				'</div>');
				$this->session->set_flashdata('editProfil', $register);
				redirect('edit-profil-mahasiswa');
			}
			// var_dump($queryUpdate);
			// var_dump($runUpdate);
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}


	/*
	* funtion untuk pesan icon angka pada icon amplop
	*/
	function notifikasiMenu()
	{
		// cek max notif id, jika lebih dari max id di db, maka eksekusi hitung notif 
		// $maxIdDb_ = $this->model->read("max_notif_id_per_user",array('id_pengguna'=>$this->session->userdata('loginSession')['id']))->result();

		// $notifBaruDanUntukSaya = $this->model->rawQuery("SELECT")
		// if ($maxIdDb_[0]->max_notif_id) {
			
		// }
		
		// baca notif untuk para mahasiswa dan dia seorang
		$notif_mahasiswa = $this->model->rawQuery("
			SELECT  
					notif_permasalahan.id, 
					pengguna.nama AS dari, 
					notif_permasalahan.untuk, 
					notif_permasalahan.datetime 
			FROM notif_permasalahan 
			LEFT JOIN pengguna ON pengguna.id = notif_permasalahan.dari
			WHERE 
					untuk='mahasiswa' 
			OR 
					untuk='".$this->session->userdata('loginSession')['id']."'
			ORDER BY datetime DESC
		");
		if ($notif_mahasiswa->num_rows() != 0) {
			$notif_mahasiswa = $notif_mahasiswa->result();
			
			// baca notif yang untuk para mahasiswa yang sudah terlihat untuk dikoreksi dengan notifikasi untuk para mahasiswa
			$notif_mahasiswa_terlihat = $this->model->rawQuery("SELECT id_notif FROM notif_mhs_per_user WHERE terlihat = '1' AND id_pengguna='".$this->session->userdata('loginSession')['id']."' ")->result_array();

			// array matang untuk dikirim ke menu
			$notif_ = array();

			foreach ($notif_mahasiswa as $key => $value) {
				$notif_[$key] = $value;
				if ($this->in_array_r($value->id,$notif_mahasiswa_terlihat)) {
					$notif_[$key]->terlihat = 'sudah';
				}else{
					$notif_[$key]->terlihat = 'belum';
					array_push($this->menu['belum_dilihat'], $value->id);
				}
			}

			// insert max notif id per user
			$runQuery = $this->model->rawQuery("UPDATE max_notif_id_per_user SET max_notif_id =".$notif_mahasiswa[0]->id." WHERE id_pengguna='".$this->session->userdata('loginSession')['id']."'");
			// var_dump($runQuery);die();

			unset($notif_mahasiswa);unset($notif_mahasiswa_terlihat);unset($notif_mahasiswa_terbaca);

			// array noti_ siap dikirim ke menu
			$this->menu['notif'] = array_slice($notif_, 0, 7);
		}
	}

	/*
	* funtion untuk update notifikasi ke terlihat
	* insert batch ke tabel notif_per_user untuk memasukkan bahwa specified user sudah lihat atau belum
	*/
	function setTerlihat()
	{
		if ($this->input->post() !== array()) {
			if ($this->menu['belum_dilihat'] !== array()) {
				$updateToNotifMhsPerUser 	= "INSERT INTO notif_mhs_per_user VALUES ";
				foreach ($this->menu['belum_dilihat'] as $key => $value) {
					$updateToNotifMhsPerUser.= "(NULL,'".$this->session->userdata('loginSession')['id']."','".$value."','1','0'),";
				}
				$idToUpdate =  rtrim($idToUpdate,", ");				
				$updateToNotifMhsPerUser =  rtrim($updateToNotifMhsPerUser,", ");
				$runQuery = $this->model->rawQuery($updateToNotifMhsPerUser);
			}
		}
	}

	/*
	* function untuk menampilkan halaman pertanyaa saya. saat ingin menjawab
	*/
	function pertanyaanDetail($id)
	{
		$cariPertanyaan = $this->model->read("permasalahan",array('id'=>$id));
		if ($cariPertanyaan->num_rows() != 0) {

			// apakah seorang mahasiswa sudah melihat permasalahan
			$cariRiwayatLihatPermasalahan = $this->model->read("riwayat_permasalahan_dilihat",array('id_pengguna'=>$this->session->userdata('loginSession')['id'],'permasalahan'=>$id))->num_rows();
			
			if ($cariRiwayatLihatPermasalahan == 0) {
				
				// insert into riwayat permasalahan dilihat. sedangkan update tabel pertanyaan kolom jumlah_dilihat otomatis dari trigger
				$this->model->create('riwayat_permasalahan_dilihat',array('id_pengguna'=>$this->session->userdata('loginSession')['id'],'permasalahan'=>$id,'tanggal'=>date('Y-m-d H:i:s')));
			}
			$record['pertanyaan'] 	= $cariPertanyaan->result();
			$record['jawaban']		= $this->model->rawQuery("
				SELECT
						komentar.teks,
						komentar.tanggal,
						pengguna.nama AS siapa,
						pengguna.foto
				FROM komentar
				LEFT JOIN pengguna ON komentar.siapa = pengguna.id
				WHERE komentar.permasalahan ='".$id."'
				")->result();
			
			$record['penjawab'] = $this->getPenjawab($id)['foto_nama'];
			$record['remaining_penjawab'] = $this->getPenjawab($id)['remaining_penjawab'];

			$header['title'] = "Mahasiswa - Pertanyaan Detail";
			$header['breadcrumb'] = "Pertanyaan Detail";
			$this->menu['active'] = "Pertanyaan Detail";
			$this->load->view('statis/header',$header);
			$this->load->view('mahasiswa/menu',$this->menu);
			$this->load->view('mahasiswa/pertanyaan-detail',$record);
			$this->load->view('statis/footer');
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Data tidak ditemukan</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* funtion untuk ambil data siapa saja beserta foto penjawah sebuah pertanyaan di db.
	* $pertanyaan itu id nya
	* $limit berupa angka atau all untuk nampilkan fotofoto komentator
	*/
	function getPenjawab($pertanyaan,$limit = 4)
	{
		if ($limit == "all") {
			// $record['penjawab'] = '';
		}else{
			$foto_nama = $this->model->rawQuery("
				SELECT 
						DISTINCT
						pengguna.nama,
						pengguna.foto
				FROM komentar
				LEFT JOIN pengguna ON komentar.siapa = pengguna.id
				WHERE permasalahan = '".$pertanyaan."'
				ORDER BY komentar.tanggal DESC
				LIMIT ".$limit
			)->result();

			$remaining_penjawab = $this->model->rawQuery("
				SELECT 
					COUNT(DISTINCT siapa) AS semua
				FROM komentar 
				WHERE permasalahan=".$pertanyaan
			)->result();

			$remaining_penjawab = $remaining_penjawab[0]->semua;
			$remaining_penjawab -= 4;
			if ($remaining_penjawab < 0 ) {
				$remaining_penjawab = 0;
			}
		}
		$record['foto_nama'] = $foto_nama;
		$record['remaining_penjawab'] = $remaining_penjawab;
		return $record;
	}

	/*
	* function untuk menampilkan halaman jawab pertanyaan
	*/
	function pertanyaanJawab($id)
	{
		$cariPertanyaan = $this->model->read("permasalahan",array('id'=>$id));
		if ($cariPertanyaan->num_rows() != 0) {
			$record['permasalahan'] = $cariPertanyaan->result();

			$header['title'] = "Mahasiswa - Pertanyaan Jawab";
			$header['breadcrumb'] = "Pertanyaan Jawab";
			$this->menu['active'] = "dashboard";
			$this->load->view('statis/header',$header);
			$this->load->view('mahasiswa/menu',$this->menu);
			$this->load->view('mahasiswa/pertanyaan-jawab',$record);
			$this->load->view('statis/footer');
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Data tidak ditemukan</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk memprose form pada halaman jawab pertanyaan
	*/
	function insertJawaban()
	{
		if ($this->input->post() != array()) {
			$cariPertanyaan = $this->model->read("permasalahan",array('id'=>$this->input->post('id')));
			if ($cariPertanyaan->num_rows() != 0) {
				$recordInsert['teks'] 			= $this->input->post('jawaban');
				$recordInsert['tanggal'] 		= date('Y-m-d H:i:s');
				$recordInsert['siapa'] 			= $this->session->userdata('loginSession')['id'];
				$recordInsert['permasalahan'] 	= $this->input->post('id');
				$queryInsert = $this->model->create("komentar",$recordInsert);
				$queryInsert = json_decode($queryInsert);
				if ($queryInsert->status) {
					alert('jawab','success','Berhasil!','Jawaban anda telah dipublish');
					redirect('pertanyaan-detail-mahasiswa/'.$this->input->post('id'));
				}else{
					alert('jawab','warning','Gagal!','Jawaban anda gagal dipublish');
					redirect('pertanyaan-jawab-mahasiswa/'.$this->input->post('id'));
				}
			}else{
				$error['heading'] = '404 Page Not Found';
				$error['message'] = '<p>Data tidak ditemukan</p>';
				$this->load->view('errors/html/error_404',$error);
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang dipost</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk menampilkan halaman materi
	*/
	function materi()
	{
		$header['title'] = "Pendidik - Materi";
		$this->menu['breadcrumb'] = "Materi";
		$this->menu['active'] = "materi";
		$record['kategori'] = $this->model->readS("kategori")->result();
		$this->load->view("statis/header",$header);
		$this->load->view("mahasiswa/menu",$this->menu);
		$this->load->view("mahasiswa/materi",$record);
		$this->load->view("statis/footer");
	}

	/*
	* funtion untuk menampilkan halaman tambah materi
	*/
	function tambahMateri()
	{
		$header['title'] = "Pendidik - Materi Tambah";
		$this->menu['breadcrumb'] = "Materi";
		$this->menu['active'] = "materi";
		$record['kategori'] = $this->model->readS("kategori")->result();

		$this->load->view("statis/header",$header);
		$this->load->view("mahasiswa/menu",$this->menu);
		$this->load->view("mahasiswa/materi-tambah",$record);
		$this->load->view("statis/footer");
	}

	/*
	* function untuk menampilkan halaman karir
	*/
	function karir()
	{
		$header['title'] = "Pendidik - Karir";
		$this->menu['breadcrumb'] = "Karir";
		$this->menu['active'] = "karir";

		$this->load->view("statis/header",$header);
		$this->load->view("mahasiswa/menu",$this->menu);
		$this->load->view("mahasiswa/karir");
		$this->load->view("statis/footer");
	}

		/*
	* function untuk menampilkan halaman karir
	*/
	function tambahKarir()
	{
		$header['title'] = "Pendidik - Karir Tambah";
		$this->menu['breadcrumb'] = "Karir";
		$this->menu['active'] = "karir";

		$this->load->view("statis/header",$header);
		$this->load->view("mahasiswa/menu",$this->menu);
		$this->load->view("mahasiswa/karir-tambah");
		$this->load->view("statis/footer");
	}
}