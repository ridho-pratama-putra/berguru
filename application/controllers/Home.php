<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
	}

	/*
	* function untuk menampilkan view halaman utama
	*/
	function home()
	{
		$record['kategori'] = $this->model->readS('kategori')->result();
		$record['lowongan'] = $this->model->rawQuery('SELECT * FROM lowongan WHERE valid=1 ORDER BY tanggal LIMIT 3 ')->result();
		$record['materi'] = $this->model->rawQuery('
													SELECT 
														materi.deskripsi,
														materi.waktu_terakhir_edit,
														materi.nama,
														materi.jumlah_diunduh,
														materi.jumlah_dilihat,
														materi.ikon_cat,
														materi.ikon_logo,
														materi.ikon_warna,
														pengguna.nama AS siapa_terakhir_edit
														
													FROM materi 
													INNER JOIN pengguna ON pengguna.id = materi.siapa_terakhir_edit
													ORDER BY materi.waktu_terakhir_edit 
													LIMIT 5')->result();

		$record['pertanyaan_solved'] = $this->model->rawQuery("SELECT COUNT(id) AS id FROM permasalahan WHERE status = 'SOLVED'")->result();

		// ranking mahasiswa dipindah ke ajax request
		// $record['mahasiswa_poin_tertinggi'] = $this->model->rawQuery("
		// 															SELECT
		// 																DISTINCT pengguna.nama,pengguna.poin,pengguna.foto,
		// 																(SELECT count(komentar.siapa) FROM komentar WHERE komentar.siapa = pengguna.id ) AS jumlah_komentar
		// 															FROM pengguna
		// 															RIGHT JOIN komentar ON pengguna.id = komentar.siapa
		// 															WHERE pengguna.aktor = 'mahasiswa'
		// 															ORDER BY pengguna.poin 
		// 															DESC Limit 5")->result();
		$menu['active'] =	"home";
		$menu['kategori'] =	$record['kategori'];
		$this->load->view("home/header");
		$this->load->view("home/menu",$menu);
		$this->load->view("home/home",$record);
		$this->load->view("home/footer");
	}

	/*
	* funtion untuk menamplkan rangking mahasiswa berdsaarkan poin yang didapat. untuk melayani request dari ajax
	*/
	function getMahasiswaPoinTertinggi(){
		$record['data'] = $this->model->rawQuery("
																	SELECT
																		DISTINCT pengguna.nama,pengguna.poin,pengguna.foto,
																		(SELECT count(komentar.siapa) FROM komentar WHERE komentar.siapa = pengguna.id ) AS jumlah_komentar
																	FROM pengguna
																	RIGHT JOIN komentar ON pengguna.id = komentar.siapa
																	WHERE pengguna.aktor = 'mahasiswa'
																	ORDER BY pengguna.poin 
																	DESC Limit ". $this->input->get('limit'))->result();
		$record['dm_available'] = $this->session->userdata('loginSession');
		echo json_encode($record);
	}

	/*
	* funtuin untuk menangani ajax request daftar materi berdsarkan jangka waktu perbulan perhari
	*/
	function getMateri()
	{
		$string = 	"SELECT 
						materi.deskripsi,
						materi.waktu_terakhir_edit,
						materi.nama,
						materi.jumlah_diunduh,
						materi.jumlah_dilihat,
						materi.ikon_cat,
						materi.ikon_logo,
						materi.ikon_warna,
						pengguna.nama AS siapa_terakhir_edit
						
					FROM materi 
					INNER JOIN pengguna ON pengguna.id = materi.siapa_terakhir_edit ";
		$date = new DateTime(date("Y-m-d"));
		if ($this->input->get('jangka_waktu') == "hari") {
			$string .= "WHERE DAY(materi.waktu_terakhir_edit) = '".$date->format("d")."' AND MONTH(materi.waktu_terakhir_edit) = '".$date->format("m")."' AND YEAR(materi.waktu_terakhir_edit) = '".$date->format("Y")."'";
		}elseif ($this->input->get('jangka_waktu') == "bulan") {
			$string .= "WHERE MONTH(materi.waktu_terakhir_edit) = '".$date->format("m")."' AND YEAR(materi.waktu_terakhir_edit) = '".$date->format("Y")."'";
		}elseif ($this->input->get('jangka_waktu') == "bulan_lalu") {
			$string .= "WHERE MONTH(materi.waktu_terakhir_edit) = '".($date->format("m")-1)."' AND YEAR(materi.waktu_terakhir_edit) = '".$date->format("Y")."'";
		}
		$string .= " ORDER BY materi.waktu_terakhir_edit LIMIT ".$this->input->get('limit');

		$record['data'] = $this->model->rawQuery($string)->result();
		echo json_encode($record);
	}

	/*
	* function untuk get data di datatabase tergantung kategori melalui tombol tabs.dipanggil di halaman home awal banget
	*/
	function getPertanyaan()
	{
		$query = "SELECT
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
				LEFT JOIN kategori ON permasalahan.kategori = kategori.id";
		if ($this->input->get('kategori') == '') {
			if ($this->input->get('tipe') == 'all') {
				$query .= " ORDER BY permasalahan.tanggal DESC LIMIT 4";
			}elseif($this->input->get('tipe') == 'populer'){
				$query.= " ORDER BY permasalahan.jumlah_komen DESC LIMIT 4";
			}elseif($this->input->get('tipe') == 'solved' || $this->input->get('tipe') == 'unsolved'){
				$query .= " WHERE permasalahan.status = '".$this->input->get('tipe')."' ORDER BY permasalahan.tanggal DESC LIMIT 4";
			}
			$record['jumlah'] 		= $this->model->readSCol("permasalahan",['id'])->num_rows();
		}else{
			if ($this->input->get('tipe') == 'all') {
				$query .= " WHERE permasalahan.kategori = '".$this->input->get('kategori')."' ORDER BY permasalahan.tanggal DESC";
			}elseif($this->input->get('tipe') == 'populer'){
				$query .= " WHERE permasalahan.kategori = '".$this->input->get('kategori')."' ORDER BY permasalahan.jumlah_komen DESC";
			}elseif($this->input->get('tipe') == 'solved' || $this->input->get('tipe') == 'unsolved'){
				$query .= " WHERE permasalahan.kategori = '".$this->input->get('kategori')."' AND permasalahan.status = '".$this->input->get('tipe')."' ORDER BY permasalahan.tanggal DESC";
			}
			$record['jumlah'] 		= $this->model->rawQuery($query)->num_rows();
		}

		$record['permasalahan'] = $this->model->rawQuery($query)->result();
		$record['data_login'] = $this->session->userdata('loginSession')['id'];

		foreach ($record['permasalahan'] as $key => $value) {
			$record['permasalahan'][$key]->komentator = $this->getPenjawab($value->id)['foto_nama'];
			$record['permasalahan'][$key]->remaining_penjawab = $this->getPenjawab($value->id)['remaining_penjawab'];
		}
		echo json_encode($record);
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
	* function untuk melihat detail kategori mapel di halaman home. untuk mencari pertanyaan setiap kategori seperti matematika, kimia,dll
	*/
	function mapel()
	{
		$namaKategori = $this->input->get('q');
		$kategori = $this->model->read("kategori",array('nama'=>$namaKategori));
		if ($kategori->num_rows() == 1) {
			$menu['active'] 	=	"kategori";
			$menu['selected_kategori'] 	=	$kategori->result();
			$menu['kategori'] = $this->model->readS("kategori")->result();
			$record['kategori'] = $menu['selected_kategori'];

			$this->load->view("home/header");
			$this->load->view("home/menu_per_kategori",$menu);
			$this->load->view("home/kategori",$record);
			$this->load->view("home/footer");	
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = "<p>Data tidak ditemukan. Klik <a href='".base_url()."'>disini</a></p>";
			$this->load->view('errors/html/error_404',$error);
		}
	}
}