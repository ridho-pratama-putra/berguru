<style type="text/css">
	.permasalahan-solved{
		margin-bottom: 20px
	}
</style>
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

	function timeAgo() {
		var templates = {
			prefix: "",
			suffix: "",
			seconds: "rcntly",
			minute: "1m",
			minutes: "%dm",
			hour: "1h",
			hours: "%dh",
			day: "1d",
			days: "%dd",
			month: "1m",
			months: "%dm",
			year: "1y",
			years: "%dy"
		};
		var template = function(t, n) {
			return templates[t] && templates[t].replace(/%d/i, Math.abs(Math.round(n)));
		};

		var timer = function(time) {
			if (!time)
				return;
			time = time.replace(/\.\d+/, ""); // remove milliseconds
			time = time.replace(/-/, "/").replace(/-/, "/");
			time = time.replace(/T/, " ").replace(/Z/, " UTC");
			time = time.replace(/([\+\-]\d\d)\:?(\d\d)/, " $1$2"); // -04:00 -> -0400
			time = new Date(time * 1000 || time);

			var now = new Date();
			var seconds = ((now.getTime() - time) * .001) >> 0;
			var minutes = seconds / 60;
			var hours = minutes / 60;
			var days = hours / 24;
			var years = days / 365;

			return templates.prefix + (
				seconds < 45 && template('seconds', seconds) ||
				seconds < 90 && template('minute', 1) ||
				minutes < 45 && template('minutes', minutes) ||
				minutes < 90 && template('hour', 1) ||
				hours < 24 && template('hours', hours) ||
				hours < 42 && template('day', 1) ||
				days < 30 && template('days', days) ||
				days < 45 && template('month', 1) ||
				days < 365 && template('months', days / 30) ||
				years < 1.5 && template('year', 1) ||
				template('years', years)
				) + templates.suffix;
		};

		var elements = document.getElementsByClassName('timeago');
		for (var i in elements) {
			var $this = elements[i];
			if (typeof $this === 'object') {
				$this.innerHTML = "<span class='bgicon bgicon-clock'></span> " + timer($this.getAttribute('title') || $this.getAttribute('datetime'));
			}
		}
		// update time every minute
		setTimeout(timeAgo, 60000);
	};
</script>
<form method="POST" action="<?=base_url()?>pesan-mahasiswa" id="formNewChat">
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
						<div class="pesan-item <?=($value->id == $komentator[0]->id) ? 'pi-selected' : '' ?> <?=($value->belum_dibaca == '0') ? 'pi-read' :''?>" onclick="openNewChat(<?=$value->id?>)">
							<!--  pi-read -->
							<!--  pi-selected -->
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url().$value->foto?>" class="img-circle" alt="Photo">
								</div>
								<div class="user-nama">
									<?=$value->alias?>
								</div>
								<div class="last-pesan">
									<?=$value->teks?>
								</div>
							</div>
							<div class="pi-right">
								<span class="time timeago" title="<?=$value->tanggal?>">
								</span>
								<?=($value->belum_dibaca !== '0') ? "<span class='badge'>".$value->belum_dibaca."</span>" : ''?>
							</div>
						</div>
						<?php } ?>
					</div>
				</div>
				<div class="col-sm-6 col-md-7 col-lg-9 panel-pright">
					<div class="panel-body detail-pesan">
						<div class="detpes-top scrollable">
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
										$key_is_solved = $keyA;
										$current_permasalahan = $valueA->permasalahan;
										?>
										<div class="detpes-masalah">
											<h4>Permasalahan</h4>
											<?=$valueA->teks?>
										</div>
									<?php }elseif ($valueA->jenis_pesan == 'komentarpermasalahan') { ?>
										<div class="detpes-chats">
											
											<div class="dchat dchat-masuk">
												<div class="dchat-isi">
														<?=$valueA->teks?>
												</div>
												<div class="dchat-footer">

													<small class="text-muted">Review jawaban</small>
													<div class="row">
														<div class="col-md-8">
															<div class="rate-result" data-score="<?=$valueA->rating?>"></div> <div class="rate-terbilang"><?=$valueA->rating?> Poin</div>
														</div>
														<?php if($valueA->solver == 'bukan'){ ?>
														<div class="col-md-4 text-right">
															<span class="dchat-time"><?=date('h:i A', strtotime($valueA->tanggal));?></span>
															<a class="dchat-flag" href="#"><i class="fa fa-flag"></i></a>
														</div>
														<?php }?>
													</div>
												</div>
											</div>
										</div>
									<?php }elseif ($valueA->jenis_pesan == 'komentardm') { ?>
										<div class="detpes-chats">
											<?php if ($valueA->dari == $komentator[0]->id) { ?>
												<div class="dchat dchat-keluar">
													<div class="dchat-isi">
														<?=$valueA->teks?>
													</div>
													<div class="dchat-footer">
														<div class="row">
															<div class="col-xs-8">
																	
															</div>
															<div class="col-xs-4 text-right">
																<span class="dchat-time"><?=date('h:i A', strtotime($valueA->tanggal));?></span>
																<a class="dchat-flag" href="#"><i class="fa fa-flag"></i></a>
															</div>
														</div>
													</div>
												</div>
											<?php }elseif ($valueA->dari == $this->session->userdata('loginSession')['id']) { ?>
												<div class="dchat dchat-masuk">
													<div class="dchat-isi">
														<div class="dchat-isi">
															<?=$valueA->teks?>
														</div>
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
													</div>
												</div>
											<?php } ?>
										</div>
									<?php }elseif ($valueA->jenis_pesan == 'permasalahan_solved') { ?>
									<div class="permasalahan-solved">
										<span class="detpes-status">
											Pertanyaan berstatus
										</span>
										<span class="btn btn-custom btn-status-green">
											<i class="fa fa-check-circle"></i>
											SOLVED
										</span>
									</div>
									<?php } ?>
								<?php } ?>
							<?php } ?>
						</div>

						<div class="detpes-write">
							<form action="<?=base_url('submit-reply-mahasiswa')?>" method="POST">
								<div class="input-group">
									<input type="hidden" class="form-control" name="permasalahan" value="<?=(isset($permasalahan[0]->id) ? $permasalahan[0]->id : '' )?>">
									<input type="hidden" class="form-control" name="komentar" value="<?=(isset($komentar[0]->id) ? $komentar[0]->id : '' )?>">
									<input type="hidden" class="form-control" name="untuk" value="<?=$komentator[0]->id?>">
									<input type="text" autofocus="" class="form-control" name="message" placeholder="Tulis pesan...">
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
</div>
<script type="text/javascript">
	timeAgo();
</script>