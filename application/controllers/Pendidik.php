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
		$this->menu['notif_non_dm'] = array();
		$this->menu['notif_dm'] = array();
		$this->menu['belum_dilihat_non_dm'] = array();
		$this->menu['belum_dilihat_dm'] = [];
		$this->notifikasiMenuNonDm();
		$this->notifikasiMenuDm();
	}


	/*
	* function untuk menampilkan pesan
	*/
	function pesan()
	{
		// echo "<pre>";
		// var_dump($this->input->post());
		// die();
		$header['title'] 			= 'Pendidik - Pesan';
		$this->menu['breadcrumb'] 	= 'Pesan';
		$this->menu['active'] 		= 'pesan';
		$record = array();
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$this->menu);
		
		// delete dm yang terinit namun tidak terbalas (yang tidak jadi dm)
		$this->deleteInitializedDm();
		
		/*
			apakah bikin chat baru atau tidak. kalau ya, open new chat room dialog, kalau tidak, tampilkan 'tidak ada pesan yang dipilih'
			DATA YANG DI POST adalah :
				- id_komentator
				- id_permasalahan
				- id_komentar
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
			
			// jika asalnya dari redirect setelah pertanyaan permaslaahan terpocahkan? maka set suah alert
			if (isset($this->session->flashdata("id_komentator")['permasalahan_terpecahkan']) AND $this->session->flashdata("id_komentator")['permasalahan_terpecahkan'] == 1) {
				alert('alert','success','Barhasil!','Status permasalahan telah diubah menjadi SOLVED!');
			}elseif(isset($this->session->flashdata("id_komentator")['permasalahan_terpecahkan']) AND $this->session->flashdata("id_komentator")['permasalahan_terpecahkan'] == 0){
				alert('alert','success','Terimakasih!','Feedback anda telah tersimpan');
			}

			$this->load->view('tenagapendidik/pesan-detail',$record);
		}else{

			// get daftar mahasiswa yang telah dicahat
			$record['to']	=  $this->getInitializedDm();

			$this->load->view('tenagapendidik/pesan',$record);
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

				// create notification kalau ada dm baru untuk seorang pengguna. idkonteks di skip karena hanya perlu mengarah ke halaman pesan dengan pengguna bukan spesifik ke pesannya.
				$this->model->create('notif',array('konteks'=>'dm','id_konteks'=>$queryInsert->message,'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>$this->input->post('untuk'),'datetime'=>date('Y-m-d H:i:s')));

				alert('alert','success','Barhasil!','Direct message berhasil dikirim');
				redirect('pesan-pendidik');
			}else{
				alert('alert','danger','Gagal!','Direct message gagal dikirim');
				redirect('pesan-pendidik');
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
	function profil()
	{
		$header['title'] = 'Pendidik - Profil';
		$this->menu['breadcrumb'] 	= 'Profil';
		$this->menu['active'] 		= '';

		$record['pertanyaan'] = $this->model->rawQuery("
			SELECT 
				DISTINCT 
					permasalahan.id,
					permasalahan.teks AS pertanyaan,
					(
						SELECT MAX(komentar.id) FROM komentar
						WHERE komentar.permasalahan = permasalahan.id
					) AS max_komentar,
					(
						SELECT komentar.teks FROM komentar WHERE komentar.id = max_komentar
					) AS komentar,
					(
						SELECT pengguna.nama FROM pengguna WHERE pengguna.id = (SELECT komentar.siapa FROM komentar WHERE komentar.id = max_komentar)
					) AS nama_komentator,
					(
						SELECT pengguna.foto FROM pengguna WHERE pengguna.id = (SELECT komentar.siapa FROM komentar WHERE komentar.id = max_komentar)
					) AS foto_komentator,
					(
						SELECT komentar.tanggal FROM komentar WHERE komentar.id = max_komentar
					) AS tanggal

					
			FROM permasalahan 
			LEFT JOIN komentar ON permasalahan.id = komentar.permasalahan WHERE permasalahan.siapa  = '".$this->session->userdata('loginSession')['id']."' ORDER BY id DESC")->result();
		$record['dm'] = array(
								'dm_solved' => $this->model->rawQuery("SELECT COUNT(id) AS jumlah FROM direct_message WHERE jenis_pesan = 'permasalahan_solved' AND dari = '".$this->session->userdata('loginSession')['id']."' ")->result_array(),
								'dm'		=> $this->model->rawQuery("SELECT COUNT(id) AS jumlah FROM direct_message WHERE dari = '".$this->session->userdata('loginSession')['id']."'")->result_array()
							);
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$this->menu);
		$this->load->view('tenagapendidik/profil',$record);
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
	function deletePertanyaan()
	{
		if ($this->input->post() !== array()) {
			
			// delete di tabel master, yakni permasalahan
			$deletePertanyaan = $this->model->delete('permasalahan',array('id'=>$this->input->post('id')));

			// delete di tabel notifikasi
			$this->model->rawQuery("DELETE FROM notif WHERE (konteks ='pertanyaan' OR konteks ='ratingKomentar' OR konteks ='komentar') AND id_konteks = ".$this->input->post('id'));

			// delete di tabel riwayat_notifikasi
			$this->model->delete('riwayat_permasalahan',array('permasalahan'=>$this->input->post('id')));

			// delete komentar terkait permaslahan
			$this->model->delete('komentar',array('permasalahan'=>$this->input->post('id')));

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
			$recordPengguna = $this->model->read('pengguna',array('id'=>$this->input->post('id')))->result();
			if ($this->input->post('password') !== '') {
				if (md5($this->input->post('password')) !== $recordPengguna[0]->password) {
					alert('alert','danger','Gagal!','Edit profil gagal. Password salah');
					redirect('edit-profil-pendidik');
					return true;
				}else{
					// cek apakah password_ ada isinya
					if ($this->input->post('password_') == '') {
						alert('alert','danger','Gagal!','Password baru tidak dimasukkan. Isilah kolom password hanya jika ingin mengganti password');
						redirect('edit-profil-pendidik');
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
					alert('alert','danger','Gagal!',$this->upload->display_errors());
					redirect('edit-profil-pendidik');
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
					alert('alert','success','Barhasil!','Profil telah di perbarui di database.');
					redirect('edit-profil-pendidik');
				}else{
					if ($runUpdate->error_message->code == 1062) {
						alert('alert','danger','Gagal!',$runUpdate->error_message->message);
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
				$this->session->set_flashdata('alert', $register);
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
	* function untuk menampilkan halaman dashboard
	*/
	function dashboard()
	{
		$header['title'] = "Pendidik - Dashboard";
		$this->menu['breadcrumb'] = "Dashboard";
		$this->menu['active'] = "home";
		
		$record['kategori'] = $this->model->readS('kategori')->result();
		$record['lowongan'] = $this->model->read('lowongan',array('valid'=>'1'))->result();
		// $record['materi'] = $this->model->rawQuery('
		// 												SELECT
		// 														materi.nama AS nama_materi,
		// 														materi.jumlah_diunduh,
		// 														pengguna.nama AS nama_pengguna
		// 												FROM materi
		// 												LEFT JOIN pengguna ON materi.siapa_terakhir_edit = pengguna.id
		// ')->result();
		$record['pengguna'] = $this->model->read('pengguna',array('id'=>$this->session->userdata('loginSession')['id']))->result();

		$this->load->view("statis/header",$header);
		$this->load->view("tenagapendidik/menu",$this->menu);
		$this->load->view("tenagapendidik/dashboard",$record);
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
		$record['kategori'] = $this->model->readSCol("kategori",array('id','nama'))->result();
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
			redirect('materi-pendidik');
		}else{
			alert('alert','danger','Gagal!','Materi gagal ditambahkan');
			redirect('materi-pendidik');
		}
	}

	/*
	* function untuk menampilkan halaman karir
	*/
	function karir()
	{
		$header['title'] = "Pendidik - Karir";
		$this->menu['breadcrumb'] = "Karir";
		$this->menu['active'] = "karir";
		$record['lowongan'] = $this->model->read('lowongan',array('valid'=>1))->result();

		$this->load->view("statis/header",$header);
		$this->load->view("tenagapendidik/menu",$this->menu);
		$this->load->view("tenagapendidik/karir",$record);
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
				        'dari'     					=> $this->session->userdata('loginSession')['id'],
				        'valid'     				=> 0,
				        'tanggal'     				=> date('Y-m-d H:i:s')
				);
				$queryInsert = $this->model->create_id('lowongan',$newdata);
				$queryInsert = json_decode($queryInsert);
				if ($queryInsert->status) {
					$this->model->create('notif',array('konteks'=>'lowongan','id_konteks'=>$queryInsert->message,'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>'admin','datetime'=>date('Y-m-d H:i:s')));
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
			// baca rating awal jika ada
			$ratingAwal = $this->model->read("komentar",array('id'=>$this->input->post('id')));

			// jika rating telah diset sebelumnya, maka increment atau decrement
			$ratingAwal = $ratingAwal->result();
			
			if (intval($ratingAwal[0]->rating) > intval($this->input->post('rating'))) {
				// decrement poin di mahasiswa
				var_dump($this->model->rawQuery("UPDATE pengguna SET poin = poin - ".($ratingAwal[0]->rating - $this->input->post('rating'))." WHERE pengguna.id = ".$ratingAwal[0]->siapa));
			}else{
				// increment poin di mahasiswa
				echo "string";
				var_dump($this->model->rawQuery("UPDATE pengguna SET poin = poin + ".($this->input->post('rating') - $ratingAwal[0]->rating)." WHERE pengguna.id = ".$ratingAwal[0]->siapa));
			}

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
	function in_array_r($needle, $haystack, $strict = false)
	{
		foreach ($haystack as $item) {
			if (($strict ? $item === $needle : $item == $needle) || (is_array($item) && $this->in_array_r($needle, $item, $strict))) {
				return true;
			}
		}
		return false;
	}

	/*
	* funtion untuk menampilkan icon angka pada icon lonceng
	*/
	function notifikasiMenuNonDm()
	{
		// baca notif untuk para mahasiswa dan dia seorang
			$notif_pendidik = $this->model->rawQuery("
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
						untuk = 'pendidik' 
				OR 
						untuk = '".$this->session->userdata('loginSession')['id']."'
				AND
						konteks != 'dm'
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
					array_push($this->menu['belum_dilihat_non_dm'], $value->id);
				}
			}

			// insert max notif id per user
			$runQuery = $this->model->rawQuery("UPDATE max_notif_id_per_user SET max_notif_id =".$notif_pendidik[0]->id." WHERE id_pengguna='".$this->session->userdata('loginSession')['id']."'");
			// var_dump($runQuery);die();

			unset($notif_pendidik);unset($notif_pendidik_terlihat);unset($notif_pendidik_terbaca);

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
			$notif_pendidik = $this->model->rawQuery("
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
					(untuk = '".$this->session->userdata('loginSession')['id']."' OR untuk = 'pendidik')
				AND
					(konteks = 'dm' OR konteks = 'pesaninfo')
				AND 
					terbaca IS NULL
				GROUP BY dari
				ORDER BY datetime DESC;
			");


		if ($notif_pendidik->num_rows() != 0) {
			$notif_pendidik = $notif_pendidik->result();
			
			// baca notif yang untuk para mahasiswa yang sudah terlihat untuk dikoreksi dengan notifikasi untuk para mahasiswa
			$notif_pendidik_terlihat = $this->model->rawQuery("SELECT id_notif FROM notif_flag WHERE terlihat = '1' AND id_pengguna='".$this->session->userdata('loginSession')['id']."' ")->result_array();

			// array matang untuk dikirim ke menu
			$notif_ = array();

			// berlaku untuk notif mahasiswa atau notif untuk saya
			$belum_dilihat_dm = array();
			foreach ($notif_pendidik as $key => $value) {
				$notif_[$key] = $value;
				$value->jumlah = explode(",", $value->jumlah);
				if ($this->in_array_r($value->id,$notif_pendidik_terlihat)) {

				}else{
					foreach ($value->jumlah as $keyA => $valueA) {
						array_push($belum_dilihat_dm, $valueA);
					}
					// $this->menu['belum_dilihat_dm'] = $value->jumlah;
				}
			}
			$this->menu['belum_dilihat_dm'] = $belum_dilihat_dm;

			// insert max notif id per user
			$runQuery = $this->model->rawQuery("UPDATE max_notif_id_per_user SET max_notif_id =".$notif_pendidik[0]->id." WHERE id_pengguna='".$this->session->userdata('loginSession')['id']."'");
			// var_dump($runQuery);die();

			unset($notif_pendidik);unset($notif_pendidik_terlihat);unset($notif_pendidik_terbaca);

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
	* funtion untuk handle download
	* id adalah idnya materi
	*/
	function downloadMateri($id)
	{
		$this->load->helper('download');
		
		$materi = $this->model->read('materi',array('id'=>$id))->result();
		$attachment = $this->model->read('attachment',array('id_materi'=>$id))->result();
		
		$data = file_get_contents(FCPATH.$attachment[0]->url_attachment);
		
		// update harus diatas force. karena force langsung die melalui return (sepertinya). 
		$this->model->rawQuery("UPDATE materi SET jumlah_diunduh = jumlah_diunduh + 1 WHERE id = ".$id);
		
		force_download($materi[0]->nama.".zip", $data);
	}

	/*
	* funtion untuk handle permasalahan solved atau unsolved
	* paramter d adalah id di tabel dm
	*/
	function setStatusPertanyaanSolved($d)
	{

		// baca informasi detil sebuah koemtar permalashan untuk acuan update ke tabel yang berrelasi
		$pertanyaan = $this->model->read('direct_message',array('id'=>$d),array('id','permasalahan','dari','komentar','rating'))->result();
		
		// update permasalahan menjadi solve
		$this->model->update('permasalahan',array('id'=>$pertanyaan[0]->permasalahan),array('status'=>'SOLVED'));
		
		// update sebuah komentar menjadi solver dari sebuah permasalahan.
		$this->model->update('komentar',array('id'=>$pertanyaan[0]->komentar),array('solver'=>$pertanyaan[0]->permasalahan));
		
		// update semua direct_message bertipe permasalahan dengan id tersebut. ubah field terpecahkan menjadi SOLVED
		$this->model->update('direct_message',array('jenis_pesan'=>'permasalahan','permasalahan'=>$pertanyaan[0]->permasalahan),array('terpecahkan'=>'SOLVED'));

		// update solver di tabel direct_message where id=id. update kolom solver jadi id permasalahan.
		$this->model->update('direct_message',array('id'=>$d),array('solver'=>$pertanyaan[0]->permasalahan));

		// update semua komentar di tabel komentar dan direct_message yang telah di set bahwa dia bukanlah solver. untuk menghilangkan panel tanya permsalahan terpecahkan atau tidak.
		$this->model->update('komentar',array('permasalahan'=>$pertanyaan[0]->permasalahan,'id !='=>$pertanyaan[0]->komentar),array('solver'=>'bukan'));
		$this->model->update('direct_message',array('jenis_pesan'=>'komentarpermasalahan','permasalahan'=>$pertanyaan[0]->permasalahan,'id !='=>$d),array('solver'=>'bukan'));

		// kalau nggk ngirim dm tapi langung ngirim solved
		$this->model->rawQuery("UPDATE direct_message SET dibalas='sudah' WHERE (jenis_pesan = 'permasalahan' OR jenis_pesan = 'komentarpermasalahan') AND permasalahan = '".$pertanyaan[0]->permasalahan."' AND komentar = '".$pertanyaan[0]->komentar."'");

		// kirim sebuah dm kalau permasalahan sudah terpecahkan
		$this->model->create('direct_message',array(
													'jenis_pesan'	=>'permasalahan_solved',
													'dari'			=>$this->session->userdata('loginSession')['id'],
													'untuk'			=>$pertanyaan[0]->dari,
													'permasalahan'	=>$pertanyaan[0]->permasalahan,
													'komentar'		=>$pertanyaan[0]->komentar,
													'tanggal'		=>date("Y-m-d")
												)
		);

		// redirect dengan set flashdata untuk buka halaman ber dm ria dengan seorang komentator
		$data = array('id_komentator'=>$pertanyaan[0]->dari,'permasalahan_terpecahkan'=>1);
		$this->session->set_flashdata('id_komentator',$data);
		redirect('pesan-pendidik');
	}

	function setStatusPertanyaanUnsolved($d)
	{
		/*set status solver sebuah komentar permasalahan jadi 'bukan'. untuk deteksi apakah perlu ditampilkan kolom pertanyaan permasalahan terpecahkana di dm*/
		// baca informasi detil sebuah koemtar permalashan untuk acuan update ke tabel yang berrelasi
		$pertanyaan = $this->model->readCol('direct_message',array('id'=>$d),array('permasalahan','dari','komentar','rating'))->result();

		// update sebuah komentar menjadi bukan solver dari sebuah permasalahan. 
		$this->model->update('komentar',array('id'=>$pertanyaan[0]->komentar),array('solver'=>'bukan'));

		// update solver di tabel pada dm where id=id. update kolom solver jadi id permaslaahan.
		$this->model->update('direct_message',array('id'=>$d),array('solver'=>'bukan'));

		// kirim sebuah dm kalau permaslahan belum terpecahkan

		// redirect dengan set flashdata
		$data = array('id_komentator'=>$pertanyaan[0]->dari,'permasalahan_terpecahkan'=>0);
		$this->session->set_flashdata('id_komentator',$data);
		redirect('pesan-pendidik');
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

	function playground()
	{
		$this->load->view('tenagapendidik/playground');
	}
}