<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
		$this->load->helper(array('Cookie', 'String'));
	}
	
	/*
	* function untuk view halaman login
	*/
	function login()
	{
		if ($this->session->userdata('registrasiSession') != array()) {
			alert('login','warning','Perhatian!','Mohon Lanjutkan Pendaftaran');
			redirect('register-pilih');
		}else{
			$cookie = get_cookie('berguru');
			if ($this->session->userdata('loginSession') == array() AND $cookie == '') {
				if ($this->input->post() != array()) {
					$cekLogin = $this->model->read('pengguna',array('email'=>$this->input->post('email'),'password'=>md5($this->input->post('password'))));
					if ($cekLogin->num_rows() == 1) {
						$recordPengguna = $cekLogin->result();
						if ($recordPengguna[0]->status == 'ACTIVE') {

							if ($this->input->post('remember')) {
								$key = random_string('alnum', 64);
								set_cookie('berguru', $key, 3600*24*30);
								$this->model->update('pengguna',array('id'=>$recordPengguna[0]->id),array('cookie'=>$key));
								// get_cookie('berguru');
							}
							
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
							$this->model->create("log_pengunjung",array('pengunjung' => $recordPengguna[0]->id,'tanggal'=>date("Y-m-d H:i:s")));
							if ($recordPengguna[0]->aktor == "admin") {
								alert('alert','success','Hai Admin '.$recordPengguna[0]->nama.'!','Selamat datang di Berguru.com');
								redirect('dashboard-admin');
								return true;
							}elseif ($recordPengguna[0]->aktor == "mahasiswa") {
								alert('alert','success','Hai '.$recordPengguna[0]->nama.'!','Selamat datang di Berguru.com');
								redirect('dashboard-mahasiswa');
								return true;
							}elseif ($recordPengguna[0]->aktor == "pendidik") {
								alert('alert','success','Hai '.$recordPengguna[0]->nama.'!','Selamat datang di Berguru.com');
								redirect('dashboard-pendidik');
								return true;
							}
						}else{
							alert("alert","danger","Gagal!","Akun anda dalam status dibekukan, mohon hubungi admin. Terimakasih.");
							redirect("login");
							return true;
						}
					}else{
						alert("alert","danger","Gagal!","Akun tidak terdaftar. Daftar <a href='".base_url()."register'>disini</a>");
						redirect("login");
						return true;
					}
				}
			}elseif($this->session->userdata('loginSession') != array()){				
				if ($this->session->userdata('loginSession')['aktor'] == "mahasiswa") {
					redirect('pesan-mahasiswa');
				}elseif ($this->session->userdata('loginSession')['aktor'] == "pendidik") {
					redirect('pesan-pendidik');
				}elseif ($this->session->userdata('loginSession')['aktor'] == "admin") {
					redirect('kelola-daftar-message');
				}
			}elseif ($this->session->userdata('loginSession') == array() AND $cookie != '') {
				$recordCookieAktif = $this->model->read('pengguna',array('cookie'=>$cookie))->result();
				if ($recordCookieAktif[0]->cookie == $cookie) {
					$newdata = array(
						'id'     					=> $recordCookieAktif[0]->id,
						'nama'  					=> $recordCookieAktif[0]->nama,
						'email'     				=> $recordCookieAktif[0]->email,
						'no_hp'     				=> $recordCookieAktif[0]->no_hp,
						'aktor'     				=> $recordCookieAktif[0]->aktor,
						'institusi_or_universitas'  => $recordCookieAktif[0]->institusi_or_universitas,
						'nip_or_nim'  				=> $recordCookieAktif[0]->nip_or_nim,
						'status'  					=> $recordCookieAktif[0]->status,
						'foto'						=> base_url().$recordCookieAktif[0]->foto
					);
					$this->session->set_userdata('loginSession',$newdata);
					if ($recordCookieAktif[0]->aktor == 'mahasiswa') {
						alert('alert','success','Hai '.$recordCookieAktif[0]->nama.'!','Selamat datang kembali di Berguru.com');
						redirect('dashboard-mahasiswa');
					}elseif($recordCookieAktif[0]->aktor == 'pendidik') {
						alert('alert','success','Hai '.$recordCookieAktif[0]->nama.'!','Selamat datang kembali di Berguru.com');
						redirect('dashboard-pendidik');
					}elseif($recordCookieAktif[0]->aktor == 'admin') {
						alert('alert','success','Hai Admin '.$recordCookieAktif[0]->nama.'!','Selamat datang kembali di Berguru.com');
						redirect('kelola-daftar-message');
					}
				}
			}
			$header['title'] = "Login";
			$this->load->view("statis_/header",$header);
			$this->load->view("auth/login");
			$this->load->view("statis_/footer");
		}
	}

	/*
	* function untuk view halaman register,hanya jika belum ada sesi registrasiSession. jika ada sesion registrasiSession alive, maka redirect ke registrasiSession-pilih
	* sekaligus dengan funtion untukhandle form pada halaman tersebut. agar tidak ganti url pada saat form validation menghasilkan eror
	*/
	function register()
	{
		$this->session->unset_userdata('loginSession');
		if ($this->session->userdata('registrasiSession') != array()) {
			alert('alert','warning','Perhatian!','Mohon Lanjutkan Pendaftaran');
			redirect('register-pilih');
		}else{
			if ($this->input->post() != array()) {
				$this->form_validation->set_rules('nama','Nama','trim|required|is_unique[pengguna.nama]|callback_fullname_check');
				$this->form_validation->set_rules('email','Email','trim|required|valid_email|is_unique[pengguna.email]');
				$this->form_validation->set_rules('password','Password','trim|required');
				if ($this->form_validation->run()==TRUE) {
					$email			= $this->input->post('email');
					$nama			= ucwords($this->input->post('nama'));
					$alias 			= '';
					$password		= md5($this->input->post('password'));

					/* START generate alias*/
					$explode = explode(" ", $nama);
					$temp_alias = '';
					foreach ($explode as $key => $value) {
						$temp_alias .= $value." ";
						if (strlen($temp_alias) <= 20) {
							$alias .= $valueA;
							if ($keyA !== (sizeof($explode)-1)) {
								$alias .=" ";
							}
						}
					}
					if (strlen($alias) < 20) {
						$alias .= substr($explode[$key], 0,1);
					}
					/* END generate alias*/

					$newdata = array(
						'nama'  					=> $nama,
						'alias'  					=> $alias,
						'email'     				=> $email,
						'password'     				=> $password,
						'masih_proses_registrasi' 	=> TRUE
					);

					$sesi = $this->session->set_userdata('registrasiSession',$newdata);
					redirect('register-pilih');
				}else{
					$register = validation_errors("<div class='alert alert-warning alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>",
						'</div>');
					$this->session->set_flashdata('register', $register);
				}
			}
			$header['title'] = "Daftar";
			$this->load->view("statis_/header",$header);
			$this->load->view("auth/register");
			$this->load->view("statis_/footer");
		}
	}

	/*
	* function untuk view halaman register-pilih,hanya jika sudah ada sesi registrasiSession. jika belum ada sesion registrasiSession alive, maka redirect ke register
	*/
	function registerPilih()
	{
		if ($this->session->userdata('registrasiSession') == array()) {
			alert('alert','warning','Perhatian!','Mohon memulai sesi pendaftaran');
			redirect('register');
		}else{
			$header['title'] = "Daftar";
			$this->load->view("statis_/header",$header);
			$this->load->view("auth/register-pilih");
			$this->load->view("statis_/footer");
		}
	}

	/*
	* function untuk form register-pilih-proses pada halaman register-pilih
	*/
	function registerPilihProses()
	{
		if ($this->input->post() != array()) {
			$recordPengguna 			= $this->session->userdata('registrasiSession');
			$recordPengguna['aktor']	= $this->input->post('profesi');
			$recordPengguna['status']	= 'DIBEKUKAN';
			$recordPengguna['foto']		= 'assets/dashboard/assets/images/reading.png';
			$recordPengguna['report']	= 0;
			$recordPengguna['poin']	= 0;
			$recordPengguna['jumlah_dm_solved']	= 0;
			$recordPengguna['jumlah_dm']	= 0;

			// hilangkan indeksmasih_proses_registrasiSession agar bisa masuk db. karena tidak ada kolom tersebut pada db
			unset($recordPengguna['masih_proses_registrasi']);

			// create record
			$queryPengguna = $this->model->create_id('pengguna',$recordPengguna);


			$queryPengguna = json_decode($queryPengguna);
			// var_dump($queryPengguna);die();
			// insert ke tabel max_notif_id_per_user
			$this->model->create_id('max_notif_id_per_user',array('id_pengguna'=>$queryPengguna->message,'max_notif_id'=>0));
			$this->model->create('subscriber',array('email'=>$recordPengguna['email']));
			
			if ($queryPengguna->status) {
				$this->session->unset_userdata('registrasiSession');
				alert("alert","success","Berhasil!","Anda berhasil registrasi, mohon hubungi admin untuk mengaktifkan akun. Terimakasih.");
			}else{
				alert('alert','danger','Gagal!','Kegagalan database. Data tidak dapat masuk');
			}

			// create alert untuk admin kalau ada pengguna yang harus diaktifkan
			$this->model->create('notif',array('konteks'=>'penggunaBaru','dari'=>$queryPengguna->message,'untuk'=>'admin','datetime'=>date('Y-m-d H:i:s')));
			redirect('login');
		}else{
			$error['heading'] = '404 Page Not Found';
			$error['message'] = '<p>Tidak ada data yang di POST</p>';
			$this->load->view('errors/html/error_404',$error);
		}
	}

	function logout()
	{
		delete_cookie('berguru');
		$this->session->unset_userdata('registrasiSession');
		$this->session->unset_userdata('loginSession');
		redirect(base_url());
	}

	/*
	* FUNCTION UNTUK FORM VALIDATION NAMA
	*/
	public function fullname_check($str) {
		if (! preg_match("/^([a-z ])+$/i", $str)) {
			$this->form_validation->set_message('fullname_check', 'The %s field can only be alphabetic');
			return FALSE;
		} else {
			return TRUE;
		}
	}
}
// UNSET THINGS
// $this->session->unset_userdata('sesi');
// var_dump($this->session->userdata('sesi'));