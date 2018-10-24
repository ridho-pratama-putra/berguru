<script type="text/javascript">
	$(document).ready(function(){
		window.onload = kategori('all');
	});
	
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

	function kategori(argument) {
		$(".cfc-item").removeClass("active");
		$("#"+argument).addClass("active");
		$.get("<?=base_url()?>get-permasalahan-by-kategori",{kategori:argument},function(data){
			data = JSON.parse(data);
			var elementToRender = '';
			if (data.permasalahan.length != 0) {
				for (var i = data.permasalahan.length - 1; i >= 0; i--) {
					elementToRender += 
					"<div class='panel panel-plain content-item'>"+
							"<div class='panel-body'>"+
								"<div class='ci-heading'>"+
									"<div class='row'>"+
										"<div class='col-xs-9 col-md-8 col-lg-9'>"+
											"<div class='user-photo'>"+
												"<img src='<?=base_url()?>assets/dashboard/assets/images/reading.png' alt='Photo'>"+
											"</div>"+
											"<div class='user-nama'>"+
												data.permasalahan[i].nama_pengguna +
												"<div class='user-last-online'>"+
													"<i class='far fa-clock'></i>"+
													"<span class='timeago' title='"+data.permasalahan[i].tanggal+"'></span>"+
												"</div>"+
											"</div>";
											if (data.permasalahan[i].status == "SOLVED") {
											elementToRender += 
											"<div class='btn btn-custom btn-status-green'>"+
												"<i class='fa fa-check-circle'></i> Solved"+
											"</div>";
											}else{
											elementToRender += 
											"<div class='btn btn-custom btn-status-red'>"+
												"<i class='fa fa-times'></i> Unsolved"+
											"</div>";
											}
										elementToRender += 
										"</div>"+
										"<div class='col-xs-3 col-md-4 col-lg-3 angka-container'>"+
											"<div class='ci-angka'>"+
												"<div class='number'>"+data.permasalahan[i].jumlah_dilihat+"</div>"+
												"<div class='text'>Dilihat</div>"+
											"</div>"+
											"<div class='ci-angka'>"+
												"<div class='number'>"+data.permasalahan[i].jumlah_komen+"</div>"+
												"<div class='text'>Jawaban</div>"+
											"</div>"+
										"</div>"+
									"</div>"+
								"</div>"+
								"<h3 class='ci-title'>"+
									data.permasalahan[i].teks+
								"</h3>"+
								"<div class='ci-footer'>"+
									"<div class='row'>"+
										"<div class='col-xs-12 col-md-8 col-lg-9'>"+
											"<span class='text-muted'>Penjawab</span>"+
											"<div class='user-photo'>"+
												"<img src='<?=base_url()?>assets/dashboard/assets/images/reading.png' alt='Photo'>"+
											"</div>"+
											"<div class='user-photo'>"+
												"<img src='<?=base_url()?>assets/dashboard/assets/images/reading.png' alt='Photo'>"+
											"</div>"+
											"<div class='user-photo'>"+
												"<img src='<?=base_url()?>assets/dashboard/assets/images/reading.png' alt='Photo'>"+
											"</div>"+
											"<div class='user-more'>9+</div>"+
										"</div>"+
										"<div class='col-xs-12 col-md-4 col-lg-3'>"+
											"<a href='<?=base_url()?>pertanyaan-detail-mahasiswa/"+data.permasalahan[i].id+"' class='btn btn-block btn-normal btn-plonk-green'> Bantu Jawab</a>"+
										"</div>"+
									"</div>"+
								"</div>"+
							"</div>"+
						"</div>";
				}
				timeAgo();
			}else{
				elementToRender += "<p class='text-center'><strong>Belum ditemukan pertanyaan</strong></p>"
			}
			$("#pertanyaanByKategori").html(elementToRender);
			timeAgo();
		});
	}

