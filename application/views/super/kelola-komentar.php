<script type="text/javascript">
	// Script untuk panel search diluar tabel
	$( document ).ready(function() {
		var table = $('#tabel-komentar').DataTable(); 
		$('#cari-komentar').on( 'keyup', function () {
		    table.search( this.value ).draw();
		} );
	});
	// END Script untuk panel search diluar tabel
</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Kelola Komentar</li>
		</ol>
	</div><!--/.row-->

	<div class="panel panel-plain main-container">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-8">
					<h1>Kelola Komentar</h1>
					<p>klik sesuai kolom untuk melakukan penyortiran</p>
				</div>
				<div class="col-md-4">
					<form class="" action="index.html" method="post">
						<div class="form-group">
							<div class="input-group plain-group">
								<input type="text" id="cari-komentar" name="" value="" placeholder="Cari Komentar" class="form-control dt-search">
								<span class="input-group-addon"><i class="fa fa-search"></i></span>
								<!-- <span class="input-group-btn">
									<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
								</span> -->
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table datatable" id="tabel-komentar">
					<thead>
						<tr>
							<th width="250" class="no-sort">Komentar</th>
							<th class="no-sort">Permasalahan</th>
							<th width="40"><i class="fa fa-comment"></i></th>
							<th width="40"><i class="fa fa-eye"></i></th>
							<th class="no-sort"></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($kelola_komentar as $key => $value) { ?>
						<tr>
							<td>
								<?=$value->teks_komentar?>
								<?php if ($value->tanggal_komentar !== NULL) { ?>
									<div class="td-meta">
										<i class="fa fa-clock-o"></i><?=date('M, d Y',strtotime($value->tanggal_komentar))?>
										<i class="fa fa-circle"></i>
										<i class="fa fa-user"></i> <?=$value->siapa_komentar?>
									</div>
								<?php
								}else{ ?>
									<div class="td-meta">
										Belum ada Komentar
									</div>
								<?php
								} ?>
							</td>
							<td>
								<?=$value->teks_permasalahan?>
								<div class="td-meta">
									<i class="fa fa-clock-o"></i> <?=date('M, d Y',strtotime($value->tanggal_permasalahan))?>
									<i class="fa fa-circle"></i>
									<i class="fa fa-user"></i> <?=$value->siapa_permasalahan?>
								</div>
							</td>
							<td>
								<?=$value->jumlah_komen ?>
							</td>
							<td>
								<?=$value->jumlah_dilihat ?>
							</td>
							<td class="td-right">
								<div class="dropdown td-menu">
									<a href="#" class="dropdown-toggle" type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
										<i class="fa fa-ellipsis-v"></i>
									</a>
									<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="">
										<li><a href="#">Detail Diskusi</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Bekukan Diskusi</a></li>
									</ul>
								</div>
							</td>
						</tr>
						<?php } ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>






</div>	<!--/.main-->