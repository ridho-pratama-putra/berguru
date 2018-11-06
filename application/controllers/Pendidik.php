<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pendidik extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
		if ($this->session->userdata('loginSession')['aktor'] !== 'pendidik') {
			alert('login','warning','Peringatan!',"Anda tidak memiliki hak akses sebagai pendidik. Atau mendaftar <a href='".base_url()."register'> disini</a> jika belum memiliki akun");
			redirect('login');
		}
		// set array koasong untuk simpan notif2
		$this->menu['notif'] = array();
		$this->menu['belum_dilihat'] = array();
		$this->notifikasiMenu();
		// $this->menu['notif'] = $this->model->read("notif",array("untuk"=>"mahasiswa OR untuk='".$this->session->userdata('loginSession')['id']."'"));

	}


	/*
	* function untuk menampilkan pesan
	*/
	function pesan()
	{
		// echo "<pre>";
		// var_dump($this->input->get());
		// die();
		$header['title'] 		= 'Pendidik - Pesan';
		$this->menu['breadcrumb'] 	= 'Pesan';
		$this->menu['active'] 		= 'pesan';
		$record = array();
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$this->menu);

		// apakah bikin chat baru atau tidak. kalau ya, open new chat room dialog, kalau tidak, tampilkan 'tidak ada pesan yang dipilih'
		if ($this->input->post() !== array()) {

			// cek apakah direct message sudah d inisialisasi
			$bacaDirectMessage = $this->model->read('direct_message',array('dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>$this->input->post('id_komentator'),'permasalahan'=>$this->input->post('id_permasalahan')));
			if ($bacaDirectMessage->num_rows() == 0) {
				$record['new_chat'] = $this->model->create('direct_message',array('dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>$this->input->post('id_komentator'),'permasalahan'=>$this->input->post('id_permasalahan'),'komentar'=>$this->input->post('id_komentar'),'tanggal'=>date('Y-m-d H:i:s')));
			}

			
			$record['komentator'] = $this->model->readCol('pengguna',array('id'=>$this->input->post('id_komentator')),array('nama','email','foto'))->result();
			$record['pertanyaan'] = $this->model->read('permasalahan',array('id'=>$this->input->post('id_permasalahan')))->result();
			$record['komentar'] = $this->model->read('komentar',array('id'=>$this->input->post('id_komentar')))->result();
			$this->load->view('tenagapendidik/pesan-detail',$record);
		}else{
			$this->load->view('tenagapendidik/pesan');
		}
		$this->load->view('statis/footer');
	}

	/*
	* function untuk get record pesan pada database dengan parameter where adalah seoranga guru tersebut. dipanggil di pesan.php
	*/
	function getPesan()
	{
		if ($this->input->post() != array()) {
			// $recordPesan = $this->model->read('pesan',array('id'=>))	
		}
	}

	/*
	* function untuk menampilkan profil
	*/
	function profil(){
		$header['title'] = 'Pendidik - Profil';
		$this->menu['breadcrumb'] 	= 'Profil';
		$this->menu['active'] 		= '';
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$this->menu);
		$this->load->view('tenagapendidik/profil');
		$this->load->view('statis/footer');

	}

	/*
	* function untuk menampilkan pertanyaan saya
	*/
	function pertanyaanSaya()
	{
		$header['title'] = 'Pendidik - Pertanyaan Saya';
		$this->menu['active'] = 'pertanyaanSaya';
		$this->menu['breadcrumb'] = 'Pertanyaan Saya';
		$record['pertanyaan'] = $this->model->rawQuery("
			SELECT 
					permasalahan.id,
					permasalahan.teks,
					permasalahan.tanggal,
					permasalahan.jumlah_komen,
					permasalahan.jumlah_dilihat,
					permasalahan.status,
					permasalahan.beku,
					kategori.nama AS kategori,
					pengguna.nama AS siapa
			FROM permasalahan
			INNER JOIN kategori ON kategori.id = permasalahan.kategori
			INNER JOIN pengguna ON pengguna.id = permasalahan.siapa
			WHERE permasalahan.siapa ='".$this->session->userdata('loginSession')['id']."'
			ORDER BY permasalahan.tanggal DESC
			")->result();
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$this->menu);
		$this->load->view('tenagapendidik/pertanyaan-saya',$record);
		$this->load->view('statis/footer');
	}

	/*
	* function untuk menampilkan halaman tambah pertanyaan
	*/
	function buatPertanyaan()
	{
		$header['title'] = 'Pendidik - Buat Pertanyaan';
		$this->menu['active'] = 'pertanyaanSaya';
		$this->menu['breadcrumb'] = 'Pertanyaan Saya';
		$recordPertanyaan['kategori'] = $this->model->read('kategori',array('status'=>'ACTIVE'))->result();
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$this->menu);
		$this->load->view('tenagapendidik/pertanyaan-tambah',$recordPertanyaan);
		$this->load->view('statis/footer');
	}

	/*
	* function untuk menampilkan halaman edit profil
	*/
	function editProfil()
	{
		$record['pengguna'] = $this->model->read('pengguna',array('id'=>$this->session->userdata('loginSession')['id']))->result();
		$header['title'] = "Pendidik - Edit Profil";
		$this->menu['active'] = "editProfil";
		$this->menu['breadcrumb'] = "Edit Profil";
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$this->menu);
		$this->load->view('tenagapendidik/edit-profil',$record);
		$this->load->view('statis/footer');
	}

	/*
	* function untuk action form pada halaman tambah pertanyaan
	*/
	function insertPertanyaan()
	{
		if ($this->input->post() != array()) {
			$queryPermasalahan= $this->model->create_id('permasalahan',array( 
																			'teks' => $this->input->post('pertanyaan'),
																			'tanggal' => date("Y-m-d H:i:s"),
																			'siapa'	=> $this->session->userdata('loginSession')['id'],
																			'kategori'=>$this->input->post('kategori'),
																			'jumlah_dilihat'=>'0',
																			'jumlah_dibaca'=>'0',
																			'jumlah_komen'=>'0',
																			'status'=>'UNSOLVED',
																			'beku'=>'ACTIVE'
									));
			$queryPermasalahan = json_decode($queryPermasalahan);
			if ($queryPermasalahan->status) {
				// tell all mahasiswa kalau ada pesan baru. baca dulu id semua pengguna yang bertipe mahasiswa, kalau sudah, masukkan kan ke tabel notidikasi_message
				$insertNotifikasiMessage = $this->model->create('notif',array(
																						'konteks'			=> 'pertanyaan',
																						'id_konteks' 		=> $queryPermasalahan->message,
																						'dari'				=>$this->session->userdata('loginSession')['id'],
																						'untuk'				=>'mahasiswa',
																						'datetime'			=>date('Y-m-d H:i:s')
																					)
				);

				alert('pertanyaan','success','Berhasil!','Pertanyaan telah di publish');
			}else{
				alert('buatPertanyaan','danger','Gagal!','Pertanyaan tidak dipublish. Kesalahan sistem');
				redirect('buat-pertanyaan-pendidik');
				return true;
			}
			redirect('pertanyaan-pendidik');
		}
	}

	/*
	* function untk menghapus pertanyaan via js post
	*/
	function deletePertanyaan(){
		if ($this->input->post() !== array()) {
			// delete di tabel master, yakni permasalahan
			$deletePertanyaan = $this->model->delete('permasalahan',array('id'=>$this->input->post('id')));

			// delete di tabel notifikasi
			$this->model->delete('notif',array('konteks'=>'pertanyaan', 'id_konteks'=>$this->input->post('id')));			

			// delete di tabel riwayat_notifikasi
			$this->model->delete('riwayat_permasalahan',array('permasalahan'=>$this->input->post('id')));			

			if ($deletePertanyaan) {
				alert('pertanyaan','success','Berhasil!','Pertanyaan telah dihapus');
			}else{
				alert('pertanyaan','danger','Gagal!','Pertanyaan tidak dapat dihapus');
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
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
					redirect('edit-profil-pendidik');
					return true;
				}else{
					// cek apakah password_ ada isinya
					if ($this->input->post('password_') == '') {
						alert('editProfil','danger','Gagal!','Password baru tidak dimasukkan. Isilah kolom password hanya jika ingin mengganti password');
						redirect('edit-profil-pendidik');
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
					redirect('edit-profil-pendidik');
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
					redirect('edit-profil-pendidik');
				}else{
					if ($runUpdate->error_message->code == 1062) {
						alert('editProfil','danger','Gagal!',$runUpdate->error_message->message);
						redirect('edit-profil-pendidik');
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
				redirect('edit-profil-pendidik');
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
	* function untuk melihat detail pertanyaan
	*/
	function detailPertanyaan($id)
	{
		$record['pertanyaan'] = $this->model->rawQuery("
			SELECT 
				permasalahan.id,
				permasalahan.teks,
				permasalahan.tanggal,
				pengguna.nama AS nama_pengguna,
				permasalahan.jumlah_komen,
				permasalahan.jumlah_dilihat,
				kategori.nama AS nama_kategori,
				permasalahan.status,
				permasalahan.beku
			FROM permasalahan
			LEFT JOIN pengguna ON permasalahan.siapa = pengguna.id
			LEFT JOIN kategori ON permasalahan.kategori = kategori.id
			WHERE permasalahan.id='$id'
		")->result();

		$record['komentar'] = $this->model->rawQuery("
			SELECT
				komentar.id,
				komentar.teks,
				komentar.tanggal,
				pengguna.id AS id_komentator,
				pengguna.nama,
				pengguna.foto,
				komentar.solver,
				komentar.rating,
				komentar.parent
			FROM komentar
			LEFT JOIN pengguna ON komentar.siapa=pengguna.id
			WHERE komentar.permasalahan ='$id'
		")->result();

		$record['penjawab'] = $this->getPenjawab($id)['foto_nama'];
		$record['remaining_penjawab'] = $this->getPenjawab($id)['remaining_penjawab'];
		
		$header['title'] = 'Pendidik - Pertanyaan Detail';
		$this->menu['breadcrumb'] 	= 'Pertanyaan Saya';
		$this->menu['active'] 		= 'pertanyaanSaya';
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$this->menu);
		$this->load->view('tenagapendidik/pertanyaan-detail',$record);
		$this->load->view('statis/footer');
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
	* function untuk menampilkan halaman edit pertanyaan
	*/
	function editPertanyaan($id)
	{
		$record['pertanyaan'] = $this->model->read("permasalahan",array('id'=>$id));
		if ($record['pertanyaan']->num_rows() != 0) {
			$record['pertanyaan'] = $record['pertanyaan']->result();
			$record['kategori'] = $this->model->readS("kategori")->result();

			$header['title'] = "Pendidik | Pertanyaan Edit";
			$this->menu['breadcrumb'] = "Pertanyaan Edit";
			$this->menu['active'] = "pertanyaanSaya";
			$this->load->view("statis/header",$header);
			$this->load->view("tenagapendidik/menu",$this->menu);
			$this->load->view("tenagapendidik/pertanyaan-edit",$record);
			$this->load->view("statis/footer");
			
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Data tidak ditemukan</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk handle submit form pada halaman edit pertanyaan 
	*/
	function submitEditPertanyaan()
	{
		if ($this->input->post() !== array()) {
			$id 					= $this->input->post('id');
			$dataForm['teks'] 		= $this->input->post('pertanyaan');
			$dataForm['kategori'] 	= $this->input->post('kategori');
			$dataForm['tanggal'] 	= date("y-m-d H:i:s");

			$queryUpdate = $this->model->update('permasalahan',array('id'=>$id),$dataForm);
			$queryUpdate = json_decode($queryUpdate);
			if ($queryUpdate->status) {
				alert('pertanyaan','success','Barhasil!','Pertanyaan telah diperbarui');
				redirect('pertanyaan-pendidik');
			}else{
				alert('pertanyaan','danger','Gagal!','Pertanyaan gagal diperbarui');
				redirect('pertanyaan-edit/'.$id);
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function unutk menamplkan halaman dashboard
	*/
	function dashboard()
	{
		$this->load->view("statis/header");
		$this->load->view("pendidik/menu");
		$this->load->view("pendidik/dashboard");
		$this->load->view("statis/footer");
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
		$this->load->view("tenagapendidik/menu",$this->menu);
		$this->load->view("tenagapendidik/materi",$record);
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
		$this->load->view("tenagapendidik/menu",$this->menu);
		$this->load->view("tenagapendidik/materi-tambah",$record);
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
		$this->load->view("tenagapendidik/menu",$this->menu);
		$this->load->view("tenagapendidik/karir");
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
		$this->load->view("tenagapendidik/menu",$this->menu);
		$this->load->view("tenagapendidik/karir-tambah");
		$this->load->view("statis/footer");
	}

	/*
	* funtion untuk handle form tambah karir
	*/
	function insertkarir()
	{
		if ($this->input->post() !== array()) {
			$this->form_validation->set_rules('teks','Nama','trim|required');
			$this->form_validation->set_rules('kontak','Kontak','trim|required|numeric');
			$this->form_validation->set_rules('instansi','Instansi','trim|required');
			$this->form_validation->set_rules('lokasi','Lokasi','trim|required');
			if ($this->form_validation->run()==TRUE) {
				
				$newdata = array(
				        'nama'  					=> $this->input->post('teks'),
				        'kontak'     				=> $this->input->post('kontak'),
				        'instansi'     				=> $this->input->post('instansi'),
				        'lokasi'     				=> $this->input->post('lokasi'),
				        'valid'     				=> 'belum',
				        'tanggal'     				=> date('Y-m-d H:i:s')
				);
				$queryInsert = $this->model->create('lowongan',$newdata);
				$queryInsert = json_decode($queryInsert);
				if ($queryInsert->status) {
					alert('karir','success','Berhasil!',"Lowongan yang telah anda buat berhasil dibuat dan masih dalam proses konfirmasi oleh Admin");
					redirect('karir-pendidik');
				}else{
					alert('karir','danger','Gagal!',"Lowongan yang telah anda buat gagal dipublish. Eror : ".$queryInsert->error_message->message);
					redirect('karir-tambah-pendidik');
				}
			}else{
				$karir = validation_errors("<div class='alert alert-warning alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>",
	            	'</div>');
	            $this->session->set_flashdata('karir', $karir);
				redirect('karir-tambah-pendidik');
			}
		}
	}

	/*
	* funtion untuk submit rating sebuah komentar dipanggil di halaman detail-pertanyaan-pendidik
	*/
	function submitRating()
	{
		if ($this->input->post() !== array()) {
			$queryUpdate = $this->model->update("komentar",array('id'=>$this->input->post('id')),array('rating'=>$this->input->post('rating')));

			// berikan notifikasi pada specified pengguna. id_konteks adalah id_pertanyaan
			$id_komentator = $this->model->readCol('komentar',array('id'=>$this->input->post('id')),array('siapa'))->result();
			$this->model->create('notif',array('konteks'=>'ratingKomentar','id_konteks'=>$this->input->post('id_'),'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>$id_komentator[0]->siapa,'datetime'=>date('Y-m-d H:i:s')));
			echo $queryUpdate;
			return true;
		}else{
			echo json_encode("error");
			return true;
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
	* funtion untuk menampilkan icon angka pada icon amplop
	*/
	function notifikasiMenu()
	{
		/*// cek max notif id, jika max_notif_id_per_user kurang dari max id tabel notif di db (ada notif baru), maka cek lanjutan (apakah itu untuk saya)
		$maxIdDb_ = $this->model->read("max_notif_id_per_user",array('id_pengguna'=>$this->session->userdata('loginSession')['id']))->result();

		// cek lagi adakah di tabel notif where id > $maxiddb_ and untuk saya, jika ada maka eksekusi hitung notif
		$notifBaruDanUntukSaya = $this->model->rawQuery("SELECT * FROM notif WHERE id > ".$maxIdDb_[0]->max_notif_id." AND (untuk='".$this->session->userdata('loginSession')['id']."' OR untuk='mahasiswa')");
		if ($notifBaruDanUntukSaya->num_rows() > 0) {

		}*/


		// baca notif untuk para mahasiswa dan dia seorang
		$notif_pendidik = $this->model->rawQuery("
			SELECT  
					notif.id,
					notif.konteks,
					notif.id_konteks,
					pengguna.nama AS dari, 
					notif.untuk,
					notif.datetime 
			FROM notif 
			LEFT JOIN pengguna ON pengguna.id = notif.dari
			WHERE 
					untuk='semua' 
			OR 
					untuk='pendidik' 
			OR 
					untuk='".$this->session->userdata('loginSession')['id']."'
			ORDER BY datetime DESC
		");


		if ($notif_pendidik->num_rows() != 0) {
			$notif_pendidik = $notif_pendidik->result();
			
			// baca notif yang untuk para mahasiswa yang sudah terlihat untuk dikoreksi dengan notifikasi untuk para mahasiswa
			$notif_pendidik_terlihat = $this->model->rawQuery("SELECT id_notif FROM notif_flag WHERE terlihat = '1' AND id_pengguna='".$this->session->userdata('loginSession')['id']."' ")->result_array();

			// array matang untuk dikirim ke menu
			$notif_ = array();

			// berlaku untuk notif mahasiswa atau notif untuk saya
			foreach ($notif_pendidik as $key => $value) {
				$notif_[$key] = $value;
				if ($this->in_array_r($value->id,$notif_pendidik_terlihat)) {
					$notif_[$key]->terlihat = 'sudah';
				}else{
					$notif_[$key]->terlihat = 'belum';
					array_push($this->menu['belum_dilihat'], $value->id);
				}
			}

			// insert max notif id per user
			$runQuery = $this->model->rawQuery("UPDATE max_notif_id_per_user SET max_notif_id =".$notif_pendidik[0]->id." WHERE id_pengguna='".$this->session->userdata('loginSession')['id']."'");
			// var_dump($runQuery);die();

			unset($notif_pendidik);unset($notif_pendidik_terlihat);unset($notif_pendidik_terbaca);

			// array noti_ siap dikirim ke menu. dilimit 7 via array slice. masih dipertanyakan kenapa kok nggk lewat limit DB
			// dilimit 7 via array slice karena output slice hanya untuk  ditampilkan sedangkan untuk menghitung angka badge harus dihitung keseluruhan, jadi baca db keseluruhan
			$this->menu['notif'] = array_slice($notif_, 0, 7);
		}
	}

	/*
	* funtion untuk update notifikasi ke terlihat
	* insert batch ke tabel notif_per_user untuk memasukkan bahwa specified user sudah lihat notif atau belum
	*/
	function setTerlihat()
	{
		if ($this->input->post() !== array()) {
			if ($this->menu['belum_dilihat'] !== array()) {
				$updateToNotifMhsPerUser 	= "INSERT INTO notif_flag VALUES ";
				foreach ($this->menu['belum_dilihat'] as $key => $value) {
					$updateToNotifMhsPerUser.= "(NULL,'".$this->session->userdata('loginSession')['id']."','".$value."','1','0'),";
				}
				$idToUpdate =  rtrim($idToUpdate,", ");				
				$updateToNotifMhsPerUser =  rtrim($updateToNotifMhsPerUser,", ");
				$runQuery = $this->model->rawQuery($updateToNotifMhsPerUser);
			}
		}
	}
}