</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</div><!--/.row-->


	<div class="main-container">
		<?=$this->session->flashdata('login')?>
		
		<div class="content-filter-top">
			<div class="row">
				<div class="col-sm-7">
					<div class="big-filter">
						<div class="dropdown">
							<a href="#" data-toggle="dropdown">Semua Pertanyaan <i class="fa fa-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#">Pertanyaan yang A</a></li>
								<li><a href="#">Pertanyaan yang B</a></li>
							</ul>
						</div>
					</div>
					<p class="text-muted">Solusi tanpa batas dan mudah dalam diskusi yang menyenangkan</p>
				</div>
				<div class="col-sm-5">
					<div class="content-filter-search">
						<form action="#" class="input-55">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-search"></i></span>
								<input type="text" class="form-control" placeholder="Ketik lalu tekan enter untuk mencari materi">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="content-filter-cat scrollablex" data-mcs-axis="x">
			<div class="cfc-list">
				<div class="cfc-item" id="all" onclick="kategori(this.id)">
					<div class="panel panel-plain">
						<div class="panel-body">
							<div class="fa fa-list"></div>
							<h3>Semua</h3>
						</div>
					</div>
				</div>
				<?php
				foreach ($kategori as $key => $value) { ?>
				<div class="cfc-item" id="<?=$value->id?>" onclick="kategori(this.id)">
					<div class="panel panel-plain">
						<div class="panel-body">
							<div class="fa <?=$value->icon?>"></div>
							<h3><?=$value->nama?></h3>
						</div>
					</div>
				</div>
				<?php } ?>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="content-list" id="pertanyaanByKategori">
					<!-- KONTEN -->
				</div>
			</div>

			<div class="col-sm-4 col-md-3">
				<div class="rightbar">
					<div class="panel panel-plain">
						<div class="panel-body">
							<h3>Poin & Badge</h3>
							<div class="profile-achievement">
								<div class="profile-point"><span>P</span> 2003</div>
								<div class="achie achie-orange" title="Pencapaian"><i class="fa fa-star"></i></div>
								<div class="achie achie-green" title="Pencapaian"><i class="fa fa-trophy"></i></div>
								<div class="achie achie-blue" title="Pencapaian"><i class="far fa-gem"></i></div>
							</div>
						</div>
					</div>
					<div class="panel panel-plain panel-loker">
						<div class="panel-heading">
							Lowongan Pekerjaan
						</div>
						<div class="panel-body">
							<ul class="loker-list">
								<li><a href="#">
									<div class="title">Guru tingkat SD yang ulet, bisa photoshop nilai plus</div>
								</a>
								<div class="meta">
									<span class="instansi">SDN 4 Lowokwaru</span>
									<span class="lokasi"><i class="fa fa-map-marker-alt"></i> Malang Kota</span>
								</div>
							</li>
							<li><a href="#">
								<div class="title">Guru tingkat SD yang ulet, bisa photoshop nilai plus</div>
							</a>
							<div class="meta">
								<span class="instansi">SDN 4 Lowokwaru</span>
								<span class="lokasi"><i class="fa fa-map-marker-alt"></i> Malang Kota</span>
							</div>
						</li>
						<li><a href="#">
							<div class="title">Guru tingkat SD yang ulet, bisa photoshop nilai plus</div>
						</a>
						<div class="meta">
							<span class="instansi">SDN 4 Lowokwaru</span>
							<span class="lokasi"><i class="fa fa-map-marker-alt"></i> Malang Kota</span>
						</div>
					</li>
				</ul>
				<div class="list-more">
					<button class="btn btn-more btn-normal btn-plonk-blue">Muat Lebih <span class="hidden-md hidden-sm">Banyak</span></button>
				</div>
			</div>
		</div>

		<div class="panel panel-plain panel-materi">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-8">
						Materi Menarik
					</div>
					<div class="col-xs-4">
						<div class="dropdown">
							<a href="#" data-toggle="dropdown">Harian <i class="fa fa-chevron-down"></i></a>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="#">Kategori A</a></li>
								<li><a href="#">Kategori B</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<ul class="materi-list">
					<li>
						<div class="materi-ikon materi-blue hidden-sm"><i class="fa fa-flask"></i></div>
						<div class="materi-data">
							<a href="#">
								<div class="title">Cara mendapatkan empathy dari murid</div>
							</a>
							<div class="meta">
								<span class="author">Mr. Robert</span>
								<span class="downloaded"><i class="fa fa-cloud-download-alt"></i> 332</span>
							</div>
						</div>
					</li>
					<li>
						<div class="materi-ikon materi-red hidden-sm"><i class="fa fa-puzzle-piece"></i></div>
						<div class="materi-data">
							<a href="#">
								<div class="title">Tips menyelesaikan perkalian sulit</div>
							</a>
							<div class="meta">
								<span class="author">Antonio K.</span>
								<span class="downloaded"><i class="fa fa-cloud-download-alt"></i> 332</span>
							</div>
						</div>
					</li>
					<li>
						<div class="materi-ikon materi-green hidden-sm"><i class="fa fa-book"></i></div>
						<div class="materi-data">
							<a href="#">
								<div class="title">Reproduksi hewan ternak</div>
							</a>
							<div class="meta">
								<span class="author">Hasan Mahmud</span>
								<span class="downloaded"><i class="fa fa-cloud-download-alt"></i> 332</span>
							</div>
						</div>
					</li>
					<li>
						<div class="materi-ikon materi-black hidden-sm"><i class="fa fa-gem"></i></div>
						<div class="materi-data">
							<a href="#">
								<div class="title">Motivasi dalam belajar</div>
							</a>
							<div class="meta">
								<span class="author">Anton Bajuri</span>
								<span class="downloaded"><i class="fa fa-cloud-download-alt"></i> 332</span>
							</div>
						</div>
					</li>
				</ul>
				<div class="list-more">
					<button class="btn btn-more btn-normal btn-plonk-blue">Muat Lebih <span class="hidden-md hidden-sm">Banyak</span></button>
				</div>
			</div>
		</div>
	</div>
	<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
</div>


</div>

</div>






</div>	<!--/.main-->

