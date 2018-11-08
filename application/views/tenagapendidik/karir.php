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
		
		<div class="content-filter-top">
			<div class="big-filter">
				<div class="dropdown">
					<a href="#" data-toggle="dropdown">Semua Lowongan <i class="fa fa-chevron-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="#">Lowongan yang A</a></li>
						<li><a href="#">Lowongan yang B</a></li>
					</ul>
				</div>
			</div>
			<p class="text-muted">Solusi tanpa batas dan mudah dalam diskusi yang menyenangkan</p>
		</div>
		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="content-filter-search">
					<div class="row">
						<div class="col-sm-12 col-lg-8">
							<form action="#" class="input-55">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-map-marker-alt"></i></span>
									<input type="text" class="form-control" placeholder="Pilih lokasi">
								</div>
							</form>
						</div>
						<div class="col-sm-3 col-md-push-6 col-lg-push-0 col-lg-1 atau">Atau</div>
						<div class="col-sm-9 col-md-4 col-md-push-5 col-lg-push-0 col-lg-3">
							<a href="<?=base_url()?>karir-tambah-pendidik" class="btn btn-55 btn-success btn-block">Tambah Lowongan</a>
						</div>
					</div>
				</div>
				<div class="content-filter-bottom">
					<div class="row">
						<div class="col-xs-5">
							<h4>Daftar Lowongan</h4>
						</div>
						<div class="col-xs-7 text-right">
							<div class="dropdown">
								<a href="#" data-toggle="dropdown">Harian <i class="fa fa-chevron-down"></i></a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="#">Mingguan</a></li>
									<li><a href="#">Bulanan</a></li>
								</ul>
							</div>
							<div class="dropdown">
								<a href="#" data-toggle="dropdown">Kategori <i class="fa fa-chevron-down"></i></a>
								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="#">Kategori A</a></li>
									<li><a href="#">Kategori B</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="content-list">
					<?php if ($lowongan !== array()) {
						foreach ($lowongan as $key => $value) { ?>
							<div class="panel panel-plain content-item">
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-8">
											<h3 class="ci-title mh-56"><?=$value->nama?></h3>
											<div class="ci-instansi"><?=$value->instansi?></div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-4 ci-right">
											<div class="ci-lokasi">
												<i class="fa fa-map-marker-alt"></i> <?=$value->lokasi?>
											</div>
											<a href="tel:<?=$value->kontak?>" class="btn btn-normal btn-plonk-red"><i class="fa fa-flip-horizontal fa-phone"></i> Hubungi</a>
										</div>
									</div>
								</div>
							</div>
					<?php }
					} ?>

				</div>
			</div>

			<div class="col-sm-4 col-md-3">
				<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
			</div>


		</div>

	</div>






</div>	<!--/.main-->