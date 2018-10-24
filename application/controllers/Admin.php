<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
		if ($this->session->userdata('loginSession')['aktor'] !== 'admin') {
			redirect(base_url().'logout');
		}
	}

	/*
	* function untuk menampilkan daftar kategori konten
	*/
	function kelolaKategoriKonten()
	{
		$data['kategori'] 	= $this->model->readS('kategori')->result();
		$header['title'] 	= 'Kelola Kategori Konten';
		$menu['breadcrumb'] = 'Kelola Kategori Konten';
		$menu['active'] 	= 'kategorikonten';
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$menu);
		$this->load->view('super/kelola-kategori-konten',$data);
		$this->load->view('statis/footer');
	}

	/*
	* function untuk menampilkan Daftar Message
	*/
	function kelolaDaftarMessage($dataCondition){
		$header['title'] 	= 'Kelola Daftar Message';
		$menu['breadcrumb'] = 'Kelola Daftar Message';
		$menu['active'] 	= 'daftarmessage';
		$menu['sort_active']= $dataCondition;
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$menu);
		$this->load->view('super/kelola-daftar-message');
		$this->load->view('statis/footer');

	}

	/*
	* 
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
		$menu['breadcrumb'] = 'Kelola Komentar';
		$menu['active'] 	= 'komentar';
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
			')->result();
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$menu);
		$this->load->view('super/kelola-komentar',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funtion untuk menapmpilkan halaman kelola konten permasalahan
	*/
	function kelolaKontenPermasalahan()
	{
		$header['title'] 	= 'Kelola Konten Permasalahan';
		$menu['breadcrumb'] = 'Kelola Konten Permasalahan';
		$menu['active'] 	= 'kontenpermasalahan';
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
		$this->load->view('super/menu',$menu);
		$this->load->view('super/kelola-konten-permasalahan',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funtion untuk menapmpilkan halaman kelola materi
	*/
	function kelolaMateri()
	{
		$header['title'] 	= 'Kelola Materi';
		$menu['breadcrumb'] = 'Kelola Materi';
		$menu['active'] 	= 'materi';
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
		$this->load->view('super/menu',$menu);
		$this->load->view('super/kelola-materi',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funstion untuk menamoilkjan halaman kelola pengguna
	*/
	function kelolaPengguna()
	{
		$header['title'] 	= 'Kelola Pengguna';
		$menu['breadcrumb'] = 'Kelola Pengguna';
		$menu['active'] 	= 'pengguna';

		$record['mahasiswa'] = $this->model->read('pengguna',array('aktor'=>'mahasiswa'))->result();
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$menu);
		$this->load->view('super/kelola-pengguna',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funciton untuk menampilkan halaman kelola pesan indfo
	*/
	function kelolaPesanInfo()
	{
		$header['title'] 	= 'Kelola Pesan Info';
		$menu['breadcrumb'] = 'Kelola Pesan Info';
		$menu['active'] 	= 'pesaninfo';
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$menu);
		$this->load->view('super/kelola-pesan-info');
		$this->load->view('statis/footer');
	}

	/*
	* funciton untuk menampilkan halaman kelola tenaga pendidik
	*/
	function kelolaTenagaPendidik()
	{
		$header['title'] 	= 'Kelola Tenaga Pendidik';
		$menu['breadcrumb'] = 'Kelola Tenaga Pendidik';
		$menu['active'] 	= 'tenagapendidik';
		$record['tenagapendidik']=$this->model->read('pengguna',array('aktor'=>'pendidik'))->result();
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$menu);
		$this->load->view('super/kelola-tenaga-pendidik',$record);
		$this->load->view('statis/footer');
	}

	/*
	* funciton untuk menampilkan halaman kelola lowongan kerja
	*/
	function kelolaLowonganKerja()
	{
		$header['title'] 	= 'Kelola Lowongan Kerja';
		$menu['breadcrumb'] = 'Kelola Lowongan Kerja';
		$menu['active'] 	= 'lowongan';
		$this->load->view('statis/header',$header);
		$this->load->view('super/menu',$menu);
		$this->load->view('super/kelola-lowongan-kerja');
		$this->load->view('statis/footer');
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
																		'icon'					=> $this->input->post('icon'),
																		'status'				=> $this->input->post('status'),
																		'jumlah_pertanyaan'		=> 0,
																		'jumlah_jawaban'		=> 0,
																		'tanggal' 				=> date('Y-m-d'),
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
		redirect(base_url().'kelola-kategori-konten');
	}

	/*
	* function untuk menangani edit kategori pada halaman kelolakategorikonten
	*/
	function editKategoriKonten()
	{
		redirect(base_url().'kelola-kategori-konten');
	}


	/*
	* function untuk menangani hapus kategori pada halaman kelolakategorikonten
	*/
	function deleteKategoriKonten()
	{
		if ($this->input->post() !== array()) {
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
		if ($this->input->post() !== array()) {
			$deletePengguna = $this->model->delete('pengguna',array('id'=>$this->input->post('id')));
			if ($deletePengguna) {
				alert('kelolaPengguna','success','Berhasil!','Pengguna telah dihapus');
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
		if ($this->input->post() !== array()) {
			$ubahStatus = $this->model->update('pengguna',array('id'=>$this->input->post('id')),array('status'=>$this->input->post('status')));
			$ubahStatus = json_decode($ubahStatus);
			if ($this->input->post('status') == 'ACTIVE') {
				if ($ubahStatus->status) {
					alert('kelolaPengguna','success','Berhasil!','Status Pengguna telah diaktifkan');
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
		if ($this->input->post() !== array()) {
			$deleteTenagaPendidik = $this->model->delete('pengguna',array('id'=>$this->input->post('id')));
			if ($deleteTenagaPendidik) {
				alert('kelolaTenagaPendidik','success','Berhasil!','Tenaga Pendidik telah dihapus');
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
		if ($this->input->post() !== array()) {
			$ubahStatus = $this->model->update('pengguna',array('id'=>$this->input->post('id')),array('status'=>$this->input->post('status')));
			$ubahStatus = json_decode($ubahStatus);
			if ($this->input->post('status') == 'ACTIVE') {
				if ($ubahStatus->status) {
					alert('kelolaTenagaPendidik','success','Berhasil!','Status tenaga pendidik telah diaktifkan');
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
		if ($this->input->post() !== array()) {
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
		if ($this->input->post() !== array()) {
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
			echo "<pre>";
			$queryMateri['nama'] 		= $this->input->post('nama');
			$queryMateri['kategori'] 	= $this->input->post('kategori');
			$tags 			 			= $this->input->post('tags');
			$tags 						= explode(",", $tags);
			$file				 		= $this->input->post('file[]');
			$queryMateri['deskripsi'] 	= $this->input->post('deskripsi');
			$queryMateri['waktu_terakhir_edit'] = date('Y-m-d');

			$config['upload_path']          = FCPATH.'/materi/';
   //          $config['allowed_types']        = 'docx|doc|xls|pdf|xlsx';

   //          $this->load->library('upload', $config);
			
			// $insertMateri = $this->model->create_id('materi',$queryMateri);
			// $insertMateri = json_decode($insertMateri);


			// if (TRUE) {
			// if ($insertMateri->status) {
				// insert batch ke tabel attachment
				// if ($file != array()) {
					// $queryAttachment = 'INSERT INTO attachment VALUES ';
					// foreach ($file as $key => $value) {
						// var_dump($value);
					// }
				// }

				// insert batch ke tabel tags, untuk menyimpan tag yang tertau pada setiap materi
				// $queryTags = 'INSERT INTO tags VALUES ';
				// foreach ($tags as $key => $value) {
				// 	$queryTags .= "(NULL,'".$insertMateri->message."','".$value."'),";
				// }
				// $queryTags =  rtrim($queryTags,", ");
				// $insertTags = $this->model->rawQuery($queryTags);
			// }
			die();
		}else{

		}
	}
}
