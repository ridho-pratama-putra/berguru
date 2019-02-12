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
											<p class="keterangan-nilai" id="jumlah-problem-solved-per-jangka"></p>
											<div class="dropdown keterangan-dropdown">
												<a href="#" data-toggle="dropdown"><label id="selected-dropdown-problem-solved"> </label> <i class="bgicon icon-arrow-down"></i></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="#" class="solved-per-jangka" id="dropdown-problem-solved-hari-ini" onclick="problemSolved('hari')" data-property='hari'>Hari ini</a></li>
													<li><a href="#" class="solved-per-jangka" id="dropdown-problem-solved-bulan-ini" onclick="problemSolved('bulan')" data-property='bulan'>Bulan ini</a></li>
													<li><a href="#" class="solved-per-jangka" id="dropdown-problem-solved-tahun-ini" onclick="problemSolved('tahun')" data-property='tahun'>Tahun ini</a></li>
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
											<p class="keterangan-nilai" id="jumlah-pengunjung-per-jangka"></p>
											<div class="dropdown keterangan-dropdown">
												<a href="#" data-toggle="dropdown"><label id="selected-dropdown-pengunjung"> </label> <i class="bgicon icon-arrow-down"></i></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="#" class="pengunjung-per-jangka" id="dropdown-pengunjung-hari-ini" onclick="pengunjung('hari')" data-property='hari'>Hari ini</a></li>
													<li><a href="#" class="pengunjung-per-jangka" id="dropdown-pengunjung-bulan-ini" onclick="pengunjung('bulan')" data-property='bulan'>Bulan ini</a></li>
													<li><a href="#" class="pengunjung-per-jangka" id="dropdown-pengunjung-tahun-ini" onclick="pengunjung('tahun')" data-property='tahun'>Tahun ini</a></li>
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
											<p class="keterangan-nilai" id="jumlah-pengguna-baru-per-jangka"></p>
											<div class="dropdown keterangan-dropdown">
												<a href="#" data-toggle="dropdown"><label id="selected-dropdown-pengguna-baru"> </label> <i class="bgicon icon-arrow-down"></i></a>
												<ul class="dropdown-menu dropdown-menu-right">
													<li><a href="#" class="pengguna-baru-per-jangka" id="dropdown-pengguna-baru-hari-ini" onclick="penggunaBaru('hari')" data-property='hari'>Hari ini</a></li>
													<li><a href="#" class="pengguna-baru-per-jangka" id="dropdown-pengguna-baru-bulan-ini" onclick="penggunaBaru('bulan')" data-property='bulan'>Bulan ini</a></li>
													<li><a href="#" class="pengguna-baru-per-jangka" id="dropdown-pengguna-baru-tahun-ini" onclick="penggunaBaru('tahun')" data-property='tahun'>Tahun ini</a></li>
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
								<?php
								if (sizeof($testimonial) !== 0) {
									foreach ($testimonial as $key => $value) { ?>
										<!-- START testi -->
										<a href="<?=base_url()?>kelola-testimonial">
											<div class="itemPesan">
												<div class="row">
													<div class="col-xs-12">
														<div class="mediaUser mid-v">
															<div class="media-left">
																<div class="user-photo">
																	<data> </data><img src="<?=base_url().$value->foto?>" class="dbImg" alt="Photo">
																</div>
															</div>
															<div class="media-body permasalahan">
																<h5>
																	<?=$value->nama?>
																	<span class="kanan bgicon icon-arrow-right"></span>
																</h5>
																<p><?=$value->teks?></p>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="td-pesan jarakLaporan">
														<a href="<?=base_url()?>delete-testimonial/<?=$value->id?>"><span class="text-red">Hapus</span></a>
														<h5><?=tgl_indo($value->tanggal)?></h5>
													</div>
												</div>			
												<div class="row">
													<div class="hrLine"></div>
												</div>
											</div>
										</a>
										<div class="divider"></div>
										<!-- END testi -->
									<?php }
								}else{ ?>
									<h6 class="text-center">Belum ada testimonial</h6>
								<?php } ?>
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
								<!-- START lowongan-->
								<?php
								if (sizeof($lowongan) !== 0) {
									foreach ($lowongan as $key => $value) {?>
										<div class="itemPesan lapValidasi">
											<a href="lowongan-kerja.html">
												<div class="row">
													<div class="col-xs-12 kriteria">
														<div class="row">
															<div class="col-xs-11">
																<h5>
																	<?=$value->teks_lowongan?>
																	<div data-order="valid">
																		<div class="saklar">
																			<input type="checkbox" class="saklar-switch" id="valid<?=$value->id?>" <?=($value->valid == 0 ? '' : 'checked')?>  onclick="valid(<?=$value->id?>)">
																			<label for="valid<?=$value->id?>"></label>
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
																	<h5><?=$value->nama_pengguna?></h5>
																</div>
															</div>
														</div>
														<div class="col-xs-12 col-md-4 mid">
															<p><?=$value->instansi?></p>
														</div>
														<div class="col-xs-12 col-md-4 mid">
															<p class="bgicon icon-map-marker"><?=$value->lokasi?></p>
														</div>

													</div>
												</div>			
												<div class="row">
													<div class="hrLine"></div>
												</div>
											</a>
										</div>
										<!-- END -->	
									<?php }
								}else{ ?>
									<h6 class="text-center">Belum ada lowongan yang perlu divalidasi</h6>
								<?php }
								?>
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

		$(".solved-per-jangka").removeClass('none')
		$(".solved-per-jangka").removeClass('selected')

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
		$.get("<?=base_url()?>Admin/getJumlahProblemSolved",{jangka_waktu : argument},function (res) {
			res = JSON.parse(res);
			$("#jumlah-problem-solved-per-jangka").html(res)
		});
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

		$(".pengunjung-per-jangka").removeClass('none')
		$(".pengunjung-per-jangka").removeClass('selected')

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
		$.get("<?=base_url()?>Admin/getJumlahPengunjung",{jangka_waktu : argument},function (res) {
			res = JSON.parse(res);
			$("#jumlah-pengunjung-per-jangka").html(res[0].jumlah)
		});
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

		$(".pengguna-baru-per-jangka").removeClass('none')
		$(".pengguna-baru-per-jangka").removeClass('selected')

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
		$.get("<?=base_url()?>Admin/getJumlahPenggunaBaru",{jangka_waktu : argument},function (res) {
			res = JSON.parse(res);
			$("#jumlah-pengguna-baru-per-jangka").html(res)
		});
		if (before !== " ") {
			// getDataMateri()
		}
	}

	/*
	* function untuk validasi lowongan
	* param1 id
	*/
	function valid(argument) {
		$.post("<?=base_url()?>submit-validasi-lowongan",{id : argument},function (html) {			
			$("#notif").html(html);
		});
	}
</script>
