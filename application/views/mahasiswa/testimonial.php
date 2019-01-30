<style type="text/css">
.none{
	display: none !important
}
</style>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Testimonial</li>
		</ol>
	</div><!--/.row-->
	<div class="main-container mr-1">
		<?=$this->session->flashdata("alert");?>
	</div>
	<div class="main-container">
		<div class="content-filter-top">
			<div class="big-filter">
				<div class="dropdown">
					<a href="#" data-toggle="dropdown">Testimonial</a>
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
									<span class="input-group-addon"><i class="bgicon icon-search"></i></span>
									<input type="text" class="form-control" placeholder="Cari Testimonial" id="search-bar">
								</div>
							</form>
						</div>
						<div class="col-sm-3 col-md-push-6 col-lg-push-0 col-lg-1 atau">Atau</div>
						<div class="col-sm-9 col-md-4 col-md-push-5 col-lg-push-0 col-lg-3">
							<a href="<?=base_url()?>testimonial-tambah-mahasiswa" class="btn btn-55 btn-success btn-block">Tambah Testimonial</a>
						</div>
					</div>
				</div>
				<div class="content-filter-bottom">
					<div class="row">
						<div class="col-xs-5">
							<h4>Daftar Testimonial</h4>
						</div>
					</div>
				</div>
				<div class="content-list">
					<?php
					if ($testimonial !== array()) {						
						foreach ($testimonial as $key => $value) { ?>
							<div class="panel panel-plain content-item">
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-8">
											<h3 class="ci-title mh-56"><?=$value->teks?></h3>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="ci-instansi"><?=tgl_indo($value->tanggal)?></div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-6 ci-right">
											<a href="<?=base_url()?>edit-testimonial-mahasiswa/<?=$value->id?>" class="btn btn-normal btn-plonk-yellow"><i class="bgicon icon-magic"></i> Edit</a>
											<a href="<?=base_url()?>hapus-testimonial-mahasiswa/<?=$value->id?>" class="btn btn-normal btn-plonk-red"><i class="bgicon icon-trash-empty"></i> Hapus</a>
										</div>
									</div>
								</div>
							</div>
							<?php 
						} 
					}else{ ?>
						<h6 class="text-center">Anda belum manambahkan testimonial</h6>
					<?php }
					?>

				</div>
			</div>
			<div class="col-sm-4 col-md-3">
				<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
			</div>
		</div>
	</div>
</div>	<!--/.main-->
<script type="text/javascript">
	$( document ).ready(function() {
		$("#search-bar").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$(".content-item").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
	});
</script>