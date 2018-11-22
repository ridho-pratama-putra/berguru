<script type="text/javascript">
	
	// untuk perhitungan waktu yang lalu
	window.onload = pertanyaan('all');
	function timeAgo() {
		var templates = {
			prefix: "",
			suffix: " yang lalu",
			seconds: "beberapa detik",
			minute: "1 menit",
			minutes: "%d menit",
			hour: "1 jam",
			hours: "%d jam",
			day: "1 hari",
			days: "%d hari",
			month: "1 bulan",
			months: "%d bulan",
			year: "1 tahun",
			years: "%d tahun"
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
	
	// untuk get pertanyaan berdsasrkan kategoir
	function pertanyaan(argument) {
		$.get("<?=base_url()?>kategori-pertanyaan",{kategori : argument},function( data ) {
			data = JSON.parse(data);
			// console.log(data);
			$("#pertanyaanDitemukan").html(data.jumlah+" pertanyaan ditemukan");
			if (data.permasalahan.length != 0) {				
				var elementToRender = '';
				for (var i in data.permasalahan) {
				// for (var i = data.permasalahan.length - 1; i >= 0; i--) {
					elementToRender += 
					"<div class='panel panel-default panel-ask'>"+
						"<div class='panel-body'>"+
							"<div class='row panel-ask-account'>"+
								"<div class='col-sm-6'>"+
									"<div class='media'>"+
										"<div class='media-left media-middle'>"+
											"<a href='#' class='ask-photo'>"+
												"<img class='media-object' src='<?=base_url()?>"+data.permasalahan[i].foto+"' width='275' height='261' alt='Photo'>"+
											"</a>"+
										"</div>"+
										"<div class='media-body'>"+
											"<h4 class='media-heading'>"+data.permasalahan[i].nama_pengguna+"</h4>"+
											"<p class='ask-time timeago' title='"+data.permasalahan[i].tanggal+"'></p>"+
										"</div>"+
									"</div>"+
								"</div>"+
								"<div class='col-sm-6 ask-data-list'>"+
									"<div class='ask-data'>"+
										"<p class='data-value'>"+data.permasalahan[i].jumlah_dilihat+"</p>"+
										"<p class='data-label'>Dilihat</p>"+
									"</div>"+
									"<div class='ask-data'>"+
										"<p class='data-value'>"+data.permasalahan[i].jumlah_komen+"</p>"+
										"<p class='data-label'>Jawaban</p>"+
									"</div>"+
								"</div>"+
							"</div>"+
							"<div class='row panel-ask-content'>"+
								"<div class='col-md-12'>"+
									"<p>"+
										data.permasalahan[i].teks+
									"</p>"+
								"</div>"+
							"</div>"+
							"<div class='row panel-ask-answer'>"+
								"<div class='col-md-6'>"+
									"<ul class='list-inline list-commentator'>";
										if (data.permasalahan[i].komentator.length > 0 ) {
										elementToRender +=	
										"<li>"+
											"<p>Penjawab</p>"+
										"</li>";
										}
										
										for(var j in data.permasalahan[i].komentator){
										elementToRender += 
										"<li>"+
											"<a href='#' class='img-circle'>"+
												"<img src='<?=base_url()?>"+data.permasalahan[i].komentator[j].foto+"' width='275' height='261' alt='Photo' title='"+data.permasalahan[i].komentator[j].nama+"'>"+
											"</a>"+
										"</li>";
											
										}
										if(data.permasalahan[i].remaining_penjawab !== 0){
											elementToRender +=
											"<li class='commentator-count'>"+
												"<a href='#' class='img-circle'>"+data.permasalahan[i].remaining_penjawab+"+</a>"+
											"</li>";
										}
										elementToRender +=
									"</ul>"+
								"</div>"+
								"<div class='col-md-6 ask-action'>"+
									"<p>Anda Mahasiswa?</p>"+
									"<a href='<?=base_url()?>pertanyaan-detail-mahasiswa/"+data.permasalahan[i].id+"' class='btn btn-green'>Bantu Jawab</a>"+
								"</div>"+
							"</div>"+
						"</div>"+
					"</div>";
				}
				$("#"+argument).html(elementToRender);
				timeAgo();
			}else{
				$("#"+argument).html("<p><h4 class='text-center'>Data belum ada</h4></p>");
			}
		});
	}

</script>
		
	<div class="content-front">
		<!-- Kategori Konten -->
		<section class="category-list">
			<div class="container">
				<div class="row category-title">
					<div class="col-sm-6">
						<p>Telusuri sesuai kategori</p>
					</div>
					<div class="col-sm-6 category-more">
						<p><a href="#">Muat lebih banyak</a></p>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<ul class="list-inline learn-list">
								<li>
									<a href="#">
										<div class="panel panel-default">
											<div class="panel-body">
												<span class="bgicon bgicon-list"></span>
												<p>Semua</p>
											</div>
										</div>
									</a>
								</li>
							<?php foreach ($kategori as $key => $value) { ?>
							<li>
								<a href="#">
									<div class="panel panel-default">
										<div class="panel-body">
											<span class="bgicon <?=$value->icon?>"></span>
											<p><?=$value->nama?></p>
										</div>
									</div>
								</a>
							</li>
							<?php } ?>
						</ul>
					</div>
				</div>
			</div>
		</section>
		
		<section class="post-content">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						
						<!-- Pertanyaan -->
						<div class="row content-title ask-title">
							<div class="col-md-6">
								<h3 class="title">Pertanyaan</h3>
							</div>
							<div class="col-md-6 title-right">
								<?php if ($this->session->userdata('loginSession') == array() OR $this->session->userdata('loginSession')['aktor'] == 'pendidik') { ?>
									<a href="<?=base_url()?>buat-pertanyaan-pendidik" class="btn btn-green">Buat Pertanyaan</a>
								<?php } ?>
							</div>
						</div>
						
						<div class="row ask-header">
							<div class="col-md-4">
								<p class="ask-count" id="pertanyaanDitemukan"></p>
							</div>
							<div class="col-md-8 ask-menu">
								<ul class="nav nav-tabs nav-ask" role="tablist">
									<li role="presentation" class="active">
										<a href="#all" aria-controls="home" role="tab" data-toggle="tab" onclick="pertanyaan('semua')">Semua</a>
									</li>
									<li role="presentation">
										<a href="#populer" aria-controls="profile" role="tab" data-toggle="tab" onclick="pertanyaan('populer')">Populer</a>
									</li>
									<li role="presentation">
										<a href="#solved" aria-controls="messages" role="tab" data-toggle="tab" onclick="pertanyaan('solved')">Solved</a>
									</li>
									<li role="presentation">
										<a href="#unsolved" aria-controls="settings" role="tab" data-toggle="tab" onclick="pertanyaan('unsolved')">Unsolved</a>
									</li>
								</ul>
							</div>
						</div>
						
						<div class="row ask-list">
							<div class="col-xs-12">
								<div class="tab-content">
									
									<!-- Semua Kategori -->
									<div role="tabpanel" class="tab-pane active" id="all"></div>
									<div role="tabpanel" class="tab-pane" id="populer"></div>
									<div role="tabpanel" class="tab-pane" id="solved"></div>
									<div role="tabpanel" class="tab-pane" id="unsolved"></div>
									<?php if ($this->session->userdata('loginSession') ==array()) { ?>
										
									<div>
										<div class="row">
											<div class="col-xs-12">
												<div class="ask-cta">
													<div class="ask-cta-left">
														<p>Tertarik untuk ikut memberi pertanyaan atau solusi?</p>
													</div>
													<div class="ask-cta-right">
														<a href="<?=base_url()?>register" class="btn btn-transparent-white">Daftar Sekarang</a>
													</div>
												</div>
											</div>
										</div>
										
										<div class="load-more">
											<div class="load-line"></div>
											<div class="load-btn">
												<a href="#" class="btn btn-transparent-blue">Muat Lebih Banyak</a>
											</div>
										</div>
									</div>
									<?php } ?>
								</div>
							</div>
						</div>
						
						<!-- Testimonial -->
						<div class="row content-title testi-title">
							<div class="col-md-6">
								<h3 class="title">Cerita Mereka</h3>
							</div>
							<div class="col-md-6 title-right">
								<a href="#" class="link">Lihat Cerita Lainnya</a>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12">
								<div class="owl-carousel owl-theme testi-carousel">
									<div class="item">
										<div class="panel panel-default panel-testi">
											<div class="panel-body">
												<p class="testi-text">
													Saya sangat terbantu disini, cukup dengan post pertanyan maka berbagai
													solusi alternatif akan bermunculan.
												</p>
												<div class="media">
													<div class="media-left media-middle">
														<a href="#" class="testi-photo">
															<img class="media-object" src="<?=base_url()?>assets/assets/images/thumbnails/Sylvian.png" width="100" height="100" alt="Photo">
														</a>
													</div>
													<div class="media-body">
														<h4 class="media-heading">Ibu Ami,</h4>
														<p class="testi-job">Guru SDN Bareng 1</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="item">
										<div class="panel panel-default panel-testi">
											<div class="panel-body">
												<p class="testi-text">
													Banyak mahasiswa yang kreatif disini. Sangat membantu bagi kami yang ingin mencari solusi
													terkait materi pembelajaran.
												</p>
												<div class="media">
													<div class="media-left media-middle">
														<a href="#" class="testi-photo">
															<img class="media-object" src="<?=base_url()?>assets/assets/images/thumbnails/Sylvian.png" width="100" height="100" alt="Photo">
														</a>
													</div>
													<div class="media-body">
														<h4 class="media-heading">Ibu Ami,</h4>
														<p class="testi-job">Guru SDN Bareng 1</p>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					
					<!-- Sidebar -->
					<div class="col-lg-4">
					   
						<!-- Konten Iklan -->
						<div class="adv-content">
							<div class="panel panel-default">
								<div class="panel-body">
									<img src="<?=base_url()?>assets/assets/images/adv-1.png" width="343" height="104" alt="Adv image" class="img-responsive adv-img">
									<span class="tag tag-white adv-tag">Iklan</span>
								</div>
							</div>
						</div>
						
						<!-- Jumlah Pertanyaan Solved -->
						<div class="solved-question">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="media">
										<div class="media-left media-middle">
											<div class="media-object">
												<span class="bgicon bgicon-comment"></span>
											</div>
										</div>
										<div class="media-body">
											<h4 class="media-heading"><?=$pertanyaan_solved[0]->id?></h4>
											<p class="media-caption">Pertanyaan Solved</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Daftar Poin Mahasiswa -->
						<div class="panel panel-default student-list right-list">
							<div class="panel-body">
								<div class="sidebar-title student-title">
									<h3 class="title">Mahasiswa Poin Tertinggi</h3>
									<select class="sidebar-filter">
										<option>Harian</option>
										<option>Bulan</option>
										<option>Bulan Lalu</option>
									</select>
								</div>
								<?php if ($mahasiswa_poin_tertinggi != array()) {
									foreach ($mahasiswa_poin_tertinggi as $key => $value) { ?>
									
								<div class="student-item">
									<div class="media">
										<div class="media-left media-middle">
											<a href="#" class="student-photo">
												<img src="<?=base_url().$value->foto?>" width="" height="" class="img-circle" alt="Image" class="media-object">
											</a>
										</div>
										<div class="media-body">
											<h4 class="media-heading"><?=$value->nama?></h4>
											<p class="student-solution">31 Solusi</p>
											<a href="#" class="tag tag-orange student-point"><span class="bgicon bgicon-point"></span> <?=$value->poin?></a>
											<a href="#" class="tag tag-blue student-msg">Kirim Pesan</a>
										</div>
									</div>
								</div>
								<a href="#" class="btn btn-transparent-blue">Muat Lebih Banyak</a>
								<?php }}else{ ?>
								<h6 class="title text-center"> Data mahasiswa masih kosong</h6>
								<?php } ?>
							</div>
						</div>
						
						<!-- Daftar Lowongan Kerja -->
						<div class="panel panel-default vacancy-list right-list">
							<div class="sidebar-title panel-header">
								<h3 class="title">Lowongan Pekerjaan</h3>
							</div>
								<div class="panel-body">
								<?php 
								if ($lowongan !== array()) {
									foreach ($lowongan as $key => $value) { ?>
										<div class="vacancy-item">
											<h4 class="vacancy-title"><a href="#"><?=$value->nama?></a></h4>
											<p class="vacancy-desc"><?=$value->instansi?> <span class="bgicon bgicon-map-marker"> </span> <i> <?=$value->lokasi?></i></p>
											<a href="#" class="vacancy-close"><span class="bgicon bgicon-close"></span></a>
										</div>
								</div>
								<a href="#" class="btn btn-transparent-blue">Muat Lebih Banyak</a>
								<?php }
								}else{ ?>
									<h6 class="title text-center"> Data lowongan masih kosong</h6>
								</div>
								<?php }	?>
						</div>
						
						<!-- Daftar Materi -->
						<div class="panel panel-default material-list right-list">
							<div class="panel-body">
								<div class="sidebar-title material-title">
									<h3 class="title">Materi Menarik</h3>
									<select class="sidebar-filter">
										<option>Harian</option>
										<option>Bulan</option>
										<option>Bulan Lalu</option>
									</select>
								</div>
								<?php if ($materi !== array()) { ?>
								<?php foreach ($materi as $key => $value) { ?>
									<div class="material-item">
										<div class="media cat-diamond">
											<div class="media-left media-middle">
												<div class="media-object">
													<span class="bgicon <?=$value->ikon_logo?>"></span>
												</div>
											</div>
											<div class="media-body">
												<h4 class="media-heading"><a href="#"><?=$value->nama?></a></h4>
												<p>Post oleh <cite><?=$value->siapa_terakhir_edit?></cite> <span class="count"><i class="bgicon bgicon-download"></i> <?=$value->jumlah_diunduh?></span></p>
											</div>
										</div>
									</div>
								<?php } ?>
									<a href="#" class="btn btn-transparent-blue">Muat Lebih Banyak</a>
								<?php }else{ ?>
									<h6 class="title text-center"> Data materi masih kosong</h6>
								<?php } ?>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</section>
	</div>
		