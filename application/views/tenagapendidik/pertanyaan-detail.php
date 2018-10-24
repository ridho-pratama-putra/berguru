<script type="text/javascript">
	// script untuk hapus pertanyaan
	function hapus(id){
		$.post( "<?=base_url()?>delete-pertanyaan",{ id: id },function(data){
			window.location.replace("<?=base_url()?>pertanyaan-saya");
		});
	}
	// end script untuk hapus pertanyaan
</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row visible-xs">
			<ol class="breadcrumb">
				<li><a href="#">
						Home
					</a></li>
				<li class="active">Pertanyaan Saya</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="main-container">
			<div class="row">
				<div class="col-sm-8 col-md-9">
					<div class="panel panel-plain">
						<div class="panel-nav">
							<div class="row">
								<div class="col-sm-6">
									<a href="<?=base_url()?>pertanyaan-saya" class="panel-link"><i class="fa fa-chevron-left"></i> Detail
										Pertanyaan</a>
								</div>
								<div class="col-sm-6 text-right">
									<a href="#" class="btn btn-normal btn-blue">Edit</a>
									<span class="hidden-sm hidden-xs">&nbsp;</span>
									<a class="btn btn-normal btn-red" onclick="hapus(<?=$pertanyaan[0]->id?>)">Hapus</a>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="detper-pertanyaan">
								<?=$pertanyaan[0]->teks?>
							</div>
							<div class="detper-meta">
								<div class="row">
									<div class="col-md-8">
										<div class="td-meta">
											<i class="far fa-clock"></i><?=date('M, d Y',strtotime($pertanyaan[0]->tanggal))?>
											<i class="fa fa-circle"></i>
											<i class="far fa-comment"></i> <?=$pertanyaan[0]->jumlah_komen?>
											<i class="fa fa-circle"></i>
											<i class="far fa-eye"></i> <?=$pertanyaan[0]->jumlah_dilihat?>
										</div>
									</div>
									<div class="col-md-4 text-right">
										<span class="btn btn-custom <?=($pertanyaan[0]->status == 'SOLVED') ? 'btn-status-green' : 'btn-status-red'?> "><i class="fa <?=($pertanyaan[0]->status == 'ACTIVE') ? 'fa-check-circle' : 'fa-times-circle'?> "></i><?=$pertanyaan[0]->status?></span>
									</div>
								</div>
							</div>
						</div>
					</div>
<?php
if ($komentar !==array()) { ?>
					<div class="panel panel-plain">
						<div class="panel-body">
							<div class="detper-jawaban-heading">
								<div class="row">
									<div class="col-sm-6">
										<i class="fa fa-unlock"></i> 3 Jawaban
									</div>
									<div class="col-sm-6">
										<span class="text-muted">Penjawab</span>
										<div class="user-photo">
											<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
										</div>
										<div class="user-photo">
											<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
										</div>
										<div class="user-photo">
											<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
										</div>
										<div class="user-more">9+</div>
									</div>
								</div>
							</div>
							<div class="detper-jawaban-list">
								<div class="detper-jawaban-item">
									<div class="detper-jawaban">
										Pada dasarnya murid memiliki behavior berbeda per individu, jadi kita bisa membuat analisa untuk individu
										yang kurang termotivasi. Bisa menggunakan metode ABCD untuk itu. Link detail http://Url.googl.co/eihbvq4
									</div>
									<div class="detper-jawaban-footer">
										<div class="row">
											<div class="col-sm-6 col-md-8 col-lg-4">
												<div class="user-photo">
													<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
												</div>
												<div class="user-nama">
													Daniel Webber
												</div>
											</div>
											<div class="col-sm-6 col-md-4 col-lg-8 text-right">
												<span class="text-muted">Review Jawaban</span>
												<div class="rate-input"></div>
												<a href="#" class="btn btn-custom btn-plonk-green">Kirim Pesan</a>
											</div>
										</div>
									</div>
								</div>
								<div class="detper-jawaban-item">
									<div class="detper-jawaban">
										Pada dasarnya murid memiliki behavior berbeda per individu, jadi kita bisa membuat analisa untuk individu
										yang kurang termotivasi. Bisa menggunakan metode ABCD untuk itu. Link detail http://Url.googl.co/eihbvq4
									</div>
									<div class="detper-jawaban-footer">
										<div class="row">
											<div class="col-sm-4">
												<div class="user-photo">
													<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
												</div>
												<div class="user-nama">
													Daniel Webber
												</div>
											</div>
											<div class="col-sm-8 text-right">
												<span class="text-muted">Review Jawaban</span>
												<div class="rate-input"></div>
												<a href="#" class="btn btn-custom btn-plonk-green">Kirim Pesan</a>
											</div>
										</div>
									</div>
								</div>
								<div class="detper-jawaban-item">
									<div class="detper-jawaban">
										Pada dasarnya murid memiliki behavior berbeda per individu, jadi kita bisa membuat analisa untuk individu
										yang kurang termotivasi. Bisa menggunakan metode ABCD untuk itu. Link detail http://Url.googl.co/eihbvq4
									</div>
									<div class="detper-jawaban-footer">
										<div class="row">
											<div class="col-sm-4">
												<div class="user-photo">
													<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
												</div>
												<div class="user-nama">
													Daniel Webber
												</div>
											</div>
											<div class="col-sm-8 text-right">
												<span class="text-muted">Review Jawaban</span>
												<div class="rate-input"></div>
												<a href="#" class="btn btn-custom btn-plonk-green">Kirim Pesan</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
<?php	
}
?>
				</div>

				<div class="col-sm-4 col-md-3">
					<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
				</div>


			</div>

		</div>






	</div>