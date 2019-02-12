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
			<li class="active">Materi</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container mr-1">
		<?=$this->session->flashdata("alert");?>
	</div>
	
	<div class="main-container">
		<div class="content-filter-top">
			<div class="big-filter">
				<div class="dropdown">
					<a href="#" data-toggle="dropdown"><span id="selected-dropdown-popular-all"> </span>  <i class="bgicon icon-arrow-down"></i></a>
					<ul class="dropdown-menu" id="dropdown-popular-all">
						<li><a href="#" class="per-populer" onclick="popularAll('populer')" id="dropdown-populer" data-property="populer">Populer</a></li>
						<li><a href="#" class="per-populer" onclick="popularAll('all')" id="dropdown-semua-materi" data-property="all">Semua Materi</a></li>
					</ul>
				</div>
			</div>
			<p class="text-muted">Solusi tanpa batas dan mudah dalam diskusi yang menyenangkan</p>
		</div>

		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="content-filter-search">
					<div class="row">
						<div class="col-sm-12 col-lg-8">
							<form>
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-search"></i></span>
									<input type="text" class="form-control search" placeholder="Ketik lalu tekan enter untuk mencari materi" id="search-bar-materi">
								</div>
							</form>
						</div>
						<div class="col-sm-3 col-md-push-6 col-lg-push-0 col-lg-1 atau">Atau</div>
						<div class="col-sm-9 col-md-4 col-md-push-5 col-lg-push-0 col-lg-3">
							<a href="<?=base_url()?>materi-tambah-pendidik" class="btn btn-55 btn-success btn-block">Tambah Materi</a>
						</div>
					</div>
				</div>
				<div class="content-filter-bottom">
					<div class="row">
						<div class="col-xs-5">
							<h4>Daftar Materi</h4>
						</div>
						<div class="col-xs-7 text-right">
							<div class="dropdown">
								<a href="#" data-toggle="dropdown"><span id="selected-drowpdown-harian-bulanan"> </span> <i class="fa fa-chevron-down"></i></a>
								<ul class="dropdown-menu dropdown-menu-right" id="dropdown-harian-bulanan">
									<li><a href="#" class="per-jangka" onclick="harianBulanan('all')" id="dropdown-all" data-property="all">Semua waktu</a></li>
									<li><a href="#" class="per-jangka" onclick="harianBulanan('harian')" id="dropdown-harian" data-property="harian">Harian</a></li>
									<li><a href="#" class="per-jangka" onclick="harianBulanan('mingguan')" id="dropdown-mingguan" data-property="mingguan">Mingguan</a></li>
									<li><a href="#" class="per-jangka" onclick="harianBulanan('bulanan')" id="dropdown-bulanan" data-property="bulanan">Bulanan</a></li>
									<li><a href="#" class="per-jangka" onclick="harianBulanan('tahunan')" id="dropdown-tahunan" data-property="tahunan">Tahunan</a></li>
								</ul>
							</div>
							<div class="dropdown">
								<a href="#" data-toggle="dropdown"><span id="selected-drowpdown-kategori"> </span> <i class="fa fa-chevron-down"></i></a>
								<ul class="dropdown-menu dropdown-menu-right" id="drowpdown-kategori">
									<li><a href="#" class="per-kategori" onclick="kategori('all')" id="dropdown-0" data-property="0">Semua Kategori</a></li>
									<?php
									foreach ($kategori as $key => $value) { ?>
										<li><a href="#" class="per-kategori" onclick="kategori('<?=$value->id?>')" id="dropdown-<?=$value->id?>" data-property="<?=$value->id?>"><?=$value->nama?></a></li>
									<?php }
									?>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="content-list list" id="materiByKategori">
				</div>
			</div>
			<div class="col-sm-4 col-md-3">
				<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	$( document ).ready(function() {
		$("#search-bar-materi").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$(".content-item").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
		popularAll('all')
		harianBulanan('all')
		kategori('all')
		getDataMateri()
		// alert('docred')
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

	function popularAll(argument) {
		var before = $("#selected-dropdown-popular-all").html()
		if (before == 'Semua Materi') {
			$("#dropdown-semua-materi").removeClass("none")
		}else if (before == 'Populer') {
			$("#dropdown-populer").removeClass("none")
		}
		
		$(".per-populer").removeClass('none')
		$(".per-populer").removeClass('selected')

		if (argument == 'all') {
			$("#selected-dropdown-popular-all").html("Semua Materi");
			$("#dropdown-semua-materi").addClass("none")
			$("#dropdown-semua-materi").addClass("selected")
		}else if (argument == 'populer') {
			$("#selected-dropdown-popular-all").html("Populer");
			$("#dropdown-populer").addClass("none")
			$("#dropdown-populer").addClass("selected")
		}
		if (before !== " ") {
			
			getDataMateri()
		}
	}

	function harianBulanan (argument) {
		var before = $("#selected-drowpdown-harian-bulanan").html()
		if (before == 'Harian') {
			$("#dropdown-harian").removeClass("none")
			$("#dropdown-harian").removeClass("selected")
		}else if (before == 'Bulanan') {
			$("#dropdown-bulanan").removeClass("none")
			$("#dropdown-bulanan").removeClass("selected")
		}else if (before == 'Mingguan') {
			$("#dropdown-mingguan").removeClass("none")
			$("#dropdown-mingguan").removeClass("selected")
		}else if (before == 'Tahunan') {
			$("#dropdown-tahunan").removeClass("none")
			$("#dropdown-tahunan").removeClass("selected")
		}else if (before == 'Semua waktu') {
			$("#dropdown-all").removeClass("none")
			$("#dropdown-all").removeClass("selected")
		}

		$(".per-jangka").removeClass('none')
		$(".per-jangka").removeClass('selected')
		
		if (argument == 'harian') {
			$("#selected-drowpdown-harian-bulanan").html("Harian");
			$("#dropdown-harian").addClass("none")
			$("#dropdown-harian").addClass("selected")
		}else if (argument == 'bulanan') {
			$("#selected-drowpdown-harian-bulanan").html("Bulanan");
			$("#dropdown-bulanan").addClass("none")
			$("#dropdown-bulanan").addClass("selected")
		}else if (argument == 'mingguan') {
			$("#selected-drowpdown-harian-bulanan").html("Mingguan");
			$("#dropdown-mingguan").addClass("none")
			$("#dropdown-mingguan").addClass("selected")
		}else if (argument == 'tahunan') {
			$("#selected-drowpdown-harian-bulanan").html("Tahunan");
			$("#dropdown-tahunan").addClass("none")
			$("#dropdown-tahunan").addClass("selected")
		}else if (argument == 'all') {
			$("#selected-drowpdown-harian-bulanan").html("Semua waktu");
			$("#dropdown-all").addClass("none")
			$("#dropdown-all").addClass("selected")
		}
		if (before !== " ") {
			
			getDataMateri()
		}
	}
	
	function kategori (argument) {
		// alert('kateg')
		var before = $("#selected-drowpdown-kategori").html()
		
		$(".per-kategori").removeClass('none')
		$(".per-kategori").removeClass('selected')
		
		if (argument == 'all') {
			$("#selected-drowpdown-kategori").empty()
			$("#selected-drowpdown-kategori").html("Semua Kategori");
			
			$("#dropdown-0").addClass('none')
			$("#dropdown-0").addClass('selected')
		}else {
			$("#selected-drowpdown-kategori").empty()
			$("#selected-drowpdown-kategori").html( $("#dropdown-"+argument+"").html() );

			// add kelas untuk anak nya yang diselect dibedakan berdasar id
			$("#dropdown-"+argument).addClass('none')
			$("#dropdown-"+argument).addClass('selected')
		}

		if (before !== " ") {
			
			getDataMateri()
		}
	}

	function getDataMateri() {
		const monthNames = [
		"Jan", "Feb", "Mar", "Apr", "May", "Jun",
		"Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
		];

		
		$.get(
			"<?=base_url()?>get-materi-by-kategori-pendidik",
			{
				kategori_materi	: $(".per-kategori.selected").data('property'),
				harian_bulanan : $(".per-jangka.selected").data('property'),
				popular_all : $(".per-populer.selected").data('property')
			},
			function(data){
				data = JSON.parse(data)
				var elementToRender = '';
				if (data.materi.length > 0 ) {
					for( var i in data.materi){
						const d = new Date(data.materi[i].waktu_terakhir_edit);
						elementToRender += 
						'<div class="panel panel-plain content-item">'+
						'<div class="panel-body">'+
						'<div class="row">'+
						'<div class="col-xs-3 col-sm-2 col-md-2 col-lg-1">'+
						'<div class="materi-ikon materi-'+data.materi[i].ikon_warna+'"><span class="bgicon '+data.materi[i].ikon_logo+'"></span></div>'+
						'</div>'+
						'<div class="col-xs-9 col-sm-10 col-md-7">'+
						'<h3 class="ci-title nama">'+data.materi[i].nama+'</h3>'+
						'<div class="td-meta">'+
						'<i class="far fa-clock"></i> '+monthNames[d.getMonth()]+', '+d.getDate()+' '+d.getFullYear()+
						'<i class="fa fa-circle"></i> '+
						'<i class="fa fa-cloud-download-alt"></i> '+data.materi[i].jumlah_diunduh+
						'</div>'+
						'<div class="btn btn-custom btn-status-blue">'+data.materi[i].kategori+'</div>'+
						'</div>'+
						'<div class="col-xs-12 col-md-3 col-lg-4 ci-right"> '+
						'<a href="<?=base_url('download-materi-pendidik/')."'+data.materi[i].id+'"?>" class="btn btn-normal btn-plonk-red"><i class="fa fa-cloud-download-alt"></i> Unduh</a>'+
						'<div class="content-tag">'+
						'<span class="text-muted">Tags</span>'
						var tags = data.materi[i].tags.split(',')
						for(var j in tags){
							elementToRender += '<a href="#" class="link-disabled">#'+tags[j]+'</a>'
						}
						elementToRender +=
						'</div>'+
						'</div>'+
						'</div>'+
						'</div>'+
						'</div>'
					}
				}else{
					elementToRender += 
					'<div class="panel panel-plain content-item">'+
					'<div class="panel-body">'+
					'<div class="row">'+
					'<div class="col">'+
					'<h3 class="ci-title text-center">Data materi masih kosong</h3>'+
					'</div>'+
					'</div>'+
					'</div>'+
					'</div>';
				}
			// console.log(JSON.stringify(data.materi))

			$("#materiByKategori").empty()
			$("#materiByKategori").html(elementToRender);
			timeAgo();
			$(".link-disabled").click(function(e) {
				e.preventDefault();
			});

		});
	}
</script>