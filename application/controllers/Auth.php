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

							if ($recordPengguna[0]->aktor == "admin") {
								alert('kelolaPengguna','success','Hai Admin '.$recordPengguna[0]->nama.'!','Selamat datang di Berguru.com');
								redirect('kelola-pengguna');
								return true;
							}elseif ($recordPengguna[0]->aktor == "mahasiswa") {
								alert('login','success','Hai '.$recordPengguna[0]->nama.'!','Selamat datang di Berguru.com');
								redirect('dashboard-mahasiswa');
								return true;
							}elseif ($recordPengguna[0]->aktor == "pendidik") {
								alert('login','success','Hai '.$recordPengguna[0]->nama.'!','Selamat datang di Berguru.com');
								redirect('pesan-pendidik');
								return true;
							}
						}else{
							alert("login","danger","Gagal!","Akun anda dalam status dibekukan, mohon hubungi admin. Terimakasih.");
							redirect("login");
							return true;
						}
					}else{
						alert("login","danger","Gagal!","Akun tidak terdaftar. Daftar <a href='".base_url()."register'>disini</a>");
						redirect("login");
						return true;
					}
				}
			}elseif($this->session->userdata('loginSession') != array()){
				if ($cookie !== NULL) {
					// cek adakah cookie ada yang sedang aktif
					$recordCookieAktif = $this->model->read('pengguna',array('cookie'=>$cookie))->result();
					if ($recordCookieAktif[0]->cookie == $cookie) {
						if ($recordCookieAktif[0]->aktor == 'mahasiswa') {
							alert('login','success','Hai '.$recordCookieAktif[0]->nama.'!','Selamat datang kembali di Berguru.com');
							redirect('pesan-mahasiswa');
							return true;
						}elseif($recordCookieAktif[0]->aktor == 'pendidik') {
							alert('login','success','Hai '.$recordCookieAktif[0]->nama.'!','Selamat datang kembali di Berguru.com');
							redirect('pesan-pendidik');
							return true;
						}elseif($recordCookieAktif[0]->aktor == 'admin') {
							alert('login','success','Hai Admin '.$recordCookieAktif[0]->nama.'!','Selamat datang kembali di Berguru.com');
							redirect('kelola-daftar-message');
							return true;
						}
					}
				}else{
					if ($this->session->userdata('loginSession')['aktor'] == "mahasiswa") {
						redirect('pesan-mahasiswa');
						return true;
					}elseif ($this->session->userdata('loginSession')['aktor'] == "pendidik") {
						redirect('pesan-pendidik');
						return true;
					}elseif ($this->session->userdata('loginSession')['aktor'] == "admin") {
						redirect('kelola-daftar-message');
						return true;
					}
				}
			}
			$this->load->view("statis_/header");
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
			alert('registerPilih','warning','Perhatian!','Mohon Lanjutkan Pendaftaran');
			redirect('register-pilih');
		}else{
			if ($this->input->post() != array()) {
				$this->form_validation->set_rules('nama','Nama','trim|required|is_unique[pengguna.nama]');
				$this->form_validation->set_rules('email','Email','trim|required|valid_email|is_unique[pengguna.email]');
				$this->form_validation->set_rules('password','Password','trim|required');
				if ($this->form_validation->run()==TRUE) {
					$email			= $this->input->post('email');
					$nama			= ucwords($this->input->post('nama'));
					$password		= md5($this->input->post('password'));
					$newdata = array(
					        'nama'  					=> $nama,
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
			$this->load->view("statis_/header");
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
			alert('register','warning','Perhatian!','Mohon memulai sesi pendaftaran');
			redirect('register');
		}else{
			$this->load->view("statis_/header");
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
			
			if ($queryPengguna->status) {
				$this->session->unset_userdata('registrasiSession');
				alert("login","success","Berhasil!","Anda berhasil registrasi, mohon hubungi admin untuk mengaktifkan akun. Terimakasih.");
			}else{
				alert('register','danger','Gagal!','Kegagalan database. Data tidak dapat masuk');
			}

			// create alert untuk admin kalau ada pengguna yang harus diaktifkan
			$this->model->create('notif',array('konteks'=>'penggunaBaru','dari'=>$queryPengguna->message,'untuk'=>'admin','datetime'=>date('Y-m-d H:i:s'),'terlihat'=>0,'terbaca'=>0));
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
}
// UNSET THINGS
// $this->session->unset_userdata('sesi');
// var_dump($this->session->userdata('sesi'));