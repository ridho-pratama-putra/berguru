<div class="content-front">

	<!-- Kategori Konten -->
	<section class="category-list">
		<div class="container">
			<div class="row category-title">
				<div class="col-sm-6">
					<p>Telusuri sesuai kategori</p>
				</div>
				<div class="col-sm-6 category-more hidden-xs">
					<p><a href="#">Muat lebih banyak</a></p>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="owl-carousel category-carousel learn-list">
						<div class="item">
							<a href="kategori-mapel.html">
								<div class="panel panel-default">
									<div class="panel-body">
										<span class="bgicon icon-lists"></span>
										<p>Semua</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="kategori-mapel.html">
								<div class="panel panel-default">
									<div class="panel-body">
										<span class="bgicon icon-material-puzzle"></span>
										<p>Matematika</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="kategori-mapel.html">
								<div class="panel panel-default">
									<div class="panel-body">
										<span class="bgicon icon-material-note"></span>
										<p>B. Indonesia</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="kategori-mapel.html">
								<div class="panel panel-default">
									<div class="panel-body">
										<span class="bgicon icon-material-chemical"></span>
										<p>Kimia</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="kategori-mapel.html">
								<div class="panel panel-default">
									<div class="panel-body">
										<span class="bgicon icon-material-stack"></span>
										<p>Fisika</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="kategori-mapel.html">
								<div class="panel panel-default">
									<div class="panel-body">
										<span class="bgicon icon-material-book"></span>
										<p>Sejarah</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="kategori-mapel.html">
								<div class="panel panel-default">
									<div class="panel-body">
										<span class="bgicon icon-material-people"></span>
										<p>Ilmu Sosial</p>
									</div>
								</div>
							</a>
						</div>
						<div class="item">
							<a href="kategori-mapel.html">
								<div class="panel panel-default">
									<div class="panel-body">
										<span class="bgicon icon-material-basketball"></span>
										<p>Olahraga</p>
									</div>
								</div>
							</a>
						</div>                                
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="post-content">
		<div class="container">
			<div class="row">
				<div class="col-md-8">

					<!-- Pertanyaan -->
					<div class="row content-title ask-title">
						<div class="col-md-6">
							<h3 class="title">Pertanyaan</h3>
						</div>
						<div class="col-md-6 title-right">
							<a href="<?=base_url()?>buat-pertanyaan-pendidik" class="btn btn-green">Buat Pertanyaan</a>
						</div>
					</div>

					<div class="row ask-header">
						<div class="col-lg-4">
							<p class="ask-count" id="pertanyaanDitemukan"></p>
						</div>
						<div class="col-lg-8 ask-menu">
							<ul class="nav nav-tabs nav-ask" role="tablist">
								<li role="presentation" class="active">
									<a href="#all" role="tab" data-toggle="tab" onclick="pertanyaan('all')">Semua</a>
								</li>
								<li role="presentation">
									<a href="#populer" role="tab" data-toggle="tab" onclick="pertanyaan('populer')">Populer</a>
								</li>
								<li role="presentation">
									<a href="#solved" role="tab" data-toggle="tab" onclick="pertanyaan('solved')">Solved</a>
								</li>
								<li role="presentation">
									<a href="#unsolved" role="tab" data-toggle="tab" onclick="pertanyaan('unsolved')">Unsolved</a>
								</li>
							</ul>
						</div>
					</div>

					<div class="row ask-list">
						<div class="col-xs-12">
							<div class="tab-content" id="results">

								<!-- Semua Kategori -->
								<div role="tabpanel" class="tab-pane active" id="all"></div>
								<div role="tabpanel" class="tab-pane" id="populer"></div>
								<div role="tabpanel" class="tab-pane" id="solved"></div>
								<div role="tabpanel" class="tab-pane" id="unsolved"></div>
								<?php if ($this->session->userdata('loginSession') == NULL) { ?>

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
							<div class="owl-carousel testi-carousel">
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
														<img class="media-object" src="assets/images/thumbnails/Sylvian.png" width="100" height="100" alt="Photo">
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
												Fitur-fitur yang disediakan disini sangat membantu dalam proses pembelajaran bagi murid maupun pendidik.
											</p>
											<div class="media">
												<div class="media-left media-middle">
													<a href="#" class="testi-photo">
														<img class="media-object" src="assets/images/thumbnails/Sylvian.png" width="100" height="100" alt="Photo">
													</a>
												</div>
												<div class="media-body">
													<h4 class="media-heading">Ibu Ana,</h4>
													<p class="testi-job">Guru SDN Bunulrejo 2</p>
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
														<img class="media-object" src="assets/images/thumbnails/Sylvian.png" width="100" height="100" alt="Photo">
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
				<div class="col-md-4">

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
											<span class="bgicon icon-comment"></span>
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
								<select class="sidebar-filter" onchange="rangking_mahasiswa()" id="select-rangking-mahasiswa">
									<option value='semua'>Semua</option>
									<option value='bulan_lalu'>Bulan Lalu</option>
									<option value='bulan'>Bulan ini</option>
									<option value='harian'>Hari ini</option>
								</select>
							</div>
							<div id="rangking-mahasiswa"></div>
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
								foreach ($lowongan as $key => $value) { 
									?>
									<div class="vacancy-item">
										<h4 class="vacancy-title"><a href="#"><?=$value->nama?></a></h4>
										<p class="vacancy-desc"><?=$value->instansi?> <span class="bgicon icon-map-marker"> </span> <i> <?=$value->lokasi?></i></p>
										<a href="#" class="vacancy-close"><span class="bgicon bgicon-close"></span></a>
									</div>
									<a href="#" class="btn btn-transparent-blue">Muat Lebih Banyak</a>
								<?php } ?>
							</div>
						<?php }else{ ?>
							<h6 class="title text-center"> Data lowongan masih kosong</h6>
						</div>
					<?php }	?>
				</div>

				<!-- Daftar Materi -->
				<div class="panel panel-default material-list right-list">
					<div class="panel-body">
						<div class="sidebar-title material-title">
							<h3 class="title">Materi Menarik</h3>
							<select class="sidebar-filter" onchange="materi()" id="select-materi-menarik">
								<option value='semua'>Semua</option>
								<option value='bulan_lalu'>Bulan Lalu</option>
								<option value='bulan'>Bulan</option>
								<option value='hari'>Hari ini</option>
							</select>
						</div>
						<div id="materi-menarik"></div>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>
