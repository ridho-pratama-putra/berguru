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
	<div class="main-container mr-1">
		<?=$this->session->flashdata("alert");?>
	</div>
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
									<?=limit_text($value->teks_komentar,25) ?>
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
											<li><a href="#js-detail-komentar" data-toggle="modal" data-target="#js-detail-komentar" data-id="<?=$value->id_permasalahan?>" >Detail Diskusi</a></li>
											<li role="separator" class="divider"></li>
											<li>
												<?php
												if ($value->beku == 'ACTIVE') { ?>
													<a href="<?=base_url().'Admin/setPermasalahanToBeku/'.$value->id_permasalahan?>">Bekukan Diskusi</a>
												<?php }else{ ?>
													<a href="<?=base_url().'Admin/setPermasalahanToAktiv/'.$value->id_permasalahan?>">Aktivkan Diskusi</a>
													<?php
												}
												?>
											</li>
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


<!-- Modal Detail -->
<div class="modal fade modal-grey" id="js-detail-komentar" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Detail Diskusi</h4>
			</div>
			<div class="modal-body">
				<div class="content-modal-komentar scrollBox" id="ex">
					<div class="panel panel-plain">
						<div class="panel-body">
							<div class="detper-pertanyaan">
							</div>
							<div class="detper-meta">
								<div class="row">
									<div class="col-md-8">
										<div class="td-meta">
											<i class="far fa-clock"></i> <span id="tanggal"></span>
											<i class="fa fa-circle"></i>
											<i class="fa fa-comment"></i> <span class="jumlah-komentar"></span>
											<i class="fa fa-circle"></i>
											<i class="fa fa-eye"></i> <span id="jumlah-dilihat"></span>
										</div>
									</div>
									<div class="col-md-4 text-right" id="status-pertanyaan">
										
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-plain">
						<div class="panel-body">
							<div class="detper-jawaban-heading">
								<div class="row">
									<div class="col-sm-6">
										<i class="fa fa-unlock"></i> <span class="jumlah-komentar"></span> Jawaban
									</div>
									<div class="col-sm-6">
										<span class="text-muted">Penjawab</span>
										<div id="foto-komentator">
											
										</div>
									</div>
								</div>
							</div>
							<div id="list-jawaban">
								<!-- diisi oleh ajax request -->
							</div>
							

						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="pull-left btn btn-normal btn-plonk-red" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$('#js-detail-komentar').on('show.bs.modal', function (event) {
		$('#list-jawaban').html()
		var button = $(event.relatedTarget)
		var id_permasalahan = button.data('id')

		$.get(
			"<?=base_url()?>detail-diskusi/"+id_permasalahan,
			function (res) {
				res = JSON.parse(res)
				var modal = $(this)
				$('.detper-pertanyaan').html(res.pertanyaan[0].teks)
				$('#tanggal').html(res.pertanyaan[0].tanggal)
				$('.jumlah-komentar').html(res.pertanyaan[0].jumlah_komen)
				$('#jumlah-dilihat').html(res.pertanyaan[0].jumlah_dilihat)
				if (res.pertanyaan[0].status == 'UNSOLVED') {
					$('#status-pertanyaan').html("<span class='btn btn-custom btn-status-red'><i class='fa fa-times-circle'></i> unsolved</span>")
				}else{
					$('#status-pertanyaan').html("<span class='btn btn-custom btn-status-green'><i class='fa fa-check'></i> solved</span>")
				}

				var elementToRender = ''
				for (var i = 0 ; i < res.penjawab.length; i++) {
					elementToRender += 
					"<div class='user-photo'>"+
					"<img src='<?=base_url()?>"+res.penjawab[i].foto+"' class='img-circle' alt='Photo' title='"+res.penjawab[i].nama+"'>"+
					"</div>"
				}
				if (res.remaining_penjawab !== 0) {
					$('#foto-komentator').html(elementToRender+' '+res.remaining_penjawab+'+')
				}else{
					$('#foto-komentator').html("0")
				}
				
				elementToRender = ''
				for (var i = 0; i < res.jawaban.length; i++) {
					elementToRender += 
					"<div class='detper-jawaban-list'>"+
					"<div class='detper-jawaban-item'>"+
					"<div class='detper-jawaban'>"+
					res.jawaban[i].teks+
					"</div>"+
					"<div class='detper-jawaban-footer'>"+
					"<div class='row'>"+
					"<div class='col-sm-6 col-md-8 col-lg-4'>"+
					"<div class='user-photo'>"+
					"<img src='<?=base_url()?>"+res.jawaban[i].foto+"' class='img-circle' alt='Photo'>"+
					"</div>"+
					"<div class='user-nama'>"+
					res.jawaban[i].siapa+
					"</div>"+
					"</div>"+
					"<div class='col-sm-6 col-md-4 col-lg-8 text-right'>"+
					"<span class='text-muted'>Review Jawaban</span>"+
					"<div class='rate-result' data-score='"+res.jawaban[i].rating+"'>"+
					"</div>"+
					"</div>"+
					"</div>"+
					"</div>"+
					"</div>"+
					"</div>"+
					"<hr>"
				}
				$('#list-jawaban').html(elementToRender)

				$('.rate-result').raty({
					starOff : '<?=base_url()?>assets/dashboard/assets/libs/raty/images/star-off.png',
					starOn  : '<?=base_url()?>assets/dashboard/assets/libs/raty/images/star-on.png',
					readOnly: true,
					number: function() {
						return $(this).attr('data-score');
					}
				});
			}
			);
	})
</script>