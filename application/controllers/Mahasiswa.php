<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
		if ($this->session->userdata('loginSession')['aktor'] !== 'mahasiswa') {
			redirect(base_url().'logout');
		}

		$this->menu = array();
		$this->notifikasiMenu();
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
		$this->menu['active'] = "Pesan";
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
		$this->load->view('statis/header',$header);
		$this->load->view('mahasiswa/menu',$this->menu);
		$this->load->view('mahasiswa/edit-profil',$record);
		$this->load->view('statis/footer');
	}


	/*
	* funtion untuk pesan icon angka pada icon amplop
	*/
	function notifikasiMenu()
	{
		/*UNTUK PARA MAHASISWA*/
		
		// baca notif untuk para mahasiswa
		$notif_mahasiswa = $this->model->rawQuery("SELECT  id, dari,  untuk, datetime FROM notif_permasalahan WHERE untuk='mahasiswa' ORDER BY datetime DESC LIMIT 4")->result();

		// baca notif yang untuk para mahasiswa yang sudah terlihat untuk dikoreksi dengan notifikasi untuk para mahasiswa
		$notif_mahasiswa_terlihat = $this->model->rawQuery("SELECT id_notif FROM notif_per_user WHERE terlihat = '1' AND id_pengguna='".$this->session->userdata('loginSession')['id']."' ")->result_array();


		// baca notif yang untuk para mahasiswa yang sudah terbaca untuk dikoreksi dengan notifikasi untuk para mahasiswa
		$notif_mahasiswa_terbaca = $this->model->rawQuery("SELECT id_notif FROM notif_per_user WHERE terbaca = '1' AND id_pengguna='".$this->session->userdata('loginSession')['id']."' ")->result();

		// array matang untuk dikirim ke menu
		$notif_ = array();

		foreach ($notif_mahasiswa as $key => $value) {
			$notif_[$key] = $notif_mahasiswa[$key];
			if ($this->in_array_r($notif_[$key]->id,$notif_mahasiswa_terlihat)) {
				$notif_[$key]->terlihat = 'sudah';
				if ($this->in_array_r($notif_[$key]->id,$notif_mahasiswa_terbaca)) {
					$notif_[$key]->terbaca = 'sudah';
				}else{
					$notif_[$key]->terbaca = 'belum';
				}
			}else{
				$notif_[$key]->terlihat = 'belum';
			}
		}

		unset($notif_mahasiswa);unset($notif_mahasiswa_terlihat);unset($notif_mahasiswa_terbaca);

		// array noti_ siap dikirim ke menu
		$this->menu['notif_message_mahasiswa'] = $notif_;

		/*END UNTUK PARA MAHASISWA*/


		/*UNTUK PER MAHASISWA*/

		// baca notif yang untuk masing-masing user yang belum terlihat untuk generate icon angka pada icon amplop
		$this->menu['notif_message_individu_terlihat'] = $this->model->rawQuery("SELECT  id, dari, untuk, datetime FROM notif_permasalahan WHERE untuk='".$this->session->userdata('loginSession')['id']."' AND terlihat='0' ORDER BY datetime LIMIT 4")->result();

		// baca notif yang untuk masing-masing user yang belum terlihat untuk generate icon angka pada icon amplop
		$this->menu['notif_message_individu_terbaca'] = $this->model->rawQuery("SELECT  id, dari, untuk, datetime FROM notif_permasalahan WHERE untuk='".$this->session->userdata('loginSession')['id']."' AND terbaca='0' ORDER BY datetime LIMIT 4")->result();

		/*UNTUK PER MAHASISWA*/
		// echo "<pre>";
		// var_dump($this->menu);

	}
}