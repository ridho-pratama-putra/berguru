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
$route['default_controller'] = 'Auth/login';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

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
$route['tambah-kategori'] 			= 'Admin/tambahKategoriKonten';
$route['edit-kategori'] 			= 'Admin/editKategoriKonten';
$route['delete-kategori'] 			= 'Admin/deleteKategoriKonten';

$route['kelola-komentar']			= 'Admin/kelolaKomentar';

$route['kelola-konten-permasalahan']= 'Admin/kelolaKontenPermasalahan';
$route['delete-permasalahan']		= 'Admin/deletePermasalahan';

$route['kelola-materi']				= 'Admin/kelolaMateri';
$route['tambah-materi']				= 'Admin/tambahMateri';

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

$route['pesan-mahasiswa']			= 'Mahasiswa/pesan';
$route['profil-mahasiswa']			= 'Mahasiswa/profil';

/*****************************************************END OF MAHASISWA********************************************************/

/*****************************************************BEGIN TENAGA PENDIDIK********************************************************/

$route['pesan-tenaga-pendidik']		= 'Pendidik/pesan';
$route['profil-tenaga-pendidik']	= 'Pendidik/profil';
$route['pertanyaan-saya']			= 'Pendidik/pertanyaanSaya';
$route['buat-pertanyaan']			= 'Pendidik/buatPertanyaan';
$route['insert-pertanyaan']			= 'Pendidik/insertPertanyaan';
$route['delete-pertanyaan']			= 'Pendidik/deletePertanyaan';

/*****************************************************END OF TENAGA PENDIDIK********************************************************/






























