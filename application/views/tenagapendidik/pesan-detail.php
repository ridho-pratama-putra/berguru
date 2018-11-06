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
						<div class="pesan-item">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Daniel Webber
								</div>
								<div class="last-pesan">
									Wah, kenapa ya padahal hal ini sangatlah asik dan gitu
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									1h
								</span>
								<span class="badge">2</span>
							</div>
						</div>
						<div class="pesan-item pi-read pi-selected">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Aleister Don
								</div>
								<div class="last-pesan">
									Sweet sweet seventy, I am a whole show
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									2d
								</span>
								<span class="badge">1</span>
							</div>
						</div>
						<div class="pesan-item">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Juminten Antartika
								</div>
								<div class="last-pesan">
									Sweet sweet seventy, I am a whole show
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									2d
								</span>
								<span class="badge">1</span>
							</div>
						</div>
						<div class="pesan-item">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Adam McMahon
								</div>
								<div class="last-pesan">
									Sweet sweet seventy, I am a whole show
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									2d
								</span>
								<span class="badge">1</span>
							</div>
						</div>
						<div class="pesan-item">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Fanny Wibowo
								</div>
								<div class="last-pesan">
									Sweet sweet seventy, I am a whole show
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									2d
								</span>
								<span class="badge">99</span>
							</div>
						</div>

					</div>
				</div>
				<div class="col-sm-6 col-md-7 col-lg-9 panel-pright">
					<div class="panel-body detail-pesan">
						<div class="detpes-top scrollable">
							<div class="detpes-header">
								<div class="row">
									<div class="col-md-6 text-right col-md-push-6">
										<span class="text-muted">Badge</span>
										<div class="profile-achievement">
											<div class="achie achie-orange" title="Pencapaian"><i class="fa fa-star"></i></div>
											<div class="achie achie-green" title="Pencapaian"><i class="fa fa-trophy"></i></div>
											<div class="achie achie-blue" title="Pencapaian"><i class="far fa-gem"></i></div>
											<!-- <div class="achie achie-black" title="Pencapaian"><i class="fa fa-bicycle"></i></div> -->
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
							<div class="detpes-masalah">
								<h4>Permasalahan Anda</h4>
								<?=$pertanyaan[0]->teks?>
							</div>
							<div class="detpes-chats">
								<div class="dchat-htime"><?=($komentar[0]->tanggal == date('Y-m-d') ? 'Hari Ini' : tgl_indo(substr($komentar[0]->tanggal, 0, 10))) ?></div>
								<div class="dchat dchat-keluar">
									<div class="dchat-isi">
											<?=$komentar[0]->teks?>
									</div>
									<div class="dchat-footer">
										<small class="text-muted">Permasalahan terpecahkan?</small>
										<div class="row">
											<div class="col-md-8">
													<a href="#" class="btn btn-custom btn-plonk-green">Iya</a>
													<a href="#" class="btn btn-custom btn-plonk-red">Tidak</a>
											</div>
											<div class="col-md-4 text-right">
												<span class="dchat-time">9.09 pm</span>
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

							<div class="detpes-header">
								<div class="row">
									<div class="col-md-6 text-right col-md-push-6">
										<span class="text-muted">Badge</span>
										<div class="profile-achievement">
											<div class="achie achie-orange" title="Pencapaian"><i class="fa fa-star"></i></div>
											<div class="achie achie-green" title="Pencapaian"><i class="fa fa-trophy"></i></div>
											<div class="achie achie-blue" title="Pencapaian"><i class="far fa-gem"></i></div>
											<!-- <div class="achie achie-black" title="Pencapaian"><i class="fa fa-bicycle"></i></div> -->
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
							<div class="detpes-masalah">
								<h4>Permasalahan Anda</h4>
								<?=$pertanyaan[0]->teks?>
							</div>
							<div class="detpes-chats">
								<div class="dchat-htime"><?=($komentar[0]->tanggal == date('Y-m-d') ? 'Hari Ini' : tgl_indo(substr($komentar[0]->tanggal, 0, 10))) ?></div>
								<div class="dchat dchat-keluar">
									<div class="dchat-isi">
											<?=$komentar[0]->teks?>
									</div>
									<div class="dchat-footer">
										<small class="text-muted">Permasalahan terpecahkan?</small>
										<div class="row">
											<div class="col-md-8">
													<a href="#" class="btn btn-custom btn-plonk-green">Iya</a>
													<a href="#" class="btn btn-custom btn-plonk-red">Tidak</a>
											</div>
											<div class="col-md-4 text-right">
												<span class="dchat-time">9.09 pm</span>
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

						</div>

						<div class="detpes-write">
							<form action="">
								<div class="input-group">
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