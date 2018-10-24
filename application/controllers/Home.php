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
				ORDER BY permasalahan.tanggal DESC");
		}
		$record['jumlah'] 		= $record_->num_rows();
		$record['permasalahan'] = $record_->result();

		foreach ($record['permasalahan'] as $key => $value) {
			$record_ = $this->model->rawQuery("
				SELECT 
						pengguna.nama,
						pengguna.foto
				FROM komentar
				LEFT JOIN pengguna ON komentar.siapa = pengguna.id
				WHERE permasalahan = '".$value->id."'
				ORDER BY komentar.tanggal DESC
				")->result();
			$record['permasalahan'][$key]->komentator = $record_;
		}
		echo json_encode($record);
	}
}