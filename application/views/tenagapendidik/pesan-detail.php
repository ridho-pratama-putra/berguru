<script type="text/javascript">
	// funtion untuk set form pembukaan chat baru
	function openNewChat(id_komentator,id_permasalahan,id_komentar) {
		$('#new_chat_id_komentator').val(id_komentator);
		$('#formNewChat').submit();
	}

	$( document ).ready(function() {
		$("#scrollable-pesan").mCustomScrollbar("update");
	    setTimeout(function(){
	        $("#scrollable-pesan").mCustomScrollbar("scrollTo","bottom");
	    },1);
	});
</script>
<form method="POST" action="<?=base_url()?>pesan-pendidik" id="formNewChat">
	<input type="hidden" name="id_komentator" value="" id="new_chat_id_komentator">
</form>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Pesan</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container">
		<?=$this->session->flashdata("alert")?>
		<div class="panel panel-plain panel-pesan">
			<div class="row">
				<div class="col-sm-6 col-md-5 col-lg-3 panel-pleft">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12">
								<h1>Pesan</h1>
							</div>
							<div class="col-xs-12">
								<form class="" action="index.html" method="post">
									<div class="form-group">
										<div class="input-group plain-group">
											<input type="text" name="" value="" placeholder="Pencarian" class="form-control dt-search">
											<span class="input-group-btn">
												<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
											</span>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="panel-body list-pesan scrollable">
						<?php foreach ($to as $key => $value) { ?>
							
						<div class="pesan-item <?=($value->id == $komentator[0]->id) ? 'pi-selected' : '' ?> " onclick="openNewChat(<?=$value->id?>)">
							<!--  pi-read -->
							<!--  pi-selected -->
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url().$value->foto?>" class="img-circle" alt="Photo">
								</div>
								<div class="user-nama">
									<?=$value->nama?>
								</div>
								<div class="last-pesan">
									pesan
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									2d
								</span>
								<span class="badge">1</span>
							</div>
						</div>
						<?php } ?>
					</div>
				</div>
				<div class="col-sm-6 col-md-7 col-lg-9 panel-pright">
					<div class="panel-body detail-pesan">
						<div class="detpes-top scrollable" id="scrollable-pesan">
							<div class="detpes-header" style="margin-bottom: 10px">
								<div class="row">
									<div class="col-md-6 text-right col-md-push-6">
										<span class="text-muted">Badge</span>
										<div class="profile-achievement">
											<?php
											if ($komentator[0]->poin < 40 ) { ?>
												<div class="achie achie-orange" title="Beginner"><i class="fa fa-star"></i></div>
											<?php }elseif ($komentator[0]->poin < 100) { ?>
												<div class="achie achie-orange" title="Beginner"><i class="fa fa-star"></i></div>
												<div class="achie achie-green" title="Rookie"><i class="fa fa-trophy"></i></div>
											<?php }elseif ($komentator[0]->poin < 180) { ?>
												<div class="achie achie-orange" title="Beginner"><i class="fa fa-star"></i></div>
												<div class="achie achie-green" title="Rookie"><i class="fa fa-trophy"></i></div>
												<div class="achie achie-blue" title="Regular"><i class="far fa-gem"></i></div>
											<?php }elseif ($komentator[0]->poin < 300) { ?>
												<div class="achie achie-orange" title="Beginner"><i class="fa fa-star"></i></div>
												<div class="achie achie-green" title="Rookie"><i class="fa fa-trophy"></i></div>
												<div class="achie achie-blue" title="Regular"><i class="far fa-gem"></i></div>
												<div class="achie achie-black" title="Professional"><i class="fa fa-bicycle"></i></div>
											<?php } ?>
										</div>
										<div class="dropdown detpes-menu">
												<a href="#" class="dropdown-toggle" type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
													<i class="fa fa-ellipsis-v"></i>
												</a>
												<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="">
													<li><a href="#">Action</a></li>
													<li><a href="#">Another action</a></li>
													<li><a href="#">Something else here</a></li>
													<li role="separator" class="divider"></li>
													<li><a href="#">Separated link</a></li>
												</ul>
										</div>
									</div>
									<div class="col-md-6 col-md-pull-6">
										<div class="media">
											<div class="media-left">
												<div class="user-photo">
													<img src="<?=base_url().$komentator[0]->foto?>" class='img-circle' alt="Photo">
												</div>
												
											</div>
											<div class="media-right">
												<div class="user-nama"><?=$komentator[0]->nama?></div>
												<div class="user-email"><?=$komentator[0]->email?></div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<?php foreach ($chat as $key => $value) { ?>
								<div class="detpes-chats">
									<div class="dchat-htime"><?=($key == date('Y-m-d') ? 'Hari Ini' : tgl_indo(substr($key, 0, 10))) ?></div>
								</div>
								<?php foreach ($value as $keyA => $valueA) { ?>
									<?php if ($valueA->jenis_pesan == 'permasalahan') { 

										// variabel untuk menyimpan pada key berapa sebuah pertanyaan terletak. karena komentardm dan komentar permasalahan juga punya terpecahkan (karena 1 tabel, dibedakan pada jenis_pesan), sehingga harus get key nya biar tepat sasaran ke jenis_pesan permasalahannya bukan di komentardm atau komentarpermasalahan
										$key_is_solved = $keyA;
									?>
										<div class="detpes-masalah">
											<h4>Permasalahan Anda</h4>
											<?=$valueA->teks?>
										</div>
									<?php }elseif ($valueA->jenis_pesan == 'komentarpermasalahan') { ?>
										<div class="detpes-chats">
											<div class="dchat-htime">Hari ini</div>
											<div class="dchat dchat-keluar">
												<div class="dchat-isi">
														<?=$valueA->teks?>
												</div>
												<div class="dchat-footer">
													<small class="text-muted">Review jawaban</small>
													<div class="row">
														<div class="col-md-8">
															<div class="rate-result" data-score="<?=$valueA->rating?>"></div> <div class="rate-terbilang"><?=$valueA->rating?> Poin</div>
														</div>
														<div class="col-md-4 text-right">
															<span class="dchat-time"><?=date('h:i A', strtotime($valueA->tanggal));?></span>
																<a class="dchat-flag" href="#"><i class="fa fa-flag"></i></a>
														</div>
													</div>
												</div>
											</div>
											<div class="dchat dchat-masuk">
													<div class="dchat-isi">
															Great! Jawaban yang sangat memuaskan, sangat cocok! Metode ABCD telah sesuai. Terimakasih juga untuk link rujukan yg telah dicantumkan :)
													</div>
											</div>

											
										</div>
									<?php }elseif($valueA->jenis_pesan == 'komentardm'){ ?>
										<div class="detpes-chats"  style="padding-bottom: 0px">
											<?php if ($valueA->dari == $komentator[0]->id) { ?>
												<div class="dchat dchat-keluar">
													<div class="dchat-isi">
														<?=$valueA->teks?>
													</div>
													<?php if($value[$key_is_solved]->terpecahkan !== 'SOLVED' ){ ?>
													<div class="dchat-footer">
														<small class="text-muted">Permasalahan terpecahkan?</small>
														<div class="row">
															<div class="col-md-8">
																	<a href="#" class="btn btn-custom btn-plonk-green">Iya</a>
																	<a href="#" class="btn btn-custom btn-plonk-red">Tidak</a>
															</div>
															<div class="col-md-4 text-right">
																<span class="dchat-time"><?=date('h:i A', strtotime($valueA->tanggal));?></span>
																<a class="dchat-flag" href="#"><i class="fa fa-flag"></i></a>
															</div>
														</div>
													</div>
													<?php }else{ ?>
													<div class="dchat-footer">
														<div class="row">
															<div class="col-md-8">
															</div>
															<div class="col-md-4 text-right">
																<span class="dchat-time"><?=date('h:i A', strtotime($valueA->tanggal));?></span>
																<a class="dchat-flag" href="#"><i class="fa fa-flag"></i></a>
															</div>
														</div>
													</div>

													<?php } ?>
												</div>
											<?php }elseif ($valueA->dari == $this->session->userdata('loginSession')['id']) { ?>
												<div class="dchat dchat-masuk">
													<div class="dchat-isi">
														<?=$valueA->teks?>
													</div>
													<div class="dchat-footer">
														<div class="row">
															<div class="col-md-3 text-right">
																<span class="dchat-time"><?=date('h:i A', strtotime($valueA->tanggal));?></span>
																<a class="dchat-flag" href="#"><i class="fa fa-flag"></i></a>
															</div>
														</div>
													</div>
												</div>
											<?php } ?>
										</div>
									<?php } ?>
								<?php } ?>
								<span class="detpes-status">Pertanyaan berstatus</span> <span class="btn btn-custom <?=($value[$key_is_solved]->terpecahkan == 'SOLVED' ? 'btn-status-green' : 'btn-status-red')?>"><i class="fa fa-check-circle"></i> <?=$value[$key_is_solved]->terpecahkan ?></span>
							<?php } ?>



						</div>

						<div class="detpes-write">
							<form action="<?=base_url('submit-reply-pendidik')?>" method="POST">
								<div class="input-group">
									<input type="hidden" class="form-control" name="permasalahan" value="<?=(isset($permasalahan[0]->id) ? $permasalahan[0]->id : '' )?>">
									<input type="hidden" class="form-control" name="komentar" value="<?=(isset($komentar[0]->id) ? $komentar[0]->id : '' )?>">
									<input type="hidden" class="form-control" name="untuk" value="<?=$komentator[0]->id?>">
									<input type="text" class="form-control" name="message" placeholder="Tulis pesan...">
									<div class="input-group-btn">
										<button class="btn btn-green" type="submit">
											<span class="hidden-xs hidden-sm">Kirim pesan</span>
											<span class="hidden-md hidden-lg"><i class="fa fa-paper-plane"></i></span>
										</button>
									</div>
								</div>
								<span class="help-block" data-toggle="popover" data-content="Laporkan apabila ada ketidaknyaman anda dalam berdiskusi">Laporkan apabila ada ketidaknyaman anda dalam berdiskusi</span>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>






</div>	<!--/.main-->