</div>

<script type="text/javascript">

	// untuk perhitungan waktu yang lalu
	pertanyaan('all');
	rangking_mahasiswa()
	materi()

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
		$.get("<?=base_url()?>kategori-status",{tipe : argument},function( data ) {
			data = JSON.parse(data);
			// console.log(data);
			$("#pertanyaanDitemukan").html(data.jumlah+" pertanyaan ditemukan");
			if (data.permasalahan.length != 0) {				
				var elementToRender = '';
				for (var i in data.permasalahan) {
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
					"<div class='col-md-6 ask-commentator'>"+
					"<ul class='list-inline list-commentator'>";
					if (data.permasalahan[i].komentator.length > 0 ) {
						elementToRender +=	
						"<li class='commentator-caption'>"+
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
					"</div>"
					if ((data.data_login.aktor == "mahasiswa" || data.data_login.aktor == null) && data.permasalahan[i].status == "UNSOLVED") {
						elementToRender +=
						"<div class='col-md-6 ask-action'>"+
						"<p>Anda Mahasiswa? </p> "+
						"<a href='<?=base_url()?>pertanyaan-detail-mahasiswa/"+data.permasalahan[i].id+"' class='btn btn-green'>Bantu Jawab</a>"+
						"</div>"
					}else{
						elementToRender +=
						"<div class='col-md-6 ask-action'>"+
						"<a  class='btn btn-green' disabled=''>Terselesaikan</a>"+
						"</div>"
					}
					elementToRender +=
					"</div>"+
					"</div>"+
					"</div>";
				}
				elementToRender += 
				"<div>"+
				"<div class='load-more'>"+
				"<div class='load-line'></div>"+
				"<div class='load-btn'>"+
				"<a href='' class='btn btn-transparent-blue'>Muat Lebih Banyak </a> "+
				"</div>"+
				"</div>"+
				"</div>"
				$("#"+argument).html(elementToRender);
				timeAgo();
			}else{
				$("#"+argument).html("<p><h4 class='text-center'>Data belum ada</h4></p>");
			}
		});
	}

	// function untuk get rangking mahasiswa besertai poin dan permasalhan
	function rangking_mahasiswa() {
		$.get("<?=base_url()?>get-rangking-mahasiswa",{limit : 7,jangka_waktu:$("#select-rangking-mahasiswa").val()},function( res ) {
			res =JSON.parse(res)
			// console.log(res)
			elementToRender = ''
			if (res.data.length !== 0) {
				if (res.dm_available !== null) {
					for (var i = 0; i < res.data.length; i++) {
						elementToRender +=
						'<div class="student-item">'+
						'<div class="media">'+
						'<div class="media-left media-middle">'+
						'<a href="#" class="student-photo">'+
						'<img src="<?=base_url()?>'+res.data[i].foto+'" width="" height="" class="img-circle" alt="Image" class="media-object">'+
						'</a>'+
						'</div>'+
						'<div class="media-body">'+
						'<h4 class="media-heading">'+res.data[i].nama+'</h4>'+
						'<p class="student-solution">'+res.data[i].jumlah_komentar+' Solusi</p>'+
						'<a href="#" class="tag tag-orange student-point"><span class="bgicon icon-point"></span>'+res.data[i].poin+'</a>'+
						'<a href="#" class="tag tag-blue student-msg">Kirim Pesan</a>'+
						'</div>'+
						'</div>'+
						'</div>'
					}
				}else{
					for (i in res.data){
						elementToRender +=
						'<div class="student-item">'+
						'<div class="media">'+
						'<div class="media-left media-middle">'+
						'<a href="#" class="student-photo">'+
						'<img src="<?=base_url()?>'+res.data[i].foto+'" width="" height="" class="img-circle" alt="Image" class="media-object">'+
						'</a>'+
						'</div>'+
						'<div class="media-body">'+
						'<h4 class="media-heading">'+res.data[i].nama+'</h4>'+
						'<p class="student-solution">'+res.data[i].jumlah_komentar+' Solusi</p>'+
						'<a href="#" class="tag tag-orange student-point"><span class="bgicon icon-point"></span>'+res.data[i].poin+'</a>'+
						'</div>'+
						'</div>'+
						'</div>'
					}
				}
				elementToRender += '<a href="#" class="btn btn-transparent-blue">Muat Lebih Banyak</a>'
			}else{
				elementToRender += 
				'<h6 class="title text-center"> Data mahasiswa poin tertinggi untuk kategori yang anda pilih belum tersedia</h6>'+
				'</div>'
			}
			$("#rangking-mahasiswa").html(elementToRender);
		});
	}

	// function untuk menmapilkan materi disertai sorting per hari dan perbulan
	function materi() {
		argument = $("#select-materi-menarik").val();
		$.get("<?=base_url()?>get-materi",{limit : 7, jangka_waktu:argument},function( res ) {
			res = JSON.parse(res)
			elementToRender = ''
			$('#materi-menarik').html(elementToRender);
			if (res.data.length === 0) {
				elementToRender += 
				'<h6 class="title text-center"> Data materi masih kosong untuk kategori yang anda pilih</h6>'
			}else{
				for (var i = 0; i < res.data.length; i++) {
					elementToRender += 
					'<div class="material-item">'+
					'<div class="media '+res.data[i].ikon_cat+'">'+
					'<div class="media-left media-middle">'+
					'<div class="media-object">'+
					'<span class="bgicon '+res.data[i].ikon_logo+'"></span>'+
					'</div>'+
					'</div>'+
					'<div class="media-body">'+
					'<h4 class="media-heading"><a href="#">'+res.data[i].nama+'</a></h4>'+
					'<p>Post oleh <cite>'+res.data[i].siapa_terakhir_edit+'</cite> <span class="count"><i class="bgicon icon-download"></i> '+res.data[i].jumlah_diunduh+'</span></p>'+
					'</div>'+
					'</div>'+
					'</div>'
				}
				elementToRender += 
				'<a href="<?=base_url()?>materi-detil" class="btn btn-transparent-blue">Muat Lebih Banyak</a>'
			}
			$('#materi-menarik').html(elementToRender);
		});
	}
</script>