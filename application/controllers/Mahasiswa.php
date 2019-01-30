<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
		if ($this->session->userdata('loginSession')['aktor'] !== 'mahasiswa') {
			alert('login','warning','Peringatan!',"Anda harus login terlebih dahulu. Atau daftar <a href='".base_url()."register'>disini</a> jika belum memiliki akun");
			redirect('login');
		}
		// set array koasong untuk simpan notif2
		$this->menu['notif_non_dm'] = array();
		$this->menu['notif_dm'] = array();
		$this->menu['belum_dilihat_non_dm'] = array();
		$this->menu['belum_dilihat_dm'] = [];
		$this->notifikasiMenuNonDm();
		$this->notifikasiMenuDm();
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
		$record['lowongan'] = $this->model->read('lowongan',array('valid'=>'1'))->result();
		$record['materi'] = $this->model->rawQuery('
			SELECT
			materi.nama AS nama_materi,
			materi.jumlah_diunduh,
			pengguna.nama AS nama_pengguna
			FROM materi
			LEFT JOIN pengguna ON materi.siapa_terakhir_edit = pengguna.id
			')->result();
		$record['pengguna'] = $this->model->read('pengguna',array('id'=>$this->session->userdata('loginSession')['id']))->result();

		$this->load->view("statis/header",$header);
		$this->load->view("mahasiswa/menu",$this->menu);
		$this->load->view("mahasiswa/dashboard",$record);
		$this->load->view("statis/footer");
	}

	/*
	* function untuk handle ajax request untuk onclick pilih kategori. function ini dipanggil di halaman dashboard.
	*/
	function getPermasalahanByKategoriAndStatus()
	{
		if ($this->input->get() !== '') {
			$string = "SELECT permasalahan.id, permasalahan.teks, permasalahan.tanggal, pengguna.nama AS nama_pengguna, permasalahan.jumlah_komen, permasalahan.jumlah_dilihat, permasalahan.kategori, kategori.nama AS nama_kategori, permasalahan.status, permasalahan.beku, pengguna.foto FROM permasalahan LEFT JOIN pengguna ON permasalahan.siapa = pengguna.id LEFT JOIN kategori ON permasalahan.kategori = kategori.id ";
			if ($this->input->get('kategori') == "all" && $this->input->get('status') == "Semua Pertanyaan") {
				$string.= '';				
			}elseif ($this->input->get('status') == "Semua Pertanyaan"){
				$string .= " WHERE permasalahan.kategori = '".$this->input->get('kategori')."' ";
			}else{
				if ($this->input->get('kategori') == 'all') {
					$string .= " WHERE permasalahan.status = '".$this->input->get('status')."' ";
				}else{
					$string .= " WHERE permasalahan.kategori = '".$this->input->get('kategori')."' AND permasalahan.status = '".$this->input->get('status')."' ";
					
				}
			}
			$string .= "ORDER BY permasalahan.tanggal ";
			$record['permasalahan'] = $this->model->rawQuery($string)->result();
			foreach ($record['permasalahan'] as $key => $value) {
				$record['permasalahan'][$key]->komentator = $this->getPenjawab($value->id)['foto_nama'];
				$record['permasalahan'][$key]->remaining_penjawab = $this->getPenjawab($value->id)['remaining_penjawab'];
			}
			$record['data'] = $this->input->get();
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

		$header['title'] 			= 'Mahasiswa - Pesan';
		$this->menu['breadcrumb'] 	= 'Pesan';
		$this->menu['active'] 		= 'pesan';
		$record = array();
		$this->load->view('statis/header',$header);
		$this->load->view('mahasiswa/menu',$this->menu);
		
		// delete dm yang terinit namun tidak terbalas (yang tidak jadi dm)
		$this->deleteInitializedDm();

		
		/*
			apakah bikin chat baru atau tidak. kalau ya, open new chat room dialog, kalau tidak, tampilkan 'tidak ada pesan yang dipilih'
			DATA YANG DI POST 
			id_komentator
			id_permasalahan
			id_komentar
		*/
			if ($this->input->post() !== array() OR $this->session->flashdata("id_komentator") !== NULL) {

			// dibagian if adalah untuk redirect setelah submitReply, yang bagian else untuk yang dari klik sebuah chat dengan mahasiswa.  bagian if menggunakan flashdata karena kesulitan post sambil redirect
				if ($this->input->post('id_komentator') == array()) {
					$id_komentator = $this->session->flashdata("id_komentator")['id_komentator'];
				}else{
					$id_komentator = $this->input->post('id_komentator');
				}
				
			// jika dari tombol kirim pesan pada halaman pertanyaan detail (inisialisasi dm / mau melakukan dm terkait komentar seorang mahasaiswa)
				if ($this->input->post('id_permasalahan') !== NULL AND $this->input->post('id_komentar') !== NULL) {

				// cek apakah direct message dgn tipe permasalahan sudah d inisialisasi. untuk mecegah double inisialisasi
					$bacaDirectMessage = $this->model->read('direct_message',array('dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>$id_komentator,'permasalahan'=>$this->input->post('id_permasalahan'),'komentar'=>$this->input->post('id_komentar'),'jenis_pesan'=>'permasalahan'));
					
					$record['permasalahan'] 	= $this->model->readCol("permasalahan",array('id'=>$this->input->post('id_permasalahan')),array('id','teks','tanggal','status'))->result();
					$record['komentar'] 		= $this->model->readCol("komentar",array('id'=>$this->input->post('id_komentar')),array('id','teks','tanggal','rating'))->result();
					if ($bacaDirectMessage->num_rows() == 0) {
						
					// insert ke dm sebuah pertanyaan
						$this->model->create('direct_message',array('teks'=>$record['permasalahan'][0]->teks,'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>$id_komentator,'permasalahan'=>$this->input->post('id_permasalahan'),'komentar'=>$this->input->post('id_komentar'),'tanggal'=>date("Y-m-d H:i:s"),'jenis_pesan'=>'permasalahan','terpecahkan'=>$record['permasalahan'][0]->status));

					// insert ke dm sebuah komentar permasalahan. jika permasalhan telah berstatus solved, maka hilangkan panel tanya permasalahan terpecahkan dengan mengisi kolom solver = bukan
						if ($record['permasalahan'][0]->status == 'SOLVED') {
							$this->model->create('direct_message',
								array(
									'teks'			=>$record['komentar'][0]->teks,
									'dari'			=>$id_komentator,
									'untuk'			=>$this->session->userdata('loginSession')['id'],
									'permasalahan'	=>$this->input->post('id_permasalahan'),
									'komentar'		=>$this->input->post('id_komentar'),
									'tanggal'		=>date("Y-m-d H:i:s"),
									'jenis_pesan'	=>'komentarpermasalahan',
									'rating'		=>$record['komentar'][0]->rating,
									'solver'		=>'bukan'
								)
							);
						}elseif ($record['permasalahan'][0]->status == 'UNSOLVED') {
							$this->model->create('direct_message',
								array(
									'teks'			=>$record['komentar'][0]->teks,
									'dari'			=>$id_komentator,
									'untuk'			=>$this->session->userdata('loginSession')['id'],
									'permasalahan'	=>$this->input->post('id_permasalahan'),
									'komentar'		=>$this->input->post('id_komentar'),
									'tanggal'		=>date("Y-m-d H:i:s"),
									'jenis_pesan'	=>'komentarpermasalahan',
									'rating'		=>$record['komentar'][0]->rating
								)
							);
						}
					}
				}
				$record['komentator'] 	= $this->model->readCol('pengguna',array('id'=>$id_komentator),array('id','nama','email','foto','poin','aktor'))->result();
				
			// data chat mentah yang belum diolah. (di group berdsarkan tanggal)
				$chat = $this->model->rawQuery("SELECT * FROM direct_message WHERE (dari = '".$this->session->userdata('loginSession')['id']."' OR untuk = '".$this->session->userdata('loginSession')['id']."') AND (dari = '".$id_komentator."' OR untuk = '".$id_komentator."')")->result();
				
				$record['chat'] = array();

			// $temp_flag untuk track posisi komentar mahasiswa yang terakhir
				$temp_flag = 0;

			// pemisahan chat setiap tanggal
				foreach ($chat as $key => $value) {
					
				// $temp digunakan untuk membuat indeks pada array
					$temp_indeks = substr($value->tanggal, 0, 10);

				// lupa
					if (!isset($record['chat'][$temp_indeks])) {
						$record['chat'][$temp_indeks] = array();
					}

				// push ke record untuk dikirim ke halaman pesan
					array_push($record['chat'][$temp_indeks], $chat[$key]);

				// set pesan yang belum dibaca ke sudah dibaca
					$update = $this->model->rawQuery("
						UPDATE 
						direct_message 
						SET is_open = 'sudah' 
						WHERE 
						untuk='".$this->session->userdata('loginSession')['id']."' AND dari='".$id_komentator."'"
					);
				}
				$this->model->rawQuery("UPDATE notif SET terbaca = 'sudah' WHERE konteks ='dm' AND (dari='".$this->input->post('id_komentator')."' AND untuk='".$this->session->userdata('loginSession')['id']."')");

			// get daftar mahasiswa yang telah dicahat
				$record['to']	=  $this->getInitializedDm();
				
			// echo "<pre>";
			// var_dump($record);
			// // var_dump($this->input->post());
			// echo "</pre>";

			// jika asalnya dari redirect setelah pertanyaan permaslaahan terpocahkan? maka set suah alert
				if (isset($this->session->flashdata("id_komentator")['permasalahan_terpecahkan']) AND $this->session->flashdata("id_komentator")['permasalahan_terpecahkan'] == 1) {
					alert('alert','success','Barhasil!','Status permasalahan telah diubah menjadi SOLVED!');
				}elseif(isset($this->session->flashdata("id_komentator")['permasalahan_terpecahkan']) AND $this->session->flashdata("id_komentator")['permasalahan_terpecahkan'] == 0){
					alert('alert','success','Terimakasih!','Feedback anda telah tersimpan');
				}

				$this->load->view('mahasiswa/pesan-detail',$record);
			}else{
				
			// get daftar mahasiswa yang telah dicahat
				$record['to']	=  $this->getInitializedDm();

				$this->load->view('mahasiswa/pesan',$record);
			}
			$this->load->view('statis/footer');
		}


	/*
	* untuk ambil siapa saja yang sudah dichat
	*/
	function getInitializedDm()
	{
		return $this->model->rawQuery("
			SELECT DISTINCT dari AS fr,
			(
			SELECT teks FROM direct_message
			WHERE id = 
			( 
			SELECT MAX(id)
			FROM direct_message 
			WHERE 
			(dari = ".$this->session->userdata('loginSession')['id']." AND untuk = fr) OR (dari = fr AND untuk = ".$this->session->userdata('loginSession')['id'].")
			)
			) AS teks,
			(
			SELECT MAX(tanggal) FROM direct_message
			WHERE (dari = fr AND untuk = ".$this->session->userdata('loginSession')['id'].") OR (dari=".$this->session->userdata('loginSession')['id']." AND untuk = fr)
			) AS tanggal,
			(
			SELECT COUNT(id) FROM direct_message
			WHERE is_open IS NULL 
			AND (dari = fr AND untuk = ".$this->session->userdata('loginSession')['id'].")
			) AS belum_dibaca,
			pengguna.id,
			pengguna.alias,
			pengguna.aktor,
			pengguna.foto
			FROM 
			direct_message
			LEFT JOIN pengguna ON direct_message.dari = pengguna.id
			WHERE untuk = ".$this->session->userdata('loginSession')['id']."
			ORDER BY tanggal DESC
			")->result();
	}


	/*
	* function untuk menangai post request di halaman pesan detail saat seorang user akan berpindah halaman
	*/
	function deleteInitializedDm()
	{
		return $this->model->rawQuery("
			DELETE FROM direct_message 
			WHERE 
			(jenis_pesan='permasalahan' OR jenis_pesan='komentarpermasalahan') 
			AND 
			(dari='".$this->session->userdata('loginSession')['id']."' OR untuk='".$this->session->userdata('loginSession')['id']."') AND dibalas IS NULL"
		);
	}

	/*
	* function untuk handle submit form pada halaman edit pertanyaan 
	*/
	function submitReply()
	{
		if ($this->input->post() !== array()) {
			$dataForm['teks'] 			= $this->input->post('message');
			$dataForm['dari'] 			= $this->session->userdata('loginSession')['id'];
			$dataForm['untuk'] 			= $this->input->post('untuk');
			
			if ($this->input->post('permasalahan') !== '' AND $this->input->post('komentar') !== '') {
				$dataForm['permasalahan'] 	= $this->input->post('permasalahan');
				$dataForm['komentar'] 		= $this->input->post('komentar');
			}
			
			$dataForm['jenis_pesan'] 	= "komentardm";
			$dataForm['tanggal'] 		= date("y-m-d H:i:s");

			$queryInsert = $this->model->create_id('direct_message',$dataForm);
			$this->model->rawQuery("UPDATE direct_message SET dibalas='sudah' WHERE (jenis_pesan = 'permasalahan' OR jenis_pesan = 'komentarpermasalahan') AND permasalahan = '$dataForm[permasalahan]' AND komentar = '$dataForm[komentar]'");
			$queryInsert = json_decode($queryInsert);
			if ($queryInsert->status) {
				$data = array('id_komentator'=>$this->input->post('untuk'));
				$this->session->set_flashdata('id_komentator',$data);

				// create notification kalau ada dm baru untuk seorang pengguna
				$this->model->create('notif',array('konteks'=>'dm','id_konteks'=>$queryInsert->message,'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>$this->input->post('untuk'),'datetime'=>date('Y-m-d H:i:s')));

				alert('alert','success','Barhasil!','Direct message berhasil dikirim');
				redirect('pesan-mahasiswa');
			}else{
				alert('alert','danger','Gagal!','Direct message gagal dikirim');
				redirect('pesan-mahasiswa');
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk menampilkan profil
	*/
	function profil(){
		$header['title'] = "Mahasiswa - Profil";
		$this->menu['breadcrumb'] = "Profil";
		$this->menu['active'] = "";
		$record['pengguna'] = $this->model->read('pengguna',array('id'=>$this->session->userdata('loginSession')['id']))->result();
		$record['komentar'] = $this->model->rawQuery('
			SELECT
			komentar.teks AS teks_komentar,
			komentar.tanggal,
			komentar.rating,
			permasalahan.teks AS teks_permasalahan,
			pengguna.nama,
			pengguna.foto
			FROM komentar
			LEFT JOIN permasalahan ON komentar.permasalahan = permasalahan.id
			LEFT JOIN pengguna ON permasalahan.siapa = pengguna.id
			WHERE komentar.siapa = "'.$this->session->userdata('loginSession')['id'].'"
			')->result();
		$record['dm'] = array(
			'dm_solved' => $this->model->rawQuery("SELECT COUNT(id) AS jumlah FROM direct_message WHERE jenis_pesan = 'permasalahan_solved' AND untuk = '".$this->session->userdata('loginSession')['id']."' ")->result_array(),
			'dm'		=> $this->model->rawQuery("SELECT COUNT(id) AS jumlah FROM direct_message WHERE dari = '".$this->session->userdata('loginSession')['id']."'")->result_array()
		);
		$this->load->view('statis/header',$header);
		$this->load->view('mahasiswa/menu',$this->menu);
		$this->load->view('mahasiswa/profil',$record);
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
			$recordPengguna = $this->model->read('pengguna',array('id'=>$this->input->post('id')))->result();
			if ($this->input->post('password') !== '') {
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
						$queryUpdate['password'] = md5($this->input->post('password_'));
					}
				}
			}
			
			// cek apakah ada perintah update foto
			if ($_FILES['foto']['name'] !== '') {
				$config['upload_path']	= FCPATH.'userprofiles/';
				$config['allowed_types']= 'gif|jpg|png|jpeg|JPG|PNG|GIF|JPEG';
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
					unlink(FCPATH.$recordPengguna[0]->foto);
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
					if ($queryUpdate['password'] != array()) {
						redirect('logout');
					}
					$recordPengguna = $this->model->read('pengguna',array('id'=>$this->input->post('id')))->result();
					$newdata = array(
						'id'     					=> $recordPengguna[0]->id,
						'nama'  					=> $recordPengguna[0]->nama,
						'email'     				=> $recordPengguna[0]->email,
						'no_hp'     				=> $recordPengguna[0]->no_hp,
						'aktor'     				=> $recordPengguna[0]->aktor,
						'institusi_or_universitas'  => $recordPengguna[0]->institusi_or_universitas,
						'nip_or_nim'  				=> $recordPengguna[0]->nip_or_nim,
						'status'  					=> $recordPengguna[0]->status,
						'foto'						=> base_url().$recordPengguna[0]->foto
					);
					$this->session->set_userdata('loginSession',$newdata);

					alert('editProfil','success','Barhasil!','Profil telah di perbarui di database.');
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
	* funtion untuk menampilkan icon angka pada icon lonceng
	*/
	function notifikasiMenuNonDm()
	{
		// baca notif untuk para mahasiswa dan dia seorang
		$notif_mahasiswa = $this->model->rawQuery("
			SELECT  
			notif.id,
			notif.konteks,
			notif.id_konteks,
			pengguna.nama AS dari, 
			pengguna.foto, 
			notif.untuk,
			notif.datetime 
			FROM notif 
			LEFT JOIN pengguna ON pengguna.id = notif.dari
			WHERE 
			(untuk = 'semua' AND dari != ".$this->session->userdata('loginSession')['id'].")
			OR 
			untuk = 'mahasiswa' 
			OR 
			untuk = '".$this->session->userdata('loginSession')['id']."'
			AND
			konteks != 'dm'
			ORDER BY datetime DESC
			");


		if ($notif_mahasiswa->num_rows() != 0) {
			$notif_mahasiswa = $notif_mahasiswa->result();
			
			// baca notif yang untuk para mahasiswa yang sudah terlihat untuk dikoreksi dengan notifikasi untuk para mahasiswa
			$notif_mahasiswa_terlihat = $this->model->rawQuery("SELECT id_notif FROM notif_flag WHERE terlihat = '1' AND id_pengguna='".$this->session->userdata('loginSession')['id']."' ")->result_array();

			// array matang untuk dikirim ke menu
			$notif_ = array();

			// berlaku untuk notif mahasiswa atau notif untuk saya
			foreach ($notif_mahasiswa as $key => $value) {
				$notif_[$key] = $value;
				if ($this->in_array_r($value->id,$notif_mahasiswa_terlihat)) {
					$notif_[$key]->terlihat = 'sudah';
				}else{
					$notif_[$key]->terlihat = 'belum';
					array_push($this->menu['belum_dilihat_non_dm'], $value->id);
				}
			}

			// insert max notif id per user
			$runQuery = $this->model->rawQuery("UPDATE max_notif_id_per_user SET max_notif_id =".$notif_mahasiswa[0]->id." WHERE id_pengguna='".$this->session->userdata('loginSession')['id']."'");
			// var_dump($runQuery);die();

			unset($notif_mahasiswa);unset($notif_mahasiswa_terlihat);unset($notif_mahasiswa_terbaca);

			// array noti_ siap dikirim ke menu. dilimit 7 via array slice. masih dipertanyakan kenapa kok nggk lewat limit DB
			// dilimit 7 via array slice karena output slice hanya untuk  ditampilkan sedangkan untuk menghitung angka badge harus dihitung keseluruhan, jadi baca db keseluruhan
			$this->menu['notif_non_dm'] = array_slice($notif_, 0, 7);
		}
	}

	/*
	* funtion untuk menampilkan icon angka pada icon lonceng
	*/
	function notifikasiMenuDm()
	{
		// baca notif untuk para mahasiswa dan dia seorang
		$notif_mahasiswa = $this->model->rawQuery("
			SELECT  
			notif.id,
			notif.konteks,
			notif.id_konteks,
			pengguna.id AS id_dari, 
			pengguna.foto, 
			pengguna.nama AS dari, 
			notif.untuk,
			MAX(notif.datetime)as datetime,
			(SELECT GROUP_CONCAT(notif.id SEPARATOR ',') FROM notif WHERE konteks = 'dm' AND untuk = '".$this->session->userdata('loginSession')['id']."' AND dari = pengguna.id AND terbaca IS NULL) AS jumlah
			FROM notif 
			LEFT JOIN pengguna ON pengguna.id = notif.dari
			WHERE 
			(untuk = '".$this->session->userdata('loginSession')['id']."' OR untuk = 'mahasiswa')
			AND
			(konteks = 'dm' OR konteks = 'pesaninfo')
			AND 
			terbaca IS NULL
			GROUP BY dari
			ORDER BY datetime DESC;
			");


		if ($notif_mahasiswa->num_rows() != 0) {
			$notif_mahasiswa = $notif_mahasiswa->result();
			
			// baca notif yang untuk para mahasiswa yang sudah terlihat untuk dikoreksi dengan notifikasi untuk para mahasiswa
			$notif_mahasiswa_terlihat = $this->model->rawQuery("SELECT id_notif FROM notif_flag WHERE terlihat = '1' AND id_pengguna='".$this->session->userdata('loginSession')['id']."' ")->result_array();

			// array matang untuk dikirim ke menu
			$notif_ = array();

			// berlaku untuk notif mahasiswa atau notif untuk saya
			$belum_dilihat_dm = array();
			foreach ($notif_mahasiswa as $key => $value) {
				$notif_[$key] = $value;
				$value->jumlah = explode(",", $value->jumlah);
				if ($this->in_array_r($value->id,$notif_mahasiswa_terlihat)) {

				}else{
					foreach ($value->jumlah as $keyA => $valueA) {
						array_push($belum_dilihat_dm, $valueA);
					}
					// $this->menu['belum_dilihat_dm'] = $value->jumlah;
				}
			}
			$this->menu['belum_dilihat_dm'] = $belum_dilihat_dm;

			// insert max notif id per user
			$runQuery = $this->model->rawQuery("UPDATE max_notif_id_per_user SET max_notif_id =".$notif_mahasiswa[0]->id." WHERE id_pengguna='".$this->session->userdata('loginSession')['id']."'");
			// var_dump($runQuery);die();

			unset($notif_mahasiswa);unset($notif_mahasiswa_terlihat);unset($notif_mahasiswa_terbaca);

			// array noti_ siap dikirim ke menu. dilimit 7 via array slice. masih dipertanyakan kenapa kok nggk lewat limit DB
			// dilimit 7 via array slice karena output slice hanya untuk  ditampilkan sedangkan untuk menghitung angka badge harus dihitung keseluruhan, jadi baca db keseluruhan
			$this->menu['notif_dm'] = array_slice($notif_, 0, 7);
		}
	}

	/*
	* funtion untuk update notifikasi non DM ke terlihat
	* insert batch ke tabel notif_per_user untuk memasukkan bahwa specified user sudah lihat notif atau belum
	*/
	function setTerlihatNonDm()
	{
		if ($this->input->post() !== array()) {
			$updateToNotifMhsPerUser 	= "INSERT INTO notif_flag VALUES ";
			foreach ($this->menu['belum_dilihat_non_dm'] as $key => $value) {
				$updateToNotifMhsPerUser.= "(NULL,'".$this->session->userdata('loginSession')['id']."','".$value."','1','0'),";
			}
			$updateToNotifMhsPerUser =  rtrim($updateToNotifMhsPerUser,", ");
			$runQuery = $this->model->rawQuery($updateToNotifMhsPerUser);
		}
	}

	/*
	* funtion untuk update notifikasi dm ke terlihat
	* insert batch ke tabel notif_per_user untuk memasukkan bahwa specified user sudah lihat notif atau belum
	*/
	function setTerlihatDm()
	{
		if ($this->input->post() !== array()) {
			if ($this->menu['belum_dilihat_dm'] !== array()) {
				$updateToNotifMhsPerUser 	= "INSERT INTO notif_flag VALUES ";
				foreach ($this->menu['belum_dilihat_dm'] as $key => $value) {
					$updateToNotifMhsPerUser.= "(NULL,'".$this->session->userdata('loginSession')['id']."','".$value."','1','0'),";
				}
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
				komentar.rating,
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
				$cariPertanyaan 				= $cariPertanyaan->result();
				$recordInsert['teks'] 			= $this->input->post('jawaban');
				$recordInsert['tanggal'] 		= date('Y-m-d H:i:s');
				$recordInsert['siapa'] 			= $this->session->userdata('loginSession')['id'];
				$recordInsert['permasalahan'] 	= $this->input->post('id');
				$recordInsert['kategori_permasalahan'] = $cariPertanyaan[0]->id;

				$queryInsert = $this->model->create("komentar",$recordInsert);
				$queryInsert = json_decode($queryInsert);
				if ($queryInsert->status) {
					alert('jawab','success','Berhasil!','Jawaban anda telah dipublish');

					// id_konteks adalah id permasalahan
					$this->model->create('notif',array('konteks'=>'komentar','id_konteks'=>$this->input->post('id'),'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>$this->input->post('pendidik'),'datetime'=>date('Y-m-d H:i:s')));
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
		$header['title'] = "Mahasiswa - Materi";
		$this->menu['breadcrumb'] = "Materi";
		$this->menu['active'] = "materi";
		$record['kategori'] = $this->model->readSCol("kategori",array('id','nama'))->result();
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
		$header['title'] = "Mahasiswa - Materi Tambah";
		$this->menu['breadcrumb'] = "Materi";
		$this->menu['active'] = "materi";
		$record['kategori'] = $this->model->readS("kategori")->result();

		$this->load->view("statis/header",$header);
		$this->load->view("mahasiswa/menu",$this->menu);
		$this->load->view("mahasiswa/materi-tambah",$record);
		$this->load->view("statis/footer");
	}

	/*
	* function untuk menangani add materi pada halaman kelola materi
	*/
	function insertMateri()
	{
		if ($this->input->post() !== null) {
			$queryMateri['nama'] 				= ucwords($this->input->post('nama'));
			$queryMateri['kategori'] 			= $this->input->post('kategori');
			$tags 			 					= $this->input->post('tags');
			$tags 								= explode(",", $tags);
			$queryMateri['deskripsi'] 			= $this->input->post('deskripsi');
			$queryMateri['waktu_terakhir_edit'] = date('Y-m-d H:i:s');
			$queryMateri['siapa_terakhir_edit'] = $this->session->userdata('loginSession')['id'];
			$queryMateri['jumlah_diunduh'] 		= 0;
			$queryMateri['jumlah_dilihat'] 		= 0;
			$queryMateri['ikon_logo'] 			= "fa-flask";
			$queryMateri['ikon_warna'] 			= "materi-blue";
			
			$queryInsertMateri = $this->model->create_id('materi',$queryMateri);
			$queryInsertMateri = json_decode($queryInsertMateri);


			// if (TRUE) {
			if ($queryInsertMateri->status) {
				// baca destinasi penyimpanan yang sudah terdefinisi di tabel kategori
				$direktori = $this->model->read('kategori',array('id'=>$queryMateri['kategori']))->result();
				
				$config['upload_path']          = FCPATH.$direktori[0]->nama_folder.'/';
				$config['allowed_types']        = 'docx|doc|xls|pdf|xlsx';

				$this->load->library('upload', $config);
				$filesCount = count($_FILES['files']['name']);
				

				
				// upload dan masnipulais string
				for ($i= 0; $i < $filesCount; $i++) { 
					$_FILES['file']['name']     = $_FILES['files']['name'][$i];
					$_FILES['file']['type']     = $_FILES['files']['type'][$i];
					$_FILES['file']['tmp_name'] = $_FILES['files']['tmp_name'][$i];
					$_FILES['file']['error']     = $_FILES['files']['error'][$i];
					$_FILES['file']['size']     = $_FILES['files']['size'][$i];
					
					if( ! $this->upload->do_upload('file')){
						echo $this->upload->display_errors();
						echo "string";
						die();
					}else{
						$this->zip->read_file(FCPATH.$direktori[0]->nama_folder.'/'.$this->upload->data('file_name')); 
						
						unlink(FCPATH.$direktori[0]->nama_folder.'/'.$this->upload->data('file_name'));
					}
				}

				// manipulasi string insert batch ke tabel tags, untuk menyimpan tag yang tertau pada setiap materi
				$queryTags = 'INSERT INTO tags VALUES ';
				foreach ($tags as $key => $value) {
					$queryTags .= "(NULL,'".$queryInsertMateri->message."','".$value."'),";
				}

				$queryTags =  rtrim($queryTags,", ");

				
				// insert batch
				$this->model->rawQuery($queryTags);

				// proses zipping
				$this->zip->archive(FCPATH.$direktori[0]->nama_folder.'/'.date('Ymd_His').'.zip');
			}

			// insert alamat direktori dari file attachment ke db
			$queryAttachment = "INSERT INTO attachment VALUES (NULL,'".$queryInsertMateri->message."','".$direktori[0]->nama_folder."/".date('Ymd_His').".zip')";
			$this->model->rawQuery($queryAttachment);

			// create notif to all user include admin
			$this->model->create('notif',array('konteks'=>'materiBaru','id_konteks'=>$queryInsertMateri->message,'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>'semua','datetime'=>date("Y-m-d H:i:s")));
			
			alert('alert','success','Berhasil!','Materi telah ditambahkan');
			redirect('materi-mahasiswa');
		}else{
			alert('alert','danger','Gagal!','Materi gagal ditambahkan');
			redirect('materi-mahasiswa');
		}
	}

	/*
	* function untuk menampilkan halaman karir
	*/
	function karir()
	{
		$header['title'] = "Mahasiswa - Karir";
		$this->menu['breadcrumb'] = "Karir";
		$this->menu['active'] = "karir";
		$record['lowongan'] = $this->model->rawQuery("SELECT lowongan.nama,lokasi.lokasi,lowongan.kontak,lowongan.instansi FROM lowongan LEFT JOIN lokasi ON lowongan.lokasi = lokasi.id ORDER BY tanggal DESC")->result();

		$this->load->view("statis/header",$header);
		$this->load->view("mahasiswa/menu",$this->menu);
		$this->load->view("mahasiswa/karir",$record);
		$this->load->view("statis/footer");
	}

	/*
	* function untuk menampilkan halaman tambah karir
	*/
	function tambahKarir()
	{
		$header['title'] = "Mahasiswa - Karir Tambah";
		$this->menu['breadcrumb'] = "Karir";
		$this->menu['active'] = "karir";

		$this->load->view("statis/header",$header);
		$this->load->view("mahasiswa/menu",$this->menu);
		$this->load->view("mahasiswa/karir-tambah");
		$this->load->view("statis/footer");
	}

	/*
	* funtion untuk handle form tambah karir
	*/
	function InsertKarir()
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
					'dari'     					=> $this->session->userdata('loginSession')['id'],
					'valid'     				=> 0,
					'tanggal'     				=> date('Y-m-d H:i:s')
				);
				$queryInsert = $this->model->create_id('lowongan',$newdata);
				$queryInsert = json_decode($queryInsert);
				if ($queryInsert->status) {
					$this->model->create('notif',array('konteks'=>'lowongan','id_konteks'=>$queryInsert->message,'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>'admin','datetime'=>date('Y-m-d H:i:s')));
					alert('karir','success','Berhasil!',"Lowongan yang telah anda buat berhasil dibuat dan masih dalam proses konfirmasi oleh Admin");
					redirect('karir-mahasiswa');
				}else{
					alert('karir','danger','Gagal!',"Lowongan yang telah anda buat gagal dipublish. Eror : ".$queryInsert->error_message->message);
					redirect('karir-tambah-mahasiswa');
				}
			}else{
				$karir = validation_errors("<div class='alert alert-warning alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>",
					'</div>');
				$this->session->set_flashdata('karir', $karir);
				redirect('karir-tambah-mahasiswa');
			}
		}
	}

	/*
	* funtion untuk handle download
	* id adalah idnya materi
	*/
	function downloadMateri($id){
		$this->load->helper('download');
		
		$materi = $this->model->read('materi',array('id'=>$id))->result();
		$attachment = $this->model->read('attachment',array('id_materi'=>$id))->result();
		
		$data = file_get_contents(FCPATH.$attachment[0]->url_attachment);
		
		// update harus diatas force. karena force langsung die melalui return (sepertinya). 
		$this->model->rawQuery("UPDATE materi SET jumlah_diunduh = jumlah_diunduh + 1 WHERE id = '".$id."'");
		
		force_download($materi[0]->nama.".zip", $data);
	}

	
	function getKategori()
	{
		$record = $this->model->readSCol("kategori",array('id','nama'))->result();
		echo json_encode($record);
	}
	/*
	* function untuk handle ajax request untuk onclick pilih kategori. function ini dipanggil di halaman dashboard.
	*/
	function getMateriByKategori()
	{
		if ($this->input->get() !== '') {
			$string = "SELECT materi.id,materi.nama,materi.waktu_terakhir_edit,materi.jumlah_diunduh,materi.jumlah_dilihat,materi.ikon_logo,materi.ikon_warna,materi.deskripsi,kategori.nama AS kategori,(SELECT GROUP_CONCAT(tag) FROM tags WHERE tags.id_materi = materi.id) AS tags FROM materi LEFT JOIN kategori ON kategori.id = materi.kategori ";

			if ($this->input->get('kategori_materi') !== 0 || $this->input->get('harian_bulanan') !== NULL || $this->input->get('popular_all') !== NULL) {
				$string .= " WHERE ";
			}
			
			$next = false;
			if ($this->input->get('kategori_materi') !== '0') {
				$string .= " materi.kategori = '".$this->input->get('kategori_materi')."' ";
				$next = true;
			}

			$date = new DateTime(date("Y-m-d"));
			if ($this->input->get('harian_bulanan') == 'harian') {
				if ($next) {
					$string .= "AND";
				}
				$string .= " DAY(materi.waktu_terakhir_edit) = '".$date->format("d")."' AND MONTH(materi.waktu_terakhir_edit) = '".$date->format("m")."' AND YEAR(materi.waktu_terakhir_edit) = '".$date->format("Y")."'";
			}elseif ($this->input->get('harian_bulanan') == 'mingguan') {
				if ($next) {
					$string .= "AND";
				}
				$string .= " WEEK(materi.waktu_terakhir_edit) = '".$date->format("Y-m-d")."' AND MONTH(materi.waktu_terakhir_edit) = '".$date->format("m")."' AND YEAR(materi.waktu_terakhir_edit) = '".$date->format("Y")."'";
			}elseif ($this->input->get('harian_bulanan') == 'bulanan') {
				if ($next) {
					$string .= "AND";
				}
				$string .= " MONTH(materi.waktu_terakhir_edit) = '".$date->format("m")."' AND YEAR(materi.waktu_terakhir_edit) = '".$date->format("Y")."'";
			}elseif ($this->input->get('harian_bulanan') == 'tahunan') {
				if ($next) {
					$string .= "AND";
				}
				$string .= " YEAR(materi.waktu_terakhir_edit) = '".$date->format("Y")."'";
			}elseif ($this->input->get('harian_bulanan') == 'all') {
				if ($next) {
					$string .= "AND";
				}
				$string .= " materi.waktu_terakhir_edit IS NOT NULL";
			}

			if ($this->input->get('popular_all') == 'all') {
				$string .= " ORDER BY materi.waktu_terakhir_edit DESC";
			}else{
				$string .= " ORDER BY materi.jumlah_diunduh DESC";
			}
			echo json_encode(array('materi'=>$this->model->rawQuery($string)->result()));
		}
	}

	/*
	* funtion untuk menangani ajax request cari kota kapbupaten
	*/
	function cariKotaOrKabupaten()
	{
		if ($this->input->get() != NULL) {
			$dataForm = $this->input->get();
			
			$dataReturn = $this->db->query("SELECT * FROM lokasi WHERE lokasi LIKE '%".$dataForm['term']['term']."%' ESCAPE '!' ")->result();			

			$data = array();
			foreach ($dataReturn as $key => $value) {
				$data[$key]['id'] = $value->id;
				$data[$key]['text'] = $value->lokasi;
			}
			echo json_encode($data);
		}else{
			redirect();
		}		
	}
}