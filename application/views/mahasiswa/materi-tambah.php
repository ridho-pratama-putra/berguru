<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Materi</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container">
		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="panel panel-plain">
					<div class="panel-nav">
						<a href="pendidik-materi.html" class="panel-link"><i class="fa fa-chevron-left"></i> Kembali</a>
					</div>
					<div class="panel-heading">
						<h1>Tambah Materi Baru</h1>
						<p>membuat materi baru</p>
					</div>
					<div class="panel-body">
						<form action="#" class="input-55">
							<div class="row">
								<div class="col-md-5">
									<div class="form-group">
										<label for="">Nama Materi</label>
										<input type="text" class="form-control" placeholder="Masukkan Nama Materi">
									</div>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<label for="thefile">Upload File Materi</label>
										<input type="file" id="thefile" class="input-file" data-multiple-caption="{count} files selected" multiple>
										<label for="thefile" class="input-label">
											<span class="placeholder">Pilih file...</span>
											<span class="tombol"><i class="fa fa-cloud-upload-alt"></i> Upload file</span>
										</label>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label for="">Pilih Kategori</label>
										<select name="kategori" id="" class="form-control">
											<option value="" selected="" disabled="">Pilih kategori</option>
											<?php foreach ($kategori as $key => $value) { ?>
											<option value="<?=$value->id?>"><?=$value->nama?></option>
											<?php } ?>
										</select>
									</div>
									<div class="form-group">
										<label for="">Tags</label>
										<input type="text" class="form-control" placeholder="Masukkan tag anda">
										<p class="help-block">contoh: sejarah, gratis, edukasi</p>
									</div>
								</div>
								<div class="col-md-7">
									<label for="">Deskripsi</label>
									<textarea name="deskripsi" id="" rows="6" class="form-control" placeholder="Deskripsi"></textarea>
								</div>
							</div>
							<div class="form-separator"></div>
							<div class="row">
								<div class="col-sm-6 col-sm-push-6 col-lg-push-7 col-lg-5">
									<label for="">&nbsp;</label>
									<button class="btn btn-55 btn-success btn-block" type="submit">Publish <span class="hidden-sm">Materi</span></button>
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
</div>	<!--/.main-->