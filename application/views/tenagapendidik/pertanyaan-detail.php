<script type="text/javascript">
	// script untuk hapus pertanyaan
	function hapus(id){
		$.post( "<?=base_url()?>delete-pertanyaan",{ id: id },function(data){
			window.location.replace("<?=base_url()?>pertanyaan-saya");
		});
	}

	// end script untuk hapus pertanyaan
	
	// function untuk kirim rate-input
	function submitRating(arguments,arguments_){ 
		var rating 			= $('#'+arguments).raty('score');
		$.post("<?=base_url()?>submit-rating-pendidik",{ id : arguments, id_ : arguments_, rating : rating});
	}

	// funtion untuk set form pembukaan chat baru
	function openNewChat(id_komentator,id_permasalahan,id_komentar) {
		$('#new_chat_id_komentar').val(id_komentar);
		$('#new_chat_id_komentator').val(id_komentator);
		$('#new_chat_id_permasalahan').val(id_permasalahan);
		$('#formNewChat').submit();
	}
	
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
									<a href="<?=base_url()?>pertanyaan-pendidik" class="panel-link"><i class="fa fa-chevron-left"></i> Detail
										Pertanyaan</a>
								</div>
								<div class="col-sm-6 text-right">
									<a href="<?=base_url()?>edit-pertanyaan-pendidik/<?=$pertanyaan[0]->id?>" class="btn btn-normal btn-blue">Edit</a>
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
											<i class="far fa-clock"></i> <?=date('M, d Y',strtotime($pertanyaan[0]->tanggal))?>
											<i class="fa fa-circle"></i>
											<i class="far fa-comment"></i> <?=$pertanyaan[0]->jumlah_komen?>
											<i class="fa fa-circle"></i>
											<i class="far fa-eye"></i> <?=$pertanyaan[0]->jumlah_dilihat?>
										</div>
									</div>
									<div class="col-md-4 text-right">
										<span class="btn btn-custom <?=($pertanyaan[0]->status == 'SOLVED') ? 'btn-status-green' : 'btn-status-red'?> "><i class="fa <?=($pertanyaan[0]->status == 'ACTIVE') ? 'fa-check-circle' : 'fa-times-circle'?> "></i> <?=$pertanyaan[0]->status?></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<?php
					if ($komentar !== array()) { ?>
						<div class="panel panel-plain">
							<div class="panel-body">
								<div class="detper-jawaban-heading">
									<div class="row">
										<div class="col-sm-6">
											<i class="fa fa-unlock"></i> <?=sizeof($komentar)?> Jawaban
										</div>
										<div class="col-sm-6">
											<span class="text-muted">Penjawab</span>
											<?php
											 foreach ($penjawab as $key => $value) { ?>
												<div class="user-photo">
													<img src="<?=base_url().$value->foto?>" class="img-circle" alt="Photo" title="<?=$value->nama?>">
												</div>
											<?php } ?>
											
											<?php if ($remaining_penjawab !== 0) { ?>
												<div class="user-more"> <?=$remaining_penjawab?></div>
											<?php } ?>
										</div>
									</div>
								</div>
								<div class="detper-jawaban-list">
									<?php foreach ($komentar as $key => $value) { ?>
									<div class="detper-jawaban-item">
										<div class="detper-jawaban">
											<?=$value->teks?>
										</div>
										<div class="detper-jawaban-footer">
											<div class="row">
												<div class="col-sm-6 col-md-8 col-lg-4">
													<div class="user-photo">
														<img src="<?=base_url().$value->foto?>" class="img-circle" alt="Photo">
													</div>
													<div class="user-nama">
														<?=$value->nama?>
													</div>
												</div>
												<div class="col-sm-6 col-md-4 col-lg-8 text-right">
													<span class="text-muted">Review Jawaban</span>
													<div class="rate-input" id="<?=$value->id?>" data-score="<?=$value->rating?>" onclick="submitRating(<?=$value->id?>,<?=$pertanyaan[0]->id?>)"></div>
													<a href="#" class="btn btn-custom btn-plonk-green" onclick="openNewChat(<?=$value->id_komentator?>,<?=$pertanyaan[0]->id?>,<?=$value->id?>)">Kirim Pesan</a>
												</div>
											</div>
										</div>
									</div>
									<?php } ?>
								</div>
							</div>
						</div>
					<?php }else{ ?>
						<h4 class="text-center"><strong>Belum ditemukan komentar</strong></h4> 
					<?php } ?>
				</div>

				<div class="col-sm-4 col-md-3">
					<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
				</div>
			</div>
		</div>
	<form method="POST" action="<?=base_url()?>pesan-pendidik" id="formNewChat">
		<input type="hidden" name="id_komentator" value="" id="new_chat_id_komentator">
		<input type="hidden" name="id_permasalahan" value="" id="new_chat_id_permasalahan">
		<input type="hidden" name="id_komentar" value="" id="new_chat_id_komentar">
		
	</form>
	</div>
