<style type="text/css">
	.select2-container .select2-selection--single {
    	height: 55px;
	}
	.select2-container--default .select2-selection--single .select2-selection__arrow {
	    top: 25%;
	}
	.select2-container .select2-selection--single .select2-selection__rendered {
	    padding-top: 13px;
	}
</style>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Karir</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container">
		<?=$this->session->flashdata("karir")?>
		<div class="row">
			<div class="col-sm-8 col-md-9">
				
				<div class="panel panel-plain">
					<div class="panel-nav">
						<a href="<?=base_url()?>karir-mahasiswa" class="panel-link"><i class="fa fa-chevron-left"></i> Kembali</a>
					</div>
					<div class="panel-heading">
						<h1>Buat Lowongan Baru</h1>
						<p>membuat lowongan baru untuk mendapatkan pekerja</p>
					</div>
					<div class="panel-body">
						<form action="<?=base_url()?>insert-karir-pendidik" class="input-55" method="POST">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="">Nama Lowongan</label>
										<input type="text" class="form-control" placeholder="Contoh: Guru SD ulet, bisa ms. Word nilai plus" name="teks">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="">Instansi / Perusahaan</label>
										<input type="text" class="form-control" placeholder="Nama Instansi" name="instansi">
									</div>
								</div>
								<div class="col-md-6 col-sm-12">
									<div class="form-group">
										<label for="">Kota / Kabupaten</label>
										<select name="lokasi" class="form-control" data-placeholder="- Pilih Kota / Kabupaten -" id="kotakabupaten" >
										</select>
									</div>
								</div>
								<div class="col-md-6 col-sm-12">
									<div class="form-group">
										<label for="">Kontak Person</label>
										<input type="text" class="form-control" placeholder="No. Telepon / HP" name="kontak">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label for="alamat">Alamat Instansi</label>
										<textarea name="alamat" class="form-control" id="alamat" placeholder="Jl. Bunga Mawar no 22 RT 03 RW 04 Kelurahan Kedungkandang Kecamatan Sukun, Malang"></textarea>
									</div>
								</div>
							</div>
							<div class="form-separator"></div>
							<div class="row">
								<div class="col-sm-6 col-sm-push-6 col-lg-push-7 col-lg-5">
									<label for="">&nbsp;</label>
									<button class="btn btn-55 btn-success btn-block" type="submit">Publish <span class="hidden-sm">Lowongan</span></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-md-3">
				<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$('select').select2();
	$("#kotakabupaten").select2({
		ajax: {
			url: '<?=base_url()?>Mahasiswa/cariKotaOrKabupaten/',
			dataType: 'json',
			delay: 1000,
			data: function (term, page) {
				return {
					term: term, // search term
					page: 10
				};
			},
			processResults: function (data, page) {
				// console.log(data);
				return {
					results: data
				};
			},
			cache: true
		},
		escapeMarkup: function (markup) { return markup; }, // let our custom formatter work
		minimumInputLength: 1
	});
</script>