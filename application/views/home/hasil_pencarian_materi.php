<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/assets/css/frontpage-custom.css">

<div class="content-front content-pages content-materi">
	<section class="post-content">
		<div class="container container-md">
			<div class="row ask-header">
				<div class="col-sm-6 col-md-6">
					<p class="ask-count" id="jumlahPertanyaanDitemukan"></p>
				</div>
				<div class="col-sm-6 col-md-6 materi-dropdown">
					<ul class="list-inline">
						<li>
							<select class="form-control dropdown-item pd-0" id="jangka-waktu" onchange="pertanyaan()">
								<option value="semua_waktu">Semua waktu</option>
								<option value="hari">Hari ini</option>
								<option value="bulan">Bulan ini</option>
								<option value="tahun">Tahun ini</option>
							</select>
						</li>
						<li>
							<select class="form-control dropdown-item pd-0" id="kategori-pencarian" onchange="pertanyaan()">
								<option value="semua_kategori" selected="">Semua Kategori</option>
								<?php foreach ($kategori as $key => $value) { ?>
									<option value="<?=$value->id?>" 
										<?php 
										if (isset($kategori_mapel)) {
											if ($kategori_mapel == $value->id) {
												echo "selected=''";
											}
										}
										?> >
										<?=$value->nama?>
									</option>
								<?php } ?>
							</select>
						</li>
					</ul>
				</div>
			</div>

			<div class="row ask-list">
				<div class="col-md-12">
					<div class="tab-content">

						<!-- pertanyaan pertanyaan yang ditemukan -->
						<div role="tabpanel" class="tab-pane active" id="pertanyaanDitemukan">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<script type="text/javascript">

	$( document ).ready(function() {
		pertanyaan()
		// untuk get pertanyaan berdsasrkan kategoir
	});
	function pertanyaan() {
		var keyword_yang_di_cari 		= $("#search_keyword").val()
		var kategori_solved_unsolved 	= $("#kategori-pertanyaan").val()
		var jangka_waktu				= $("#jangka-waktu").val()
		var kategori_mapel				= $("#kategori-pencarian").val()
		$.get(
			"<?=base_url()?>proses-cari-pertanyaan",
			{
				keyword 		: keyword_yang_di_cari,
				status 			: kategori_solved_unsolved,
				jangka_waktu 	: jangka_waktu,
				kategori_mapel 	: kategori_mapel
			},
			function( data ) {
				data = JSON.parse(data);
				console.log(data)
				$("#jumlahPertanyaanDitemukan").html(data.jumlah+" pertanyaan ditemukan");
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
							if (data.data_login.aktor !== 'pendidik' && data.data_login.aktor !== 'admin') {
								elementToRender +=
								"<div class='col-md-6 ask-action'>"+
								"<a  class='btn btn-green' disabled=''>Terselesaikan</a>"+
								"</div>"
							}
						}
						elementToRender +=
						"</div>"+
						"</div>"+
						"</div>";
					}

					$("#pertanyaanDitemukan").html(elementToRender);
					timeAgo();
				}else{
					$("#pertanyaanDitemukan").html("<p><h4 class='text-center'>Data belum ada</h4></p>");
				}
			});
	}

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
				$this.innerHTML = "<span class='bgicon icon-clock'></span> " + timer($this.getAttribute('title') || $this.getAttribute('datetime'));
			}
		}
		// update time every minute
		setTimeout(timeAgo, 60000);
	};

</script>