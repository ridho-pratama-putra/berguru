<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['default_controller'] = 'Home/home';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

/*******************************************************Home****************************************************************/
$route['home']						= 'Home/home';
$route['kategori-pertanyaan']	= 'Home/getPertanyaan';
/*******************************************************END AUTH****************************************************************/

/*******************************************************AUTH****************************************************************/
$route['login']						= 'Auth/login/';
$route['logout']					= 'Auth/logout/';
$route['register']					= 'Auth/register/';
$route['register-proses']			= 'Auth/registerProses/';
$route['register-pilih']			= 'Auth/registerPilih/';
$route['register-pilih-proses']		= 'Auth/registerPilihProses/';
/*******************************************************END AUTH****************************************************************/

/*****************************************************BEGIN ADMIN*****************************************************/
$route['profil-admin']				= 'Admin/profilAdmin/';


$route['kelola-daftar-message']			= 'Admin/kelolaDaftarMessage/';
$route['kelola-daftar-message-all']		= 'Admin/getDaftarMessage/all';
$route['kelola-daftar-message-solved']	= 'Admin/getDaftarMessage/solved';
$route['kelola-daftar-message-unsolved']= 'Admin/getDaftarMessage/unsolved';

$route['kelola-kategori-konten'] 	= 'Admin/kelolaKategoriKonten';
$route['submit-tambah-kategori'] 			= 'Admin/tambahKategoriKonten';
$route['edit-kategori'] 			= 'Admin/editKategoriKonten';
$route['delete-kategori'] 			= 'Admin/deleteKategoriKonten';

$route['kelola-komentar']			= 'Admin/kelolaKomentar';

$route['kelola-konten-permasalahan']= 'Admin/kelolaKontenPermasalahan';
$route['delete-permasalahan']		= 'Admin/deletePermasalahan';

$route['kelola-materi']				= 'Admin/kelolaMateri';
$route['tambah-materi']				= 'Admin/tambahMateri';
$route['delete-materi/(:num)']		= 'Admin/deleteMateri/$1';

$route['kelola-pengguna']			= 'Admin/kelolaPengguna';
$route['delete-pengguna']			= 'Admin/deletePengguna';
$route['ubah-status-pengguna']		= 'Admin/ubahStatusPengguna';

$route['kelola-pesan-info']			= 'Admin/kelolaPesanInfo';

$route['kelola-tenaga-pendidik']	= 'Admin/kelolaTenagaPendidik';
$route['delete-tenaga-pendidik']	= 'Admin/deleteTenagaPendidik';
$route['ubah-status-tenaga-pendidik']= 'Admin/ubahStatusTenagaPendidik';

$route['lowongan-kerja']			= 'Admin/kelolaLowonganKerja';

/*****************************************************END OF SUPER ADMIN*****************************************************/

/*****************************************************BEGIN MAHASISWA********************************************************/

$route['dashboard-mahasiswa']					= 'Mahasiswa/dashboard';
$route['pesan-mahasiswa']						= 'Mahasiswa/pesan';
$route['profil-mahasiswa']						= 'Mahasiswa/profil';
$route['edit-profil-mahasiswa']					= 'Mahasiswa/editProfil';
$route['submit-edit-profil-mahasiswa']			= 'Mahasiswa/submitEditProfil';

// set komen yang sudah dilihat untuk tampilan notifikasi
$route['update-to-terlihat']					= 'Mahasiswa/setTerlihat';

// ajax untuk lihat permasalahan by kategori
$route['get-permasalahan-by-kategori']			= 'Mahasiswa/getPermasalahanByKategori';


$route['pertanyaan-detail-mahasiswa/(:num)']	= 'Mahasiswa/pertanyaanDetail/$1';
$route['pertanyaan-jawab-mahasiswa/(:num)']		= 'Mahasiswa/pertanyaanJawab/$1';
$route['pertanyaan-jawab-proses']				= 'Mahasiswa/insertJawaban';


$route['materi-mahasiswa']='Mahasiswa/materi';
$route['karir-mahasiswa']='Mahasiswa/karir';
$route['materi-tambah-mahasiswa']='Mahasiswa/tambahMateri';
$route['karir-tambah-mahasiswa']='Mahasiswa/tambahKarir';


/*****************************************************END OF MAHASISWA********************************************************/

/*****************************************************BEGIN TENAGA PENDIDIK********************************************************/

$route['dashboard-pendidik']					= 'Pendidik/dashboard';
$route['pesan-pendidik']						= 'Pendidik/pesan';
$route['get-pesan-pendidik']					= 'Pendidik/getPesan'; // untuk membaca semua pesan pendidik. action pada saat halaman pesan-pendidik diload
$route['profil-pendidik']						= 'Pendidik/profil';
$route['edit-profil-pendidik']					= 'Pendidik/editProfil';
$route['submit-edit-profil-pendidik']			= 'Pendidik/submitEditProfil';

/*view page*/
$route['pertanyaan-pendidik']					= 'Pendidik/pertanyaanSaya';
$route['buat-pertanyaan-pendidik']				= 'Pendidik/buatPertanyaan';
$route['detail-pertanyaan-pendidik/(:num)']		= 'Pendidik/detailPertanyaan/$1';
$route['edit-pertanyaan-pendidik/(:num)']		= 'Pendidik/editPertanyaan/$1';

$route['submit-rating-pendidik']				= 'Pendidik/submitRating';


$route['materi-pendidik']						= 'Pendidik/materi';
$route['materi-tambah-pendidik']				= 'Pendidik/tambahMateri';

$route['karir-pendidik']						= 'Pendidik/karir';
$route['karir-tambah-pendidik']					= 'Pendidik/tambahKarir';
$route['insert-karir-pendidik']					= 'Pendidik/insertKarir';

/*handle form*/
$route['insert-pertanyaan']						= 'Pendidik/insertPertanyaan';
$route['delete-pertanyaan']						= 'Pendidik/deletePertanyaan';
$route['submit-edit-pertanyaan']				= 'Pendidik/submitEditPertanyaan';


// $route['pesan-pendidik/(:any)/(:num)/(:num)/(:num)']				= 'Pendidik/pesan/$1/$2/$3/$4';
$route['pesan-pendidik/(:any)']				= 'Pendidik/pesan/$1';



/*****************************************************END OF TENAGA PENDIDIK********************************************************/






























