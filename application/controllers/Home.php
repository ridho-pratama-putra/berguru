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
		$record['lowongan'] = $this->model->readS('lowongan')->result();
		$this->load->view("home/header");
		$this->load->view("home/menu",$record);
		$this->load->view("home/home",$record);
		$this->load->view("home/footer");
	}

	/*
	* function untuk get data di datatabase tergantung kategori melalui tombol tabs.dipanggil di halaman home awal banget
	*/
	function getPertanyaan()
	{
		if ($this->input->get('kategori') == 'all') {
			$record_ = $this->model->rawQuery("
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
			");
		}elseif($this->input->get('kategori') == 'populer'){
			$record_ = $this->model->rawQuery("
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
			 	ORDER BY jumlah_komen LIMIT 4
			 ");
		}else{
			$record_ = $this->model->rawQuery("
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
				WHERE permasalahan.status = '".$this->input->get('kategori')."' 
				ORDER BY permasalahan.tanggal ");
		}
		$record['jumlah'] 		= $record_->num_rows();
		$record['permasalahan'] = $record_->result();

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
}