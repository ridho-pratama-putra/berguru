<script type="text/javascript">
	$( document ).ready(function() {
		var options = {
			valueNames: [ 'nama' ]
		};

		var userList = new List('materi', options);
		
	});
</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Materi</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container mr-1">
		<?=$this->session->flashdata("alert");?>
	</div>
	
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
									<input type="text" class="form-control search" placeholder="Ketik lalu tekan enter untuk mencari materi">
								</div>
							</form>
						</div>
						<div class="col-sm-3 col-md-push-6 col-lg-push-0 col-lg-1 atau">Atau</div>
						<div class="col-sm-9 col-md-4 col-md-push-5 col-lg-push-0 col-lg-3">
							<a href="<?=base_url()?>materi-tambah-pendidik" class="btn btn-55 btn-success btn-block">Tambah Materi</a>
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
				<div class="content-list list" id="materi">
					<?php if ($materi !== array()) { ?>
					<?php foreach ($materi as $key => $value) { ?>
						<div class="panel panel-plain content-item">
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-3 col-sm-2 col-md-2 col-lg-1">
										<div class="materi-ikon <?=$value->ikon_warna?>"><i class="fa <?=$value->ikon_logo?>"></i></div>
									</div>
									<div class="col-xs-9 col-sm-10 col-md-7">
										<h3 class="ci-title nama"><?=$value->nama?></h3>
										<div class="td-meta">
											<i class="far fa-clock"></i>  <?=date('M, d Y',strtotime($value->waktu_terakhir_edit))?>
											<i class="fa fa-circle"></i>
											<i class="far fa-comment"></i> <?=$value->jumlah_diunduh?>
											<i class="fa fa-circle"></i>
											<i class="far fa-eye"></i> <?=$value->jumlah_dilihat?>
										</div>
										<div class="btn btn-custom btn-status-blue"><?=$value->kategori?></div>
									</div>
									<div class="col-xs-12 col-md-3 col-lg-4 ci-right">
										<a href="<?=base_url('download-materi-pendidik/').$value->id?>" class="btn btn-normal btn-plonk-red"><i class="fa fa-cloud-download-alt"></i> Unduh</a>
										<div class="content-tag">
											<span class="text-muted">Tags</span>
											<?php $variable = $value->tags; $variable = explode(",", $variable);
											foreach ($variable as $keyA => $valueA) { ?>
												<a href="#">#<?=$valueA?></a>
											<?php } ?>
										</div>
									</div>
								</div>
							</div>
						</div>
					<?php } ?>
					<?php }else{ ?>
						<div class="panel panel-plain content-item">
							<div class="panel-body">
								<div class="row">
									<div class="col">
										<h3 class="ci-title text-center">Data materi masih kosong</h3>
									</div>
								</div>
							</div>
						</div>
					<?php } ?>
				</div>
			</div>

			<div class="col-sm-4 col-md-3">
				<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
			</div>


		</div>

	</div>






</div>	<!--/.main-->
