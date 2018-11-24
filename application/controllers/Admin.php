<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
		if ($this->session->userdata('loginSession')['aktor'] !== 'admin') {
			redirect('logout');
		}

		// set array koasong untuk simpan notif2
		$this->menu['notif'] = array();
		$this->menu['belum_dilihat'] = array();
		$this->notifikasiMenu();
	}

	/*
	* function untuk menampilkan daftar kategori konten
	*/
	function kelolaKategoriKonten()
	{
		$data['kategori'] 	= $this->model->readS('kategori')->result();
		$header['title'] 	= 'Kelola Kategori Konten';
		$this->menu['breadcrumb'] = 'Kelola Kategori Konten';
		$this->menu['active'] 	= 'kategorikonten';
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-kategori-konten',$data);
		$this->load->view('statis/footer');
	}

	/*
	* function untuk menampilkan Daftar Message
	*/
	function kelolaDaftarMessage($dataCondition){
		$header['title'] 	= 'Kelola Daftar Message';
		$this->menu['breadcrumb'] = 'Kelola Daftar Message';
		$this->menu['active'] 	= 'daftarmessage';
		$this->menu['sort_active']= $dataCondition;
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-daftar-message');
		$this->load->view('statis/footer');

	}

	/*
	* funtuin untuk get data message di halaman LUPA
	*/
	function getDaftarMessage($dataCondition)
	{
		$query = '
		SELECT 
				permasalahan.id,
				permasalahan.teks AS teks_permasalahan,
				permasalahan.tanggal AS tanggal_message,
				permasalahan.status AS status_message,
				komentar.teks AS teks_komentar,
				komentar.tanggal AS tanggal_komentar,

				A.nama AS siapa_message,
				B.nama AS siapa_komentar
		FROM permasalahan
		LEFT JOIN komentar ON permasalahan.id = komentar.id
		LEFT JOIN pengguna A ON A.id = permasalahan.siapa
		LEFT JOIN pengguna B ON B.id = komentar.siapa

		';
		if ($dataCondition == 'solved') {
			$query .= " WHERE permasalahan.status = 'SOLVED'";
		}else if ($dataCondition == 'unsolved') {
			$query .= " WHERE permasalahan.status = 'UNSOLVED'";
		}

		$query .= " ORDER BY permasalahan.tanggal DESC ";
		$record = $this->model->rawQuery($query)->result();
		echo json_encode($record);
	}

	/*
	* funtion untuk menapmpilkan halaman kelola komentar
	*/
	function kelolaKomentar()
	{
		$header['title'] 	= 'Kelola Komentar';
		$this->menu['breadcrumb'] = 'Kelola Komentar';
		$this->menu['active'] 	= 'komentar';
		$record['kelola_komentar'] = $this->model->rawQuery('
			SELECT 
					komentar.id,
					komentar.teks AS teks_komentar,
					komentar.tanggal AS tanggal_komentar,
					komentar.solver,
					permasalahan.teks AS teks_permasalahan,
					permasalahan.tanggal AS tanggal_permasalahan,
					kategori.nama,
					permasalahan.jumlah_komen,
					permasalahan.jumlah_dilihat,
					
					A.nama AS siapa_komentar,
					B.nama AS siapa_permasalahan
			FROM permasalahan
			LEFT JOIN komentar ON permasalahan.id = komentar.permasalahan
			LEFT JOIN kategori ON permasalahan.kategori = kategori.id
			
			LEFT JOIN pengguna A ON komentar.siapa = A.id
			LEFT JOIN pengguna B ON permasalahan.siapa = B.id

			ORDER BY tanggal_komentar DESC
			')->result();
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-komentar',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funtion untuk menapmpilkan halaman kelola konten permasalahan
	*/
	function kelolaKontenPermasalahan()
	{
		$header['title'] 	= 'Kelola Konten Permasalahan';
		$this->menu['breadcrumb'] = 'Kelola Konten Permasalahan';
		$this->menu['active'] 	= 'kontenpermasalahan';
		$record['permasalahan']=$this->model->rawQuery('
				SELECT 
						permasalahan.id,
						permasalahan.teks,
						kategori.nama AS kategori,
						permasalahan.status,
						permasalahan.tanggal,
						pengguna.nama
				FROM permasalahan 
				LEFT JOIN kategori ON permasalahan.kategori = kategori.id
				LEFT JOIN pengguna ON permasalahan.siapa = pengguna.id
				')->result();
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-konten-permasalahan',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funtion untuk menapmpilkan halaman kelola materi
	*/
	function kelolaMateri()
	{
		$header['title'] 	= 'Kelola Materi';
		$this->menu['breadcrumb'] = 'Kelola Materi';
		$this->menu['active'] 	= 'materi';
		$record['materi']	= $this->model->rawQuery('
			SELECT 
					materi.nama AS nama_materi,
					kategori.nama AS nama_kategori,
					materi.waktu_terakhir_edit,
					pengguna.nama AS nama_editor,
					materi.jumlah_diunduh,
					materi.jumlah_dilihat
			FROM materi
			LEFT JOIN kategori ON materi.kategori = kategori.id
			LEFT JOIN pengguna ON materi.siapa_terakhir_edit = pengguna.id
		')->result();
		$record['kategori'] = $this->model->readS('kategori')->result();
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-materi',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funstion untuk menamoilkjan halaman kelola pengguna
	*/
	function kelolaPengguna()
	{
		$header['title'] 	= 'Kelola Pengguna';
		$this->menu['breadcrumb'] = 'Kelola Pengguna';
		$this->menu['active'] 	= 'pengguna';

		$record['mahasiswa'] = $this->model->read('pengguna',array('aktor'=>'mahasiswa'))->result();
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-pengguna',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funciton untuk menampilkan halaman kelola pesan indfo
	*/
	function kelolaPesanInfo()
	{
		$header['title'] 	= 'Kelola Pesan Info';
		$this->menu['breadcrumb'] = 'Kelola Pesan Info';
		$this->menu['active'] 	= 'pesaninfo';
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-pesan-info');
		$this->load->view('statis/footer');
	}

	/*
	* funciton untuk menampilkan halaman kelola tenaga pendidik
	*/
	function kelolaTenagaPendidik()
	{
		$header['title'] 	= 'Kelola Tenaga Pendidik';
		$this->menu['breadcrumb'] = 'Kelola Tenaga Pendidik';
		$this->menu['active'] 	= 'tenagapendidik';
		$record['tenagapendidik']=$this->model->read('pengguna',array('aktor'=>'pendidik'))->result();
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-tenaga-pendidik',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funciton untuk menampilkan halaman kelola lowongan kerja
	*/
	function kelolaLowonganKerja()
	{
		$header['title'] 	= 'Kelola Lowongan Kerja';
		$this->menu['breadcrumb'] = 'Kelola Lowongan Kerja';
		$this->menu['active'] 	= 'lowongan';

		$record['lowongan'] = $this->model->readS('lowongan')->result();
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-lowongan-kerja',$record);
		$this->load->view('statis/footer');
	}	

	/*
	* submit validasi lowongan via ajax dihalaman kelola lowongan
	*/
	function submitValidasiLowongan()
	{
		$readStateOrigin = $this->model->read('lowongan',array('id'=>$this->input->post('id')))->result();
		if ($readStateOrigin[0]->valid == 0) {
			$queryUpdateLowongan = $this->model->update('lowongan',array('id'=>$this->input->post('id')),array('valid'=>1));
		}else{
			$queryUpdateLowongan = $this->model->update('lowongan',array('id'=>$this->input->post('id')),array('valid'=>0));
		}
		$queryUpdateLowongan = json_decode($queryUpdateLowongan);
		if ($queryUpdateLowongan->status) {

			// delete notifikasi buatan pengguna untuk admin perihal permintaan validasi lowongan. 
			$this->model->delete('notif',array('konteks'=>'lowongan','id_konteks'=>$this->input->post('id')));

			if ($readStateOrigin[0]->valid == 0) {
				// delete notifikasi invalid buatan script untuk seorang pengguna
				$this->model->delete('notif',array('konteks'=>'lowonganNotValid','id_konteks'=>$this->input->post('id')));

				// create notif ke submiter lowongan kalau lowongan sudah divalidasi
				$this->model->create('notif',array('konteks'=>'lowonganValid','id_konteks'=>$this->input->post('id'),'untuk'=>$readStateOrigin[0]->dari,'dari'=>$this->session->userdata('loginSession')['id'],'datetime'=>date('Y-m-d H:i:s')));

				// createnotifikasi to alluser include admin
				$this->model->create('notif',array('konteks'=>'lowonganAvailable','id_konteks'=>$this->input->post('id'),'untuk'=>'semua','dari'=>$this->session->userdata('loginSession')['id'],'datetime'=>date('Y-m-d H:i:s')));

				alert('','success','Berhasil!','Lowongan berhasil di validasi',false);
			}else{
				// delete notifikasi invalid buatan script untuk seorang penggunga
				$this->model->delete('notif',array('konteks'=>'lowonganValid','id_konteks'=>$this->input->post('id')));

				// delete notifikasi ke semua pengguna kecuali admin perihal lowongan available tersebut
				$this->model->delete('notif',array('konteks'=>'lowonganAvailable','id_konteks'=>$this->input->post('id')));

				// create notif ke submiter lowongan kalau lowongan tidak valid
				$this->model->create('notif',array('konteks'=>'lowonganNotValid','id_konteks'=>$this->input->post('id'),'untuk'=>$readStateOrigin[0]->dari,'dari'=>$this->session->userdata('loginSession')['id'],'datetime'=>date('Y-m-d H:i:s')));

				alert('','success','Berhasil!','Validasi lowongan berhasil dibatalkan',false);
			}
		}else{
			alert('','danger','Gagal!','Lowongan gagal di validasi',false);
		}
	}

	/*
	* submit add lowongan
	*/
	function submitInsertLowongan()
	{
		
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
			        'valid'     				=> 1,
			        'tanggal'     				=> date('Y-m-d H:i:s')
			);
			$queryInsert = $this->model->create_id('lowongan',$newdata);
			$queryInsert = json_decode($queryInsert);
			if ($queryInsert->status) {
				alert('kelolaLowongan','success','Berhasil!',"Lowongan berhasil dibuat");
				redirect('lowongan-kerja');
			}else{
				alert('kelolaLowongan','danger','Gagal!',"Lowongan yang telah anda buat gagal dipublish. Eror : ".$queryInsert->error_message->message);
				redirect('lowongan-kerja');
			}
		}else{
			$kelolaLowongan = validation_errors("<div class='alert alert-warning alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>",
            	'</div>');
            $this->session->set_flashdata('kelolaLowongan', $kelolaLowongan);
			redirect('lowongan-kerja');
		}
	}

	/*
	* function untuk menangani submit form penambahan kategori pada halaman kelolakategori konten
	*/
	function tambahKategoriKonten()
	{
		if ($this->input->post() != null) {
			// cek  duplikasi kategori berdsarkan nama kategori
			$cekDuplikasiKategori = $this->model->read('kategori',array('nama'=>$this->input->post('nama')));
			if ($cekDuplikasiKategori->num_rows() == 0) {
				
				$createKategoriRecord = $this->model->create(
																'kategori',
																array(
																		'nama'					=> ucwords($this->input->post('nama')),
																		'icon'					=> 'bgicon-learn-physics',
																		'status'				=> $this->input->post('status'),
																		'jumlah_pertanyaan'		=> 0,
																		'jumlah_jawaban'		=> 0,
																		'tanggal' 				=> date('Y-m-d'),
																		'icon'					=> "icon-material-book",
																		'nama_folder'			=> "materi/".ucwords($this->input->post('nama'))
																	)
															);
				$createKategoriRecord = json_decode($createKategoriRecord);
				if ($createKategoriRecord->status){
					mkdir("materi/".ucwords($this->input->post('nama'))."",0755);
 					alert('kelolaKategoriKonten','success','Berhasil!','Kategori '.ucwords($this->input->post('nama')).' telah ditambahkan');
				}else{
					alert('kelolaKategoriKonten','danger','Gagal!','Kategori '.ucwords($this->input->post('nama')).' gagal ditambahkan');
				}
			}else{
				alert('kelolaKategoriKonten','danger','Gagal!','Kategori '.ucwords($this->input->post('nama')).' gagal ditambahkan. Kategori telah ada sebelumnya');
			}
		}else{
			alert('kelolaKategoriKonten','warning','Perhatian!','Tidak ada data yang di POST');
		}
		redirect('kelola-kategori-konten');
	}

	/*
	* function untuk menangani edit kategori pada halaman kelolakategorikonten
	*/
	function editKategoriKonten()
	{
		redirect('kelola-kategori-konten');
	}


	/*
	* function untuk menangani hapus kategori pada halaman kelolakategorikonten
	*/
	function deleteKategoriKonten()
	{
		if ($this->input->post() !== NULL) {
			$deleteKategoriKonten = $this->model->delete('kategori',array('id'=>$this->input->post('id')));
			if ($deleteKategoriKonten) {
				$this->model->update('kategori',array('id'=>$this->input->post('id')),array('nama_folder'=> 'materi/'.$this->input->post('nama')."_".date('d-M-Y')));
				rename('materi/'.$this->input->post('nama'), 'materi/'.$this->input->post('nama')."_".date('d-M-Y'));
				alert('kelolaKategoriKonten','success','Berhasil!','Kategori telah dihapus');
			}else{
				alert('kelolaKategoriKonten','danger','Gagal!','Kategori tidak dapat dihapus');
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk menangani hapus pengguna pada halaman kelola pengguna
	*/
	function deletePengguna()
	{
		if ($this->input->post() !== NULL) {
			$deletePengguna = $this->model->delete('pengguna',array('id'=>$this->input->post('id')));
			if ($deletePengguna) {
				alert('kelolaPengguna','success','Berhasil!','Pengguna telah dihapus');
				$this->model->delete('notif',array('konteks'=>'penggunaBaru','dari'=>$this->input->post('id'),'untuk'=>'admin'));
				$this->model->delete('permasalahan',array('siapa'=>$this->input->post('id')));
			}else{
				alert('kelolaPengguna','danger','Gagal!','Pengguna tidak dapat dihapus');
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk menangani ubah status pengguna pada halaman kelola pengguna
	*/
	function ubahStatusPengguna()
	{
		if ($this->input->post() !== NULL) {
			$ubahStatus = $this->model->update('pengguna',array('id'=>$this->input->post('id')),array('status'=>$this->input->post('status')));
			$ubahStatus = json_decode($ubahStatus);
			if ($this->input->post('status') == 'ACTIVE') {
				if ($ubahStatus->status) {
					alert('kelolaPengguna','success','Berhasil!','Status Pengguna telah diaktifkan');
					$this->model->delete('notif',array('konteks'=>'penggunaBaru','dari'=>$this->input->post('id'),'untuk'=>'admin'));
				}else{
					alert('kelolaPengguna','danger','Gagal!','Status Pengguna tidak dapat diaktifkan');
				}
			}else{
				if ($ubahStatus->status) {
					alert('kelolaPengguna','success','Berhasil!','Status Pengguna telah dibekukan');
				}else{
					alert('kelolaPengguna','danger','Gagal!','Status Pengguna tidak dapat dibekukan');
				}
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}
	/*
	* function untuk menangani hapus tenaga pendidik pada halaman tenaga pendidik
	*/
	function deleteTenagaPendidik()
	{
		if ($this->input->post() !== NULL) {
			$deleteTenagaPendidik = $this->model->delete('pengguna',array('id'=>$this->input->post('id')));
			if ($deleteTenagaPendidik) {
				alert('kelolaTenagaPendidik','success','Berhasil!','Tenaga Pendidik telah dihapus');
				$this->model->delete('notif',array('konteks'=>'penggunaBaru','dari'=>$this->input->post('id'),'untuk'=>'admin'));
			}else{
				alert('kelolaTenagaPendidik','danger','Gagal!','Tenaga Pendidik tidak dapat dihapus');
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk menangani ubah status tenaga pendidik pada halaman tenaga pendidik
	*/
	function ubahStatusTenagaPendidik()
	{
		if ($this->input->post() !== NULL) {
			$ubahStatus = $this->model->update('pengguna',array('id'=>$this->input->post('id')),array('status'=>$this->input->post('status')));
			$ubahStatus = json_decode($ubahStatus);
			if ($this->input->post('status') == 'ACTIVE') {
				if ($ubahStatus->status) {
					alert('kelolaTenagaPendidik','success','Berhasil!','Status tenaga pendidik telah diaktifkan');
					$this->model->delete('notif',array('konteks'=>'penggunaBaru','dari'=>$this->input->post('id'),'untuk'=>'admin'));

				}else{
					alert('kelolaTenagaPendidik','danger','Gagal!','Status tenaga pendidik tidak dapat diaktifkan');
				}
			}else{
				if ($ubahStatus->status) {
					alert('kelolaTenagaPendidik','success','Berhasil!','Status tenaga pendidik telah dibekukan');
				}else{
					alert('kelolaTenagaPendidik','danger','Gagal!','Status tenaga pendidik tidak dapat dibekukan');
				}
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk menangani hapus permasalahan pada halaman kelola konten permasalahan
	*/
	function deletePermasalahan()
	{
		if ($this->input->post() !== NULL) {
			$this->model->delete('komentar',array('permasalahan'=>$this->input->post('id')));
			$deletePermasalaan = $this->model->delete('permasalahan',array('id'=>$this->input->post('id')));
			if ($deletePermasalaan) {
				alert('kelolaKontenPermasalahan','success','Berhasil!','Konten permasalahan telah dihapus');
			}else{
				alert('kelolaKontenPermasalahan','danger','Gagal!','Konten permasalahan tidak dapat dihapus');
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk menangani ubah status permasalahan pada halaman kelola konten permasalahan
	*/
	function ubahStatusPermasalahan()
	{
		if ($this->input->post() !== NULL) {
			$ubahStatus = $this->model->update('permasalahan',array('id'=>$this->input->post('id')),array('status'=>$this->input->post('status')));
			$ubahStatus = json_decode($ubahStatus);
			if ($this->input->post('status') == 'SOLVED') {
				if ($ubahStatus->status) {
					alert('kelolaKontenPermasalahan','success','Berhasil!','Status permasalahan telah diubah ke SOLVED');
				}else{
					alert('kelolaKontenPermasalahan','danger','Gagal!','Status permasalahan tidak dapat diubah ke SOLVED');
				}
			}else{
				if ($ubahStatus->status) {
					alert('kelolaKontenPermasalahan','success','Berhasil!','Status permasalahan telah diubah ke UNSOLVED');
				}else{
					alert('kelolaKontenPermasalahan','danger','Gagal!','Status permasalahan tidak dapat diubah ke UNSOLVED');
				}
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk menangani add materi pada halaman kelola materi
	*/
	function tambahMateri()
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
			
			$insertMateri = $this->model->create_id('materi',$queryMateri);
			$insertMateri = json_decode($insertMateri);


			// if (TRUE) {
			if ($insertMateri->status) {
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
					$queryTags .= "(NULL,'".$insertMateri->message."','".$value."'),";
				}

				$queryTags =  rtrim($queryTags,", ");

				
				// insert batch
				$this->model->rawQuery($queryTags);

				// proses zipping
				$this->zip->archive(FCPATH.$direktori[0]->nama_folder.'/'.date('Ymd_His').'.zip');
			}

			// insert alamat direktori dari file attachment ke db
			$queryAttachment = "INSERT INTO attachment VALUES (NULL,'".$insertMateri->message."','".$direktori[0]->nama_folder."/".date('Ymd_His').".zip')";
			$this->model->rawQuery($queryAttachment);

			// create notif to all user include admin
			$this->model->create('notif',array('konteks'=>'materiBaru','id_konteks'=>$insertMateri->message,'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>'semua','datetime'=>date("Y-m-d H:i:s")));
			
			alert('kelolaMateri','success','Berhasil!','Materi telah ditambahkan');
			redirect('kelola-materi');
		}else{
			alert('kelolaMateri','danger','Gagal!','Materi gagal ditambahkan');
			redirect('kelola-materi');
		}
	}

	/*
	* function untuk delete materi
	*/
	function deleteMateri($id)
	{
		$this->model->delete('materi',array('id'=>$id));
		$this->model->delete('attachment',array('id_materi'=>$id));
		alert('kelolaMateri','success','Berhasil!','Materi telah dihapus');
		redirect('kelola-materi');
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


		// baca notif untuk para admin dan dia seorang
		$notif_admin = $this->model->rawQuery("
			SELECT  
					notif.id,
					notif.konteks,
					notif.id_konteks,
					pengguna.nama AS dari, 
					pengguna.aktor, 
					pengguna.foto, 
					notif.untuk,
					notif.datetime 
			FROM notif 
			LEFT JOIN pengguna ON pengguna.id = notif.dari
			WHERE 
					(untuk='semua' AND dari != ".$this->session->userdata('loginSession')['id'].")
			OR 
					untuk='admin'
			OR 
					untuk='".$this->session->userdata('loginSession')['id']."'
			ORDER BY datetime DESC
		");


		if ($notif_admin->num_rows() != 0) {
			$notif_admin = $notif_admin->result();
			
			// baca notif yang untuk para admin yang sudah terlihat untuk dikoreksi dengan notifikasi untuk para admin
			$notif_admin_terlihat = $this->model->rawQuery("SELECT id_notif FROM notif_flag WHERE terlihat = '1' AND id_pengguna='".$this->session->userdata('loginSession')['id']."' ")->result_array();

			// array matang untuk dikirim ke menu
			$notif_ = array();

			// berlaku untuk notif admin atau notif untuk saya
			foreach ($notif_admin as $key => $value) {
				$notif_[$key] = $value;
				if ($this->in_array_r($value->id,$notif_admin_terlihat)) {
					$notif_[$key]->terlihat = 'sudah';
				}else{
					$notif_[$key]->terlihat = 'belum';
					array_push($this->menu['belum_dilihat'], $value->id);
				}
			}

			// insert max notif id per user
			$runQuery = $this->model->rawQuery("UPDATE max_notif_id_per_user SET max_notif_id =".$notif_admin[0]->id." WHERE id_pengguna='".$this->session->userdata('loginSession')['id']."'");
			// var_dump($runQuery);die();

			unset($notif_admin);unset($notif_admin_terlihat);unset($notif_admin_terbaca);

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
		if ($this->input->post() !== NULL) {
			if ($this->menu['belum_dilihat'] !== NULL) {
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
