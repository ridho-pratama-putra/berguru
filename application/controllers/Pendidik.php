<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pendidik extends CI_Controller {
	
	public function __construct(){
		parent::__construct();
		date_default_timezone_set("Asia/Jakarta");
		if ($this->session->userdata('loginSession')['aktor'] !== 'pendidik') {
			redirect('logout');
		}
		// $menu['notif_permasalahan'] = $this->model->read("notif_permasalahan",array("untuk"=>"mahasiswa OR untuk='".$this->session->userdata('loginSession')['id']."'"));

	}

	/*
	* function untuk menampilkan pesan
	*/
	function pesan()
	{
		$header['title'] 		= 'Pendidik - Pesan';
		$menu['breadcrumb'] 	= 'Pesan';
		$menu['active'] 		= 'pesan';
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$menu);
		$this->load->view('tenagapendidik/pesan');
		$this->load->view('statis/footer');
	}

	/*
	* function untuk menampilkan profil
	*/
	function profil(){
		$header['title'] = 'Pendidik - Profil';
		$menu['breadcrumb'] 	= 'Profil';
		$menu['active'] 		= '';
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$menu);
		$this->load->view('tenagapendidik/profil');
		$this->load->view('statis/footer');

	}

	/*
	* function untuk menampilkan pertanyaan saya
	*/
	function pertanyaanSaya()
	{
		$header['title'] = 'Pendidik - Pertanyaan Saya';
		$menu['active'] = 'pertanyaanSaya';
		$menu['breadcrumb'] = 'Pertanyaan Saya';
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
		$this->load->view('tenagapendidik/menu',$menu);
		$this->load->view('tenagapendidik/pertanyaan-saya',$record);
		$this->load->view('statis/footer');
	}

	/*
	* function untuk menampilkan halaman tambah pertanyaan
	*/
	function buatPertanyaan()
	{
		$header['title'] = 'Pendidik - Buat Pertanyaan';
		$menu['active'] = 'pertanyaanSaya';
		$menu['breadcrumb'] = 'Pertanyaan Saya';
		$recordPertanyaan['kategori'] = $this->model->read('kategori',array('status'=>'ACTIVE'))->result();
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$menu);
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
		$menu['active'] = "editProfil";
		$menu['breadcrumb'] = "Edit Profil";
		$this->load->view('statis/header',$header);
		$this->load->view('tenagapendidik/menu',$menu);
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
																			'jumlah_komen'=>'0',
																			'status'=>'UNSOLVED',
																			'beku'=>'ACTIVE'
									));
			$queryPermasalahan = json_decode($queryPermasalahan);
			if ($queryPermasalahan->status) {
				// tell all mahasiswa kalau ada pesan baru. baca dulu id semua pengguna yang bertipe mahasiswa, kalau sudah, masukkan kan ke tabel notidikasi_message
				$insertNotifikasiMessage = $this->model->create('notif_permasalahan',array(
																						'id_permasalahan' => $queryPermasalahan->message,
																						'dari'=>$this->session->userdata('loginSession')['nama'],
																						'untuk'=>'mahasiswa',
																						'datetime'=>date('Y-m-d H:i:s')
																					)
				);

				alert('pertanyaan','success','Berhasil!','Pertanyaan telah di publish');
			}else{
				alert('buatPertanyaan','danger','Gagal!','Pertanyaan tidak dipublish. Kesalahan sistem');
				redirect('buat-pertanyaan');
				return true;
			}
			redirect('pertanyaan-saya');
		}
	}

	/*
	* function untuk get record pesan pada database dengan parameter where adalah seoranga guru tersebut
	*/
	function getPesan()
	{
		if ($this->input->post() != array()) {
			// $recordPesan = $this->model->read('pesan',array('id'=>))	
		}
	}

	/*
	* function untk menghapus pertanyaan
	*/
	function deletePertanyaan(){
		if ($this->input->post() !== array()) {
			$deletePertanyaan = $this->model->delete('permasalahan',array('id'=>$this->input->post('id')));
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
			$recordPengguna = ''; // variabel akan tidak kosong apabila ada perintah update password. untuk simpan record pengguna sebagai pencocokan
			if ($this->input->post('password') !== '') {
				$recordPengguna = $this->model->read('pengguna',array('id'=>$this->input->post('id')))->result();
				if (md5($this->input->post('password')) !== $recordPengguna[0]->password) {
					alert('editProfil','danger','Gagal!','Edit profil gagal. Password salah');
					redirect('edit-profil-pendidik');
					return true;
				}else{
					// cek apakah password_ ada isinya
					if ($this->input->post('password_') == '') {
						alert('editProfil','danger','Gagal!','Password baru tidak dimasukkan. Isilah kolom password hanya jika ingin mengganti password');
						redirect('edit-profil-pendidik');
						return true;
					}else{
						// masukkan password baru ke array untuk bahan eksekusi
						$queryUpdate['password'] = md5($this->input->post('password'));
					}
				}
			}
			
			// cek apakah ada perintah update foto
			if ($_FILES['foto']['name'] !== '') {
				$config['upload_path']	= FCPATH.'userprofiles/';
				$config['allowed_types']= 'gif|jpg|png';
				$config['file_name'] = $this->input->post('nama')." - profil";
				$this->load->library('upload', $config);

				if ( ! $this->upload->do_upload('foto'))
				{
					alert('editProfil','danger','Gagal!',$this->upload->display_errors());
					redirect('edit-profil-pendidik');
					return false;
				}
				else
				{
					$queryUpdate['foto'] = "userprofiles/".$this->upload->data()['file_name'];
				}
			}

			$this->form_validation->set_rules('nama','Nama','trim|required');
			$this->form_validation->set_rules('email','Email','trim|required|valid_email');
			$this->form_validation->set_rules('no_hp','Nomor telepon','trim|required');

			if ($this->form_validation->run() !== FALSE) {
				$queryUpdate['nama'] = ucwords($this->input->post('nama'));
				$queryUpdate['email'] = $this->input->post('email');
				$queryUpdate['no_hp'] = $this->input->post('no_hp');
				$runUpdate = $this->model->update('pengguna',array('id'=>$this->input->post('id')),$queryUpdate);
				$runUpdate = json_decode($runUpdate);

				if ($runUpdate->status) {
					alert('editProfil','success','Barhasil!','Profil telah di perbarui');
					redirect('edit-profil-pendidik');
				}else{
					if ($runUpdate->error_message->code == 1062) {
						alert('editProfil','danger','Gagal!',$runUpdate->error_message->message);
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
				$this->session->set_flashdata('editProfil', $register);
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
}