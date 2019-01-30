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
			<li class="active">Profil</li>
		</ol>
	</div><!--/.row-->
	<div class="main-container mr-1">
		<?=$this->session->flashdata("alert");?>
	</div>
	<div class="main-container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-plain">
					<div class="panel-body">
						<div class="row">
							<div class="col-md-4 col-xs-12 db midSpan">
								<div class="row">
									<div class="col-md-4 midSpan">
										<span class="bgicon icon-material-stack"></span>
									</div>
									<div class="col-md-7">
										<div class="visible-md visible-lg">
											<div class="vl"></div>
										</div>
										<div class="keterangan">
											<p>Problem Solved</p>
											<p class="keterangan-nilai">598K</p>
											<div class="dropdown keterangan-dropdown">
												<a href="#" data-toggle="dropdown"><label id="selected-dropdown-problem-solved"> </label> <i class="bgicon icon-arrow-down"></i></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="#" id="dropdown-problem-solved-hari-ini" onclick="problemSolved('hari')">Hari ini</a></li>
													<li><a href="#" id="dropdown-problem-solved-bulan-ini" onclick="problemSolved('bulan')">Bulan ini</a></li>
													<li><a href="#" id="dropdown-problem-solved-tahun-ini" onclick="problemSolved('tahun')">Tahun ini</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-4 col-xs-12 db midSpan">
								<div class="row">
									<div class="col-md-4 midSpan">
										<span class="bgicon icon-user"></span>
									</div>
									<div class="col-md-8">
										<div class="visible-md visible-lg">
											<div class="vl"></div>
										</div>
										<div class="keterangan">
											<p>User Visits</p>
											<p class="keterangan-nilai">50K</p>
											<div class="dropdown keterangan-dropdown">
												<a href="#" data-toggle="dropdown"><label id="selected-dropdown-pengunjung"> </label> <i class="bgicon icon-arrow-down"></i></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="#" id="dropdown-pengunjung-hari-ini" onclick="pengunjung('hari')">Hari ini</a></li>
													<li><a href="#" id="dropdown-pengunjung-bulan-ini" onclick="pengunjung('bulan')">Bulan ini</a></li>
													<li><a href="#" id="dropdown-pengunjung-tahun-ini" onclick="pengunjung('tahun')">Tahun ini</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>


							<div class="col-md-4 col-xs-12 db midSpan">
								<div class="row">
									<div class="col-md-4 midSpan">
										<span class="bgicon icon-user-add"></span>
									</div>
									<div class="col-md-8">
										<div class="keterangan">
											<p>Pengguna Baru</p>
											<p class="keterangan-nilai" id="pengguna-baru">677</p>
											<div class="dropdown keterangan-dropdown">
												<a href="#" data-toggle="dropdown"><label id="selected-dropdown-pengguna-baru"> </label> <i class="bgicon icon-arrow-down"></i></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="#" id="dropdown-pengguna-baru-hari-ini" onclick="penggunaBaru('hari')">Hari ini</a></li>
													<li><a href="#" id="dropdown-pengguna-baru-bulan-ini" onclick="penggunaBaru('bulan')">Bulan ini</a></li>
													<li><a href="#" id="dropdown-pengguna-baru-tahun-ini" onclick="penggunaBaru('tahun')">Tahun ini</a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-md-6">
				<h2>Permasalahan Terbaru</h2>
				<div class="scrollBox" id="ex">
					<div class="contentBox1">
						<div class="panel-plain">
							<div class="panel-body">
								<?php foreach ($pertanyaan as $key => $value) { ?>
									<a href="<?=base_url()?>kelola-konten-permasalahan">
										<div class="itemPesan">
											<div class="row">
												<div class="col-xs-12">
													<div class="mediaUser mid-v">
														<div class="media-left">
															<div class="user-photo">
																<img src="<?=base_url().$value->foto?>" class=" dbImg" alt="Photo">
															</div>
														</div>
														<div class="media-body permasalahan">
															<h5>
																<?=$value->nama_pengguna?>
																<span class="kanan bgicon icon-arrow-right"></span>
															</h5>
															<span class="btn btn-custom <?=($value->status == 'SOLVED') ? 'btn-status-green' : 'btn-status-red'?> ketPermasalahan"><i class="bgicon <?=($value->status== 'SOLVED') ? 'icon-mark' : 'icon-close'?>"></i> <?=$value->status?></span>
															<p><?=$value->teks?></p>
														</div>
													</div>
												</div>
											</div>	
											<div class="row">
												<div class="hrLine"></div>
											</div>
										</div>
										<div class="divider"></div>
									</a>
								<?php } ?>
							</div>
						</div>
					</div>
				</div>

			</div>
			<div class="col-md-6">
				<h2>Testimonial Terbaru</h2>
				<div class="scrollBox" id="ex">
					<div class="contentBox2">
						<div class="panel-plain">
							<div class="panel-body">
								<a href="kelola-testimonial.html">
									<div class="itemPesan">
										<div class="row">
											<div class="col-xs-12">
												<div class="mediaUser mid-v">
													<div class="media-left">
														<div class="user-photo">
															<img src="assets/images/reading.png" class="dbImg" alt="Photo">
														</div>
													</div>
													<div class="media-body permasalahan">
														<h5>Bambang Setyadi
															<span class="kanan bgicon icon-arrow-right"></span>
														</h5>
														<p>Saya terbantu karena disini saya mendapat banyak pengalaman dan pembelajaran.</p>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="td-pesan jarakLaporan">
												<a href="#"><span class="text-red">Hapus</span></a>
												<h5>14 Januari 2019</h5>
											</div>
										</div>			
										<div class="row">
											<div class="hrLine"></div>
										</div>
									</div>
								</a>
								<div class="divider"></div>

								<a href="kelola-testimonial.html">
									<div class="itemPesan">
										<div class="row">
											<div class="col-xs-12">
												<div class="mediaUser mid-v">
													<div class="media-left">
														<div class="user-photo">
															<img src="assets/images/reading.png" class="dbImg" alt="Photo">
														</div>
													</div>
													<div class="media-body permasalahan">
														<h5>Ana Mariana
															<span class="kanan bgicon icon-arrow-right"></span>
														</h5>
														<p>Banyak mahasiswa yang kreatif disini. Sangat membantu kami yang sedang mencari solusi pembelajaran</p>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="td-pesan jarakLaporan">
												<a href="#"><span class="text-red">Hapus</span></a>
												<h5>14 Januari 2019</h5>
											</div>
										</div>			
										<div class="row">
											<div class="hrLine"></div>
										</div>
									</div>
								</a>
								<div class="divider"></div>

								<a href="kelola-testimonial.html">
									<div class="itemPesan">
										<div class="row">
											<div class="col-xs-12">
												<div class="mediaUser mid-v">
													<div class="media-left">
														<div class="user-photo">
															<img src="assets/images/reading.png" class="dbImg" alt="Photo">
														</div>
													</div>
													<div class="media-body permasalahan">
														<h5>Isyana Sarasvati
															<span class="kanan bgicon icon-arrow-right"></span>
														</h5>
														<p>Fitur-fitur yang disediakan disini sangat membantu dalam proses pembelajaran bagik bagi murid maupun pendidik.</p>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="td-pesan jarakLaporan">
												<a href="#"><span class="text-red">Hapus</span></a>
												<h5>14 Januari 2019</h5>
											</div>
										</div>			
										<div class="row">
											<div class="hrLine"></div>
										</div>
									</div>
								</a>
								<div class="divider"></div>
								<div class="itemPesan">
									<a href="kelola-testimonial.html">
										<div class="row">
											<div class="col-xs-12">
												<div class="mediaUser mid-v">
													<div class="media-left">
														<div class="user-photo">
															<img src="assets/images/reading.png" class="dbImg" alt="Photo">
														</div>
													</div>
													<div class="media-body permasalahan">
														<h5>Bambang Setyadi
															<span class="kanan bgicon icon-arrow-right"></span>
														</h5>
														<p>Fitur-fitur yang disediakan disini sangat membantu dalam proses pembelajaran bagik bagi murid maupun pendidik.</p>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="td-pesan jarakLaporan">
												<a href="#"><span class="text-red">Hapus</span></a>
												<h5>14 Januari 2019</h5>
											</div>
										</div>			
										<div class="row">
											<div class="hrLine"></div>
										</div>
									</a>
								</div>
								<div class="divider"></div>
							</div>
						</div>



					</div>
				</div>

			</div>
			<div class="col-md-6">
				<h2>Lowongan yang perlu divalidasi</h2>
				<div class="scrollBox" id="ex">
					<div class="contentBox3">
						<div class="panel-plain">
							<div class="panel-body">
								<div class="itemPesan lapValidasi">
									<a href="lowongan-kerja.html">
										<div class="row">
											<div class="col-xs-12 kriteria">
												<div class="row">
													<div class="col-xs-11">
														<h5>Guru Tingkat SD yang Ulet, Bisa Mincrosoft Office Nilai Plus

															<div data-order="valid">
																<div class="saklar">
																	<input type="checkbox" class="saklar-switch" id="valid1" checked>
																	<label for="valid1"></label>
																</div>
															</div></h5>
														</div>
														<div class="col-xs-1">
															<em class="bgicon icon-arrow-right"></em>
														</div>
													</div>	
												</div>
												<div class="col-xs-12 mid">
													<div class="col-xs-12 col-md-4 laporanValidasi">
														<div class="mediaUser mid-v">
															<div class="media-left media-middle">
																<div class="user-photo">
																	<img src="assets/images/reading.png" alt="Photo">
																</div>
															</div>
															<div class="media-body">
																<h5>Willey Killie</h5>
															</div>
														</div>
													</div>
													<div class="col-xs-12 col-md-4 mid">
														<p>SDN Bunulrejo 2</p>
													</div>
													<div class="col-xs-12 col-md-4 mid">
														<p class="bgicon icon-map-marker">Malang Kota</p>
													</div>

												</div>
											</div>			
											<div class="row">
												<div class="hrLine"></div>
											</div>
										</a>
									</div>
									<div class="itemPesan lapValidasi">
										<a href="lowongan-kerja.html">
											<div class="row">
												<div class="col-xs-12 kriteria">
													<div class="row">
														<div class="col-xs-11">
															<h5>Guru Bahasa Inggris untuk Kelas 5 SD							
																<div data-order="invalid">
																	<div class="saklar">
																		<input type="checkbox" class="saklar-switch" id="valid2">
																		<label for="valid2"></label>
																	</div>
																</div>
															</h5>
														</div>
														<div class="col-xs-1">
															<em class="bgicon icon-arrow-right"></em>
														</div>
													</div>	
												</div>
												<div class="col-xs-12 mid">
													<div class="col-xs-12 col-md-4 laporanValidasi">
														<div class="mediaUser mid-v">
															<div class="media-left media-middle">
																<div class="user-photo">
																	<img src="assets/images/reading.png" alt="Photo">
																</div>
															</div>
															<div class="media-body">
																<h5>Willey Killie</h5>
															</div>
														</div>
													</div>
													<div class="col-xs-12 col-md-4 mid">
														<p>SDN Bunulrejo 2</p>
													</div>
													<div class="col-xs-12 col-md-4 mid">
														<p class="bgicon icon-map-marker">Malang Kota</p>
													</div>

												</div>
											</div>			
											<div class="row">
												<div class="hrLine"></div>
											</div>
										</a>
									</div>
									<div class="itemPesan lapValidasi">
										<a href="lowongan-kerja.html">
											<div class="row">
												<div class="col-xs-12 kriteria">
													<div class="row">
														<div class="col-xs-11">
															<h5>Guru Bahasa Jawa untuk Siswa Tingkat SD

																<div data-order="valid">
																	<div class="saklar">
																		<input type="checkbox" class="saklar-switch" id="valid3" checked>
																		<label for="valid3"></label>
																	</div>
																</div>
															</h5>
														</div>
														<div class="col-xs-1">
															<em class="bgicon icon-arrow-right"></em>
														</div>
													</div>	
												</div>
												<div class="col-xs-12 mid">
													<div class="col-xs-12 col-md-4 laporanValidasi">
														<div class="mediaUser mid-v">
															<div class="media-left media-middle">
																<div class="user-photo">
																	<img src="assets/images/reading.png" alt="Photo">
																</div>
															</div>
															<div class="media-body">
																<h5>Willey Killie</h5>
															</div>
														</div>
													</div>
													<div class="col-xs-12 col-md-4 mid">
														<p>SDN Bunulrejo 2</p>
													</div>
													<div class="col-xs-12 col-md-4 mid">
														<p class="bgicon icon-map-marker">Malang Kota</p>
													</div>

												</div>
											</div>			
											<div class="row">
												<div class="hrLine"></div>
											</div>
										</a>
									</div>
									<div class="divider"></div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>	<!--/.main-->
	<script type="text/javascript">	
		$( document ).ready(function() {
			problemSolved('tahun')
			pengunjung('tahun')
			penggunaBaru('tahun')
		});
		function problemSolved(argument) {
			var before = $("#selected-dropdown-problem-solved").html()
			if (before == 'Hari ini') {
				$("#dropdown-problem-solved-hari-ini").removeClass("none")
			}else if (before == 'Bulan ini') {
				$("#dropdown-problem-solved-bulan-ini").removeClass("none")
			}else if (before == 'Tahun ini') {
				$("#dropdown-problem-solved-tahun-ini").removeClass("none")
			}

			if (argument == 'hari') {
				$("#selected-dropdown-problem-solved").html("Hari ini");
				$("#dropdown-problem-solved-hari-ini").addClass("none")
				$("#dropdown-problem-solved-hari-ini").addClass("selected")
			}else if (argument == 'bulan') {
				$("#selected-dropdown-problem-solved").html("Bulan ini");
				$("#dropdown-problem-solved-bulan-ini").addClass("none")
				$("#dropdown-problem-solved-bulan-ini").addClass("selected")
			}else if (argument == 'tahun') {
				$("#selected-dropdown-problem-solved").html("Tahun ini");
				$("#dropdown-problem-solved-tahun-ini").addClass("none")
				$("#dropdown-problem-solved-tahun-ini").addClass("selected")
			}
			if (before !== " ") {
				// getDataMateri()
			}
		}
		function pengunjung(argument) {
			var before = $("#selected-dropdown-pengunjung").html()
			if (before == 'Hari ini') {
				$("#dropdown-pengunjung-hari-ini").removeClass("none")
			}else if (before == 'Bulan ini') {
				$("#dropdown-pengunjung-bulan-ini").removeClass("none")
			}else if (before == 'Tahun ini') {
				$("#dropdown-pengunjung-tahun-ini").removeClass("none")
			}

			if (argument == 'hari') {
				$("#selected-dropdown-pengunjung").html("Hari ini");
				$("#dropdown-pengunjung-hari-ini").addClass("none")
				$("#dropdown-pengunjung-hari-ini").addClass("selected")
			}else if (argument == 'bulan') {
				$("#selected-dropdown-pengunjung").html("Bulan ini");
				$("#dropdown-pengunjung-bulan-ini").addClass("none")
				$("#dropdown-pengunjung-bulan-ini").addClass("selected")
			}else if (argument == 'tahun') {
				$("#selected-dropdown-pengunjung").html("Tahun ini");
				$("#dropdown-pengunjung-tahun-ini").addClass("none")
				$("#dropdown-pengunjung-tahun-ini").addClass("selected")
			}
			if (before !== " ") {
				// getDataMateri()
			}
		}
		function penggunaBaru(argument) {
			var before = $("#selected-dropdown-pengguna-baru").html()
			if (before == 'Hari ini') {
				$("#dropdown-pengguna-baru-hari-ini").removeClass("none")
			}else if (before == 'Bulan ini') {
				$("#dropdown-pengguna-baru-bulan-ini").removeClass("none")
			}else if (before == 'Tahun ini') {
				$("#dropdown-pengguna-baru-tahun-ini").removeClass("none")
			}

			if (argument == 'hari') {
				$("#selected-dropdown-pengguna-baru").html("Hari ini");
				$("#dropdown-pengguna-baru-hari-ini").addClass("none")
				$("#dropdown-pengguna-baru-hari-ini").addClass("selected")
			}else if (argument == 'bulan') {
				$("#selected-dropdown-pengguna-baru").html("Bulan ini");
				$("#dropdown-pengguna-baru-bulan-ini").addClass("none")
				$("#dropdown-pengguna-baru-bulan-ini").addClass("selected")
			}else if (argument == 'tahun') {
				$("#selected-dropdown-pengguna-baru").html("Tahun ini");
				$("#dropdown-pengguna-baru-tahun-ini").addClass("none")
				$("#dropdown-pengguna-baru-tahun-ini").addClass("selected")
			}
			if (before !== " ") {
				// getDataMateri()
			}
		}

	</script>
