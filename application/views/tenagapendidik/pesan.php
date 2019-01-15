<script type="text/javascript">
	// funtion untuk set form pembukaan chat baru
	function openNewChat(id_komentator,id_permasalahan,id_komentar) {
		$('#new_chat_id_komentator').val(id_komentator);
		$('#formNewChat').submit();
	}

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
				<div class="col-sm-5 col-md-4 col-lg-3 panel-pleft">
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
					<div class="panel-body list-pesan scrollable" id="listPesan">
						<?php foreach ($to as $key => $value) { ?>
						<div class="pesan-item <?=($value->belum_dibaca == '0') ? 'pi-read' :''?>" onclick="openNewChat(<?=$value->id?>)">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url().$value->foto?>" class="img-circle" alt="Photo">
								</div>
								<div class="user-nama">
									<?=$value->alias?>
								</div>
								<div class="last-pesan">
									<?php
									if ($value->aktor == 'admin') {
										$subyek = explode("|", $value->teks);
										echo $subyek[0];
									}else{
										echo $value->teks;
									}
									?>
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
				<div class="col-sm-7 col-md-8 col-lg-9 panel-pright">
					<div class="panel-body detail-pesan-empty">
							<img src="<?=base_url()?>assets/dashboard/assets/images/empty-thing.png" alt="Image" class="img-circle">
							<div class="empty-msg">
								Tidak ada pesan yang dipilih
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