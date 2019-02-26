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

	function playground()
	{
		$this->load->view('tenagapendidik/playground');
	}

	function dashboard()
	{
		$header['title'] 			= 'Dashboard';
		$this->menu['breadcrumb'] 	= 'Dashboard';
		$this->menu['active'] 		= 'dashboard';
		
		$data['kategori'] 			= $this->model->readS('kategori')->result();
		$data['pertanyaan']			= $this->model->rawQuery("SELECT permasalahan.id, permasalahan.teks, permasalahan.tanggal, pengguna.nama AS nama_pengguna, permasalahan.status, pengguna.foto FROM permasalahan LEFT JOIN pengguna ON permasalahan.siapa = pengguna.id ORDER BY permasalahan.tanggal DESC")->result();

		$data['testimonial']		= $this->model->rawQuery("SELECT testimonial.id, testimonial.teks, testimonial.tanggal, pengguna.nama, pengguna.foto FROM testimonial LEFT JOIN pengguna ON testimonial.dari = pengguna.id ORDER BY testimonial.tanggal")->result();

		$data['lowongan'] = $this->model->rawQuery("SELECT lowongan.id,lowongan.nama AS teks_lowongan, pengguna.nama AS nama_pengguna, pengguna.foto, lokasi.lokasi, lowongan.instansi, lowongan.valid FROM lowongan LEFT JOIN pengguna ON pengguna.id = lowongan.dari LEFT JOIN lokasi ON lowongan.lokasi = lokasi.id WHERE valid = 0 ORDER BY lowongan.tanggal")->result();

		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/dashboard',$data);
		$this->load->view('statis/footer');
	}

	/*
	* view kelola testimonial
	*/
	function kelolaTestimonial()
	{
		$data['testimonial'] 	= $this->model->rawQuery('SELECT testimonial.id, testimonial.teks, pengguna.nama, pengguna.foto, testimonial.tanggal FROM testimonial LEFT JOIN pengguna ON testimonial.dari = pengguna.id')->result();
		$header['title'] 	= 'Kelola Testimonial';
		$this->menu['breadcrumb'] = 'Kelola Testimonial';
		$this->menu['active'] 	= 'kategoritestimonial';
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-testimonial',$data);
		$this->load->view('statis/footer');
	}

	/*
	* delete sebuah testimonial
	*/
	function deleteTestimonial($id)
	{
		$cek_exist = $this->model->rawQuery("SELECT COUNT(id) AS jumlah FROM testimonial WHERE id='$id'")->result();
		if ($cek_exist[0]->jumlah !== 0) {
			$bool = $this->model->delete("testimonial",array("id"=>$id));
			if ($bool) {
				alert('alert','success','Berhasil!','Testimonial telah dihapus');
			}else{
				alert('alert','danger','Gagal!','Testimonial tidak dapat dihapus');
			}
			redirect('kelola-testimonial');
		}else{
			$error['heading'] = '404 Data Not Found';
			$error['message'] = '<p>Data tidak ditemukan</p>';
			$this->load->view('errors/html/error_404',$error);
		}
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
	function kelolaDaftarMessage($dataCondition)
	{
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
			SELECT DISTINCT 
			permasalahan.id AS id_permasalahan,
			permasalahan.teks AS teks_permasalahan,
			permasalahan.tanggal AS tanggal_permasalahan,
			permasalahan.beku,
			permasalahan.jumlah_dilihat,
			permasalahan.jumlah_dibaca,
			permasalahan.jumlah_komen,
			(
			SELECT MAX(komentar.id) 
			FROM komentar 
			WHERE komentar.permasalahan = permasalahan.id
			) AS max_id_komentar,
			(
			SELECT komentar.teks
			FROM komentar 
			WHERE komentar.id= MAX_ID_KOMENTAR
			) AS teks_komentar,
			(
			SELECT komentar.tanggal
			FROM komentar 
			WHERE komentar.id= MAX_ID_KOMENTAR
			) AS tanggal_komentar,
			(
			SELECT pengguna.nama
			FROM pengguna
			WHERE pengguna.id= (SELECT komentar.siapa
			FROM komentar
			WHERE komentar.id= MAX_ID_KOMENTAR)
			) AS siapa_komentar,
			(
			SELECT pengguna.nama
			FROM pengguna
			WHERE pengguna.id= (SELECT permasalahan.siapa
			FROM permasalahan
			WHERE permasalahan.id= ID_PERMASALAHAN)
			) AS siapa_permasalahan

			FROM permasalahan
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
			permasalahan.beku,
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
			materi.id,
			materi.ikon_warna,
			materi.ikon_logo,
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

		$record['mahasiswa']	= $this->model->rawQuery("SELECT * FROM pengguna WHERE aktor = 'mahasiswa' ORDER BY status DESC")->result();
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
		$this->menu['active'] = 'pesaninfo';
		$record['pesan_info'] = $this->model->rawQuery("
			SELECT
			pengguna.foto,
			direct_message.teks,
			direct_message.id,
			pengguna.nama

			FROM direct_message
			LEFT JOIN pengguna ON direct_message.untuk = pengguna.id
			WHERE direct_message.jenis_pesan = 'pesaninfo'
			")->result();

		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/kelola-pesan-info',$record);
		$this->load->view('statis/footer');
	}

	/*
	* delete sebuah testimonial
	*/
	function deletePesanInfo($id)
	{
		$cek_exist = $this->model->rawQuery("SELECT * FROM direct_message WHERE id='$id'");
		if ($cek_exist->num_rows() !== 0) {
			$bool = $this->model->delete("direct_message",array("id"=>$id));
			if ($bool) {
				$cek_exist = $cek_exist->result();
				$this->model->delete("notif",array("konteks"=>"pesaninfo","untuk"=>$cek_exist[0]->untuk));
				alert('alert','success','Berhasil!','Pesan telah dihapus');
			}else{
				alert('alert','danger','Gagal!','Pesan tidak dapat dihapus');
			}
			redirect('kelola-pesan-info');
		}else{
			$error['heading'] = '404 Data Not Found';
			$error['message'] = '<p>Data tidak ditemukan</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* funciton untuk menampilkan halaman kelola tenaga pendidik
	*/
	function kelolaTenagaPendidik()
	{
		$header['title'] 	= 'Kelola Tenaga Pendidik';
		$this->menu['breadcrumb'] 	= 'Kelola Tenaga Pendidik';
		$this->menu['active'] 		= 'tenagapendidik';
		$record['tenagapendidik']	= $this->model->rawQuery("SELECT * FROM pengguna WHERE aktor = 'pendidik' ORDER BY status DESC")->result();
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
				alert('alert','success','Berhasil!',"Lowongan berhasil dibuat");
				redirect('lowongan-kerja');
			}else{
				alert('alert','danger','Gagal!',"Lowongan yang telah anda buat gagal dipublish. Eror : ".$queryInsert->error_message->message);
				redirect('lowongan-kerja');
			}
		}else{
			$kelolaLowongan = validation_errors("<div class='alert alert-warning alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>",
				'</div>');
			$this->session->set_flashdata('alert', $kelolaLowongan);
			redirect('lowongan-kerja');
		}
	}

	/*
	* function untuk menangani submit form penambahan kategori pada halaman kelolakategori konten
	*/
	function submitTambahKategoriKonten()
	{
		if ($this->input->post() != null) {
			// cek  duplikasi kategori berdsarkan nama kategori
			$cekDuplikasiKategori = $this->model->read('kategori',array('nama'=>$this->input->post('nama')));
			if ($cekDuplikasiKategori->num_rows() == 0) {

				if ($_FILES['background']['name'] !== '') {
					$config['upload_path']	= FCPATH.'bgkategori/';
					$config['allowed_types']= 'gif|jpg|png|jpeg|JPG|PNG|GIF|JPEG';
					$config['file_name'] = $this->input->post('nama');
					$this->load->library('upload', $config);

					if ( ! $this->upload->do_upload('background'))
					{
						alert('alert','danger','Gagal!',$this->upload->display_errors());
						redirect('kelola-kategori-konten');
						return false;
					}
					else
					{
						$background = "bgkategori/".$this->upload->data()['file_name'];
					}
				}

				$icon = explode(" ", $this->input->post('icon'));
				$createKategoriRecord = $this->model->create(
					'kategori',
					array(
						'nama'					=> ucwords($this->input->post('nama')),
						'icon'					=> $icon[1],
						'status'				=> $this->input->post('status'),
						'jumlah_pertanyaan'		=> 0,
						'jumlah_jawaban'		=> 0,
						'tanggal' 				=> date('Y-m-d'),
						'icon'					=> "icon-material-book",
						'nama_folder'			=> "materi/".ucwords($this->input->post('nama')),
						'background'			=> $background
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
	* function untuk menangani edit kategori pada halaman kelolakategorikonten. function ini dipanggil oleh jquery get di halaman kelola kategori konten untuk mengisi form edit
	*/
	function getKategoriKonten()
	{
		// redirect('kelola-kategori-konten');
		$record = $this->model->read("kategori",array('id'=>$this->input->get('id')))->result();
		echo json_encode($record);
	}

	/*
	* function untuk  handle submit form edit kategori konten
	*/
	function submitEditKategoriKonten()
	{
		if ($this->input->post() !== array()) {
			$kategori = $this->model->read('kategori',array('id' => $this->input->post('id_kategori')))->result();
			$queryUpdate = array(
				'icon' => $this->input->post('icon'),
				'status' => $this->input->post('status'),
				'tanggal' => date("y-m-d")
			);

			// cek apakah ada perintah update foto
			// echo "<pre>";
			// var_dump($_FILES['background']);
			// die();
			if ($_FILES['background']['name'] !== '') {
				$config['upload_path']	= FCPATH.'bgkategori/';
				$config['allowed_types']= 'gif|jpg|png|jpeg|JPG|PNG|GIF|JPEG';
				$config['file_name'] = $this->input->post('nama')."";
				$this->load->library('upload', $config);

				if ( ! $this->upload->do_upload('background'))
				{
					alert('alert','danger','Gagal!',$this->upload->display_errors());
					redirect('kelola-kategori-konten');
					return false;
				}
				else
				{
					// echo "<pre>";
					// var_dump($this->upload->data());
					unlink(FCPATH.$kategori[0]->background);
					$queryUpdate['background'] = "bgkategori/".$this->upload->data()['file_name'];
					// echo $this->upload->data()['file_name'];
					// var_dump($queryUpdate['background']);
					// die();
				}
			}
			$query = json_decode($this->model->update("kategori",array('id'=>$this->input->post('id_kategori')),$queryUpdate));
			if ($query->status) {
				alert('alert','success','Berhasil!','Kategori telah diperbarui');
			}else{
				alert('alert','danger','Gagal!','Kategori gagal diperbarui');
			}
			redirect('kelola-kategori-konten');
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
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
				alert('alert','success','Berhasil!','Pengguna telah dihapus');
				$this->model->delete('notif',array('konteks'=>'penggunaBaru','dari'=>$this->input->post('id'),'untuk'=>'admin'));
				$this->model->delete('permasalahan',array('siapa'=>$this->input->post('id')));
			}else{
				alert('alert','danger','Gagal!','Pengguna tidak dapat dihapus');
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
					alert('alert','success','Berhasil!','Status Pengguna telah diaktifkan');
				}else{
					alert('alert','danger','Gagal!','Status Pengguna tidak dapat diaktifkan');
				}
			}else{
				if ($ubahStatus->status) {
					alert('alert','success','Berhasil!','Status Pengguna telah dibekukan');
				}else{
					alert('alert','danger','Gagal!','Status Pengguna tidak dapat dibekukan');
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

// delete di tabel notifikasi
			$this->model->rawQuery("DELETE FROM notif WHERE (konteks ='pertanyaan' OR konteks ='ratingKomentar' OR konteks ='komentar') AND id_konteks = ".$this->input->post('id'));

// delete di tabel
			$this->model->delete('riwayat_permasalahan',array('permasalahan'=>$this->input->post('id')));

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
			$ikon_cat_dan_warna = array(
				array(
					"icon"	=>	"cat-diamond",
					"warna"	=>	"blue"
				),
				array(
					"icon"	=>	"cat-puzzle",
					"warna"	=>	"red"
				),
				array(
					"icon"	=>	"cat-chemistry",
					"warna"	=>	"green"
				),
				array(
					"icon"	=>	"cat-plane",
					"warna"	=>	"blue"
				)
			);

			$randomly_selected = rand(0,3);

			$queryMateri['nama'] 				= ucwords($this->input->post('nama'));
			$queryMateri['kategori'] 			= $this->input->post('kategori');
			$tags 			 					= $this->input->post('tags');
			$tags 								= explode(",", $tags);
			$queryMateri['deskripsi'] 			= $this->input->post('deskripsi');
			$queryMateri['waktu_terakhir_edit'] = date('Y-m-d H:i:s');
			$queryMateri['siapa_terakhir_edit'] = $this->session->userdata('loginSession')['id'];
			$queryMateri['jumlah_diunduh'] 		= 0;
			$queryMateri['jumlah_dilihat'] 		= 0;
			$queryMateri['ikon_logo'] 			= explode(" ", $this->input->post('icon'));
			$queryMateri['ikon_logo'] 			= $queryMateri['ikon_logo'][1];

			$queryMateri['ikon_cat'] 			= $ikon_cat_dan_warna[$randomly_selected]['icon'];
			$queryMateri['ikon_warna'] 			= $ikon_cat_dan_warna[$randomly_selected]['warna'];

			$insertMateri = $this->model->create_id('materi',$queryMateri);
			$insertMateri = json_decode($insertMateri);


// if (TRUE) {
			if ($insertMateri->status) {
// baca destinasi penyimpanan yang sudah terdefinisi di tabel kategori
				$direktori = $this->model->read('kategori',array('id'=>$queryMateri['kategori']))->result();

				$config['upload_path']          = FCPATH.$direktori[0]->nama_folder.'/';
				$config['allowed_types']        = 'docx|doc|xls|pdf|xlsx|JPG|JPEG|jpg|jpeg';

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
						$this->model->delete("materi",array("id"=>$insertMateri->message));
						alert('kelolaMateri','danger','Berhasil!','Materi gagal ditambahkan. Pastikan file kurang dari 2MB. Kesahalan: '.$this->upload->display_errors());
						redirect('kelola-materi');
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
		$this->model->delete('tags',array('id_materi'=>$id));

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
			notif.terbaca,
			pengguna.nama AS dari, 
			pengguna.aktor, 
			pengguna.foto, 
			notif.untuk,
			notif.datetime 
			FROM notif 
			LEFT JOIN pengguna ON pengguna.id = notif.dari
			WHERE 
			(untuk = 'semua' AND dari != ".$this->session->userdata('loginSession')['id'].")
			OR 
			untuk = 'admin'
			OR 
			untuk = '".$this->session->userdata('loginSession')['id']."'
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

	/*
	* function untuk menampilkan profil admin, edit
	*/
	function profilAdmin()
	{
		$record['pengguna'] = $this->model->read('pengguna',array('id'=>$this->session->userdata('loginSession')['id']))->result();
		$header['title'] 	= 'Admin - Edit Profil';
		$this->menu['breadcrumb'] = 'Edit Profil';
		$this->menu['active'] 	= 'editProfil';
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/profil',$record);
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
					alert('alert','danger','Gagal!','Edit profil gagal. Password salah');
					redirect('profil-admin');
					return true;
				}else{
// cek apakah password_ ada isinya
					if ($this->input->post('password_') == '') {
						alert('alert','danger','Gagal!','Password baru tidak dimasukkan. Isilah kolom password hanya jika ingin mengganti password');
						redirect('profil-admin');
						return true;
// }else{
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

				if ( ! $this->upload->do_upload('foto')){
					alert('alert','danger','Gagal!',$this->upload->display_errors());
					redirect('profil-admin');
					return false;
				}else{
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
					redirect('profil-admin');
				}else{
					if ($runUpdate->error_message->code == 1062) {
						alert('alert','danger','Gagal!',$runUpdate->error_message->message);
						redirect('profil-admin');
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
				redirect('profil-admin');
			}
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	/*
	* function untuk handle cari penerima, return nama,id,dan email
	*/
	function cariNama()
	{
		if ($this->input->get() != NULL) {
			$dataForm = $this->input->get();
			$dataReturn = $this->model->orLike('pengguna',array('nama'=>$dataForm['term']['term'],'email'=>$dataForm['term']['term']))->result();
			$data = array();
			foreach ($dataReturn as $key => $value) {
				$data[$key]['id'] = $value->id;
				$data[$key]['text'] = $value->nama;
			}
			echo json_encode($data);
		}else{
// redirect('logout');
		}
	}

	/*
	* funtion untuk ubah permasalahan ke beku
	*/
	function setPermasalahanToBeku($id)
	{
		$permasalahan = $this->model->read('permasalahan',array('id'=>$id))->result();
		$this->model->create('notif',
			array(
				'konteks'	=> 'permasalahanDibekukan',
				'id_konteks'=> $permasalahan[0]->id,
				'untuk'		=> $permasalahan[0]->siapa,
				'dari'		=> $this->session->userdata('loginSession')['id'],
				'datetime'	=> date('Y-m-d H:i:s')
			)
		);
		$this->model->delete('notif',
			array(
				'konteks'	=> 'permasalahanDiaktivkan',
				'id_konteks'=> $permasalahan[0]->id,
				'untuk'		=> $permasalahan[0]->siapa,
				'dari'		=> $this->session->userdata('loginSession')['id']
			)
		);

		$update = json_decode($this->model->update('permasalahan',array('id'=>$id),array('beku'=>'INACTIVE')));

		if ($update->status) {
			alert('alert','success','Berhasil!','Permasalahan telah dibekukan');
		}else{
			alert('alert','danger','Gagal!','Kegagalan database : '.$update->error_message->message);
		}
		redirect('kelola-komentar');
	}

	/*
	* funtion untuk ubah permasalahan ke aktiv
	*/
	function setPermasalahanToAktiv($id)
	{
		$permasalahan = $this->model->read('permasalahan',array('id'=>$id))->result();
		$this->model->create('notif',
			array(
				'konteks'	=> 'permasalahanDiaktivkan',
				'id_konteks'=> $permasalahan[0]->id,
				'untuk'		=> $permasalahan[0]->siapa,
				'dari'		=> $this->session->userdata('loginSession')['id'],
				'datetime'	=> date('Y-m-d H:i:s')
			)
		);
		$this->model->delete('notif',
			array(
				'konteks'	=> 'permasalahanDibekukan',
				'id_konteks'=> $permasalahan[0]->id,
				'untuk'		=> $permasalahan[0]->siapa,
				'dari'		=> $this->session->userdata('loginSession')['id']
			)
		);

		$update = json_decode($this->model->update('permasalahan',array('id'=>$id),array('beku'=>'ACTIVE')));

		if ($update->status) {
			alert('alert','success','Berhasil!','Permasalahan telah diaktivkan');
		}else{
			alert('alert','danger','Gagal!','Kegagalan database : '.$update->error_message->message);
		}
		redirect('kelola-komentar');
	}

	/*
	* function untuk tampilkan halaman edit permasalahan
	*/
	function editKontenPermasalahan($id)
	{
		$record['pertanyaan'] = $this->model->read('permasalahan',array('id'=>$id))->result();
		$record['kategori'] = $this->model->readS('kategori')->result();
		$header['title'] 	= 'Admin - Edit Konten Permasalahan';
		$this->menu['breadcrumb'] = 'Edit Konten Permasalahan';
		$this->menu['active'] 	= 'kontenpermasalahan';
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('super/edit-konten-permasalahan',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funtion untuk submit edit Kontenpermasalahan
	*/
	function submitEditKontenPermasalahan()
	{
// update jumlah kategori jika ternyata yang diedit adalah kategorinya hanya dihandle oleh code dibawah ini. untuk add dan delete dihandle oleh trigger
		$permasalahan = $this->model->read('permasalahan',array('id'=>$this->input->post('id')))->result();
		if ($permasalahan[0]->kategori !== $this->input->post('kategori')) {
			$jumlah_jawaban = $this->model->rawQuery("SELECT COUNT(id) AS jumlah_jawaban FROM komentar WHERE permasalahan = ".$permasalahan[0]->id)->result();

			$this->db->set('jumlah_jawaban', '`jumlah_jawaban` + '.$jumlah_jawaban[0]->jumlah_jawaban, FALSE);
			$this->db->set('jumlah_pertanyaan', '`jumlah_pertanyaan`+ 1', FALSE);
			$this->db->where('id', $this->input->post('kategori'));
			$this->db->update('kategori');

			$this->db->set('jumlah_jawaban', '`jumlah_jawaban`- '.$jumlah_jawaban[0]->jumlah_jawaban, FALSE);
			$this->db->set('jumlah_pertanyaan', '`jumlah_pertanyaan`- 1', FALSE);
			$this->db->where('id', $permasalahan[0]->kategori);
			$this->db->update('kategori');

		}
		$update = json_decode($this->model->update('permasalahan',
			array(
				'id'=>$this->input->post('id')
			),
			array(
				'teks'=>$this->input->post('pertanyaan'),
				'kategori'=>$this->input->post('kategori')
			)
		));
		if ($update->status) {
			alert('alert','success','Berhasil!','Permasalahan telah diperbarui');
		}else{
			alert('alert','danger','Gagal!','Kegagalan database : '.$update->error_message->message);
		}
		redirect('edit-konten-permasalahan/'.$this->input->post('id'));
	}

	/*
	* function untuk handle submitkirimpesanp admin 
	*/
	function submitkirimPesan()
	{
		$penerimaS = $this->input->post('penerima[]');
		$subyek = strtoupper($this->input->post('subyek'));
		$teks = $this->input->post('isi_pesan');

// $stringinsertNotif = "INSERT INTO notif ('id','konteks','dari,'untuk','datetime') VALUES ";
		foreach ($penerimaS as $key => $value) {

			$queryInsertDm = $this->model->create_id('direct_message',array('teks'=>$subyek."|".$teks,'dari'=>$this->session->userdata('loginSession')['id'],'untuk'=>$value,'tanggal'=>date("Y-m-d"),'jenis_pesan'=>'pesaninfo'));

			$queryInsertDm = json_decode($queryInsertDm);

			$this->model->create('notif',array(
				'konteks' => 'pesaninfo',
				'id_konteks' => $queryInsertDm->message,
				'dari' => $this->session->userdata('loginSession')['id'],
				'untuk' => $value,
				'datetime' => date('Y-m-d H:i:s')
			));
		}


		if ($this->model->rawQuery($stringInsertPesan)) {
			alert('alert','success','Berhasil!','Pesan info telah terkirim');
			$this->model->rawQuery($stringinsertNotif);
		}else{
			alert('alert','danger','Gagal!','Pesan info gagal dikirim');
		}
		redirect('kelola-pesan-info');
	}


	/*
	* view halaman bantuan
	*/
	function bantuan()
	{
		$header['title'] 			= 'Bantuan';
		$this->menu['breadcrumb'] 	= 'Bantuan';
		$this->menu['active'] 		= 'bantuan';	
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$this->menu);
		$this->load->view('statis/bantuan');
		$this->load->view('statis/footer');
	}

	/*
	* melayani ajax request untuk menghitung prblem solved dalam kurun waktu
	*/
	function getJumlahProblemSolved()
	{
		if ($this->input->get('jangka_waktu') == "hari") {
			$data = $this->model->rawQuery("SELECT DISTINCT permasalahan AS jumlah FROM direct_message WHERE terpecahkan='SOLVED' AND DAY(tanggal) = '".date("d")."' AND MONTH(tanggal) = '".date("m")."' AND YEAR(tanggal) = '".date("Y")."'")->num_rows();
		}elseif ($this->input->get('jangka_waktu') == "bulan") {
			$data = $this->model->rawQuery("SELECT DISTINCT permasalahan AS jumlah FROM direct_message WHERE terpecahkan='SOLVED' AND MONTH(tanggal) = '".date("m")."' AND YEAR(tanggal) = '".date("Y")."'")->num_rows();
		}elseif ($this->input->get('jangka_waktu') == "tahun") {
			$data = $this->model->rawQuery("SELECT DISTINCT permasalahan AS jumlah FROM direct_message WHERE terpecahkan='SOLVED' AND YEAR(tanggal) = '".date("Y")."'")->num_rows();
		}
		echo json_encode($data);
	}

	/*
	* melayani ajax request untuk menghitung uservisits 
	*/
	function getJumlahPengunjung()
	{
		if ($this->input->get('jangka_waktu') == "hari") {
			$data = $this->model->rawQuery("SELECT COUNT(id) AS jumlah FROM log_pengunjung WHERE DAY(tanggal) = '".date("d")."' AND MONTH(tanggal) = '".date("m")."' AND YEAR(tanggal) = '".date("Y")."'")->result();
		}elseif ($this->input->get('jangka_waktu') == "bulan") {
			$data = $this->model->rawQuery("SELECT COUNT(id) AS jumlah FROM log_pengunjung WHERE MONTH(tanggal) = '".date("m")."' AND YEAR(tanggal) = '".date("Y")."'")->result();
		}elseif ($this->input->get('jangka_waktu') == "tahun") {
			$data = $this->model->rawQuery("SELECT COUNT(id) AS jumlah FROM log_pengunjung WHERE YEAR(tanggal) = '".date("Y")."'")->result();
		}
		echo json_encode($data);
	}

	/*
	* melayani ajax request untuk menghitung pengguna baru @ home
	*/
	function getJumlahPenggunaBaru()
	{
		// echo $this->input->get('jangka_waktu');		
		if ($this->input->get('jangka_waktu') == "hari") {
			$data = $this->model->rawQuery("
				SELECT 
				id AS jumlah 
				FROM 
				notif 
				WHERE konteks = 'penggunaBaru' 
				AND DAY(datetime) = '".date("d")."' AND MONTH(datetime) = '".date("m")."' 
				AND YEAR(datetime) = '".date("Y")."'"
			)->num_rows();
		}elseif ($this->input->get('jangka_waktu') == "bulan") {
			$data = $this->model->rawQuery("
				SELECT 
				id AS jumlah 
				FROM notif 
				WHERE konteks = 'penggunaBaru' 
				AND MONTH(datetime) = '".date("m")."' 
				AND YEAR(datetime) = '".date("Y")."'"
			)->num_rows();
		}elseif ($this->input->get('jangka_waktu') == "tahun") {
			$data = $this->model->rawQuery("
				SELECT 
				id AS jumlah 
				FROM notif 
				WHERE konteks = 'penggunaBaru' 
				AND YEAR(datetime) = '".date("Y")."'"
			)->num_rows();
		}
		echo json_encode($data);
	}
}