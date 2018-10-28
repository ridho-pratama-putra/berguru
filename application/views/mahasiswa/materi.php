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
		<div class="content-filter-top">
			<div class="big-filter">
				<div class="dropdown">
					<a href="#" data-toggle="dropdown">Semua Materi <i class="fa fa-chevron-down"></i></a>
					<ul class="dropdown-menu">
						<li><a href="#">Materi yang A</a></li>
						<li><a href="#">Materi yang B</a></li>
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
									<span class="input-group-addon"><i class="fa fa-search"></i></span>
									<input type="text" class="form-control" placeholder="Ketik lalu tekan enter untuk mencari materi">
								</div>
							</form>
						</div>
						<div class="col-sm-3 col-md-push-6 col-lg-push-0 col-lg-1 atau">Atau</div>
						<div class="col-sm-9 col-md-4 col-md-push-5 col-lg-push-0 col-lg-3">
							<a href="<?=base_url()?>materi-tambah-mahasiswa" class="btn btn-55 btn-success btn-block">Tambah Materi</a>
						</div>
					</div>
				</div>
				<div class="content-filter-bottom">
					<div class="row">
						<div class="col-xs-5">
							<h4>Daftar Materi</h4>
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
									<?php foreach ($kategori as $key => $value) { ?>
										<li><a href="#"><?=$value->nama?></a></li>
									<?php } ?>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="content-list">
					<div class="panel panel-plain content-item">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-3 col-sm-2 col-md-2 col-lg-1">
									<div class="materi-ikon materi-blue"><i class="fa fa-flask"></i></div>
								</div>
								<div class="col-xs-9 col-sm-10 col-md-7">
									<h3 class="ci-title">Tips Mendapatkan Emphaty Murid</h3>
									<div class="td-meta">
										<i class="far fa-clock"></i> Sep, 24 2018
										<i class="fa fa-circle"></i>
										<i class="far fa-comment"></i> 122
										<i class="fa fa-circle"></i>
										<i class="far fa-eye"></i> 2022
									</div>
									<div class="btn btn-custom btn-status-blue">Matematika</div>
								</div>
								<div class="col-xs-12 col-md-3 col-lg-4 ci-right">
									<a href="#" class="btn btn-normal btn-plonk-red"><i class="fa fa-cloud-download-alt"></i> Unduh</a>
									<div class="content-tag">
										<span class="text-muted">Tags</span>
										<a href="#">#materi</a>
										<a href="#">#empathy</a>
										<a href="#">#gurusd</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-plain content-item">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-3 col-sm-2 col-md-2 col-lg-1">
									<div class="materi-ikon materi-green"><i class="fa fa-puzzle-piece"></i></div>
								</div>
								<div class="col-xs-9 col-sm-10 col-md-7">
									<h3 class="ci-title">Tips Mendapatkan Emphaty Murid</h3>
									<div class="td-meta">
										<i class="far fa-clock"></i> Sep, 24 2018
										<i class="fa fa-circle"></i>
										<i class="far fa-comment"></i> 122
										<i class="fa fa-circle"></i>
										<i class="far fa-eye"></i> 2022
									</div>
									<div class="btn btn-custom btn-status-green">Matematika</div>
								</div>
								<div class="col-xs-12 col-md-3 col-lg-4 ci-right">
									<a href="#" class="btn btn-normal btn-plonk-red"><i class="fa fa-cloud-download-alt"></i> Unduh</a>
									<div class="content-tag">
										<span class="text-muted">Tags</span>
										<a href="#">#materi</a>
										<a href="#">#empathy</a>
										<a href="#">#gurusd</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-plain content-item">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-3 col-sm-2 col-md-2 col-lg-1">
									<div class="materi-ikon materi-black"><i class="fa fa-bicycle"></i></div>
								</div>
								<div class="col-xs-9 col-sm-10 col-md-7">
									<h3 class="ci-title">Tips Mendapatkan Emphaty Murid</h3>
									<div class="td-meta">
										<i class="far fa-clock"></i> Sep, 24 2018
										<i class="fa fa-circle"></i>
										<i class="far fa-comment"></i> 122
										<i class="fa fa-circle"></i>
										<i class="far fa-eye"></i> 2022
									</div>
									<div class="btn btn-custom btn-status-black">Matematika</div>
								</div>
								<div class="col-xs-12 col-md-3 col-lg-4 ci-right">
									<a href="#" class="btn btn-normal btn-plonk-red"><i class="fa fa-cloud-download-alt"></i> Unduh</a>
									<div class="content-tag">
										<span class="text-muted">Tags</span>
										<a href="#">#materi</a>
										<a href="#">#empathy</a>
										<a href="#">#gurusd</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-plain content-item">
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-3 col-sm-2 col-md-2 col-lg-1">
									<div class="materi-ikon materi-red"><i class="fa fa-flask"></i></div>
								</div>
								<div class="col-xs-9 col-sm-10 col-md-7">
									<h3 class="ci-title">Tips Mendapatkan Emphaty Murid</h3>
									<div class="td-meta">
										<i class="far fa-clock"></i> Sep, 24 2018
										<i class="fa fa-circle"></i>
										<i class="far fa-comment"></i> 122
										<i class="fa fa-circle"></i>
										<i class="far fa-eye"></i> 2022
									</div>
									<div class="btn btn-custom btn-status-red">Matematika</div>
								</div>
								<div class="col-xs-12 col-md-3 col-lg-4 ci-right">
									<a href="#" class="btn btn-normal btn-plonk-red"><i class="fa fa-cloud-download-alt"></i> Unduh</a>
									<div class="content-tag">
										<span class="text-muted">Tags</span>
										<a href="#">#materi</a>
										<a href="#">#empathy</a>
										<a href="#">#gurusd</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-4 col-md-3">
				<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
			</div>


		</div>

	</div>






</div>	<!--/.main-->
