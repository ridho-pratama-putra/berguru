<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Profil</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container">
		<div class="row">
			<div class="col-sm-8 col-md-9">
				<!-- <div class="main-container mr-1"> -->
					<?=$this->session->flashdata("alert");?>
					<!-- </div> -->
					<div class="panel panel-plain">
						<div class="panel-nav">
							<a href="<?=base_url()?>profil-pendidik" class="panel-link"><i class="fa fa-chevron-left"></i> Kembali</a>
						</div>
						<div class="panel-heading">
							<h1>Edit Profil</h1>
							<p>mengubah data diri</p>
						</div>
						<div class="panel-body">
							<form action="<?=base_url()?>submit-edit-profil-pendidik" method="POST" enctype="multipart/form-data" class="input-55">
								<input type="hidden" name="id" value="<?=$pengguna[0]->id?>">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="">Nama</label>
											<input type="text" name="nama" class="form-control" placeholder="Nama" value="<?=$pengguna[0]->nama?>">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="">NIP</label>
											<input type="nim" class="form-control" placeholder="NIP" value="<?=$pengguna[0]->nip_or_nim?>" name="nip_or_nim">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="">Universitas</label>
											<input type="text" class="form-control" placeholder="Universitas" value="<?=$pengguna[0]->institusi_or_universitas?>" name="institusi_or_universitas">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="">Email</label>
											<input type="email" name="email" class="form-control" placeholder="Email" value="<?=$pengguna[0]->email?>">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="">No. Telepon</label>
											<input type="text" name="no_hp" class="form-control" placeholder="No. Telepon" value="<?=$pengguna[0]->no_hp?>">
										</div>
									</div>
								</div>
								<div class="form-separator"></div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="">Password Lama</label>
											<input type="password" name="password" class="form-control" placeholder="***" value="">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="">Password Baru</label>
											<input type="password" name="password_" class="form-control" placeholder="***" value="">
										</div>
									</div>
								</div>
								<div class="form-separator"></div>

								<div class="row profil-edit-foto">
									<div class="col-sm-7 col-md-8">
										<label for="">Ganti foto</label>
										<div class="row">
											<div class="col-md-4 col-lg-3">
												<div class="user-photo wh-90">
													<img class="img-circle" src="<?=base_url().$pengguna[0]->foto?>" alt="Photo" >
												</div>
											</div>
											<div class="col-md-8 col-lg-9">
												<input type="file" name="foto" id="thefile" class="input-file" accept="image/*">
												<label for="thefile" class="input-label only-btn">
													<span class="tombol"><i class="fa fa-cloud-upload-alt"></i> Upload Foto</span>
												</label>
											</div>
										</div>
									</div>
									<div class="col-sm-5 col-md-4">
										<label for="">&nbsp;</label>
										<button class="btn btn-55 btn-success btn-block" type="submit">Simpan <span class="hidden-sm hidden-md">Perubahan</span></button>
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