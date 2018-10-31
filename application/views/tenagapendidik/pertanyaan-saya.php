<script type="text/javascript">
	// Script untuk panel search diluar tabel
	$( document ).ready(function() {
		var table = $('#tabel-pertanyaan-saya').DataTable(); 
		$('#cari-pertanyaan-saya').on( 'keyup', function () {
		    table.search( this.value ).draw();
		} );
	});
	
	// script untuk hapus pertanyaan
	function hapus(id){
		$.post( "<?=base_url()?>delete-pertanyaan",{ id: id },function(data){
			window.location.replace("<?=base_url()?>pertanyaan-saya");
		}).fail(function() {
		    alert( "Data tidak dapat dihapus. Data sedang digunakan" );
		});
	}
	// end script untuk hapus pertanyaan
</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Pertanyaan Saya</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container">
		<?=$this->session->flashdata("pertanyaan")?>
		<div class="panel panel-plain">
			<div class="panel-heading">
				<div class="row">
					<div class="col-md-6">
						<h1>Pertanyaan Saya</h1>
						<p>klik sesuai kolom untuk melakukan penyortiran</p>
					</div>
					<div class="col-sm-8 col-md-3">
						<form class="" action="index.html" method="post">
							<div class="form-group">
								<div class="input-group plain-group">
									<input type="text" name="" value="" placeholder="Cari Pertanyaan" class="form-control dt-search" id="cari-pertanyaan-saya">
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
									</span>
								</div>
							</div>
						</form>
					</div>
					<div class="col-sm-4 col-md-3">
						<a href="<?=base_url()?>buat-pertanyaan-pendidik" class="btn btn-success btn-normal btn-block">Buat Pertanyaan</a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table datatable table-hover" id="tabel-pertanyaan-saya">
						<thead>
							<tr>
								<th>Permasalahan</th>
								<th width="90">Kategori</th>
								<th width="90">Status</th>
								<th width="150" class="no-sort"></th>
							</tr>
						</thead>
						<tbody>
							<?php
							foreach ($pertanyaan as $key => $value) {?>
							<tr>
								<td>
									<?=$value->teks?> <a href="<?=base_url().'detail-pertanyaan-pendidik/'.$value->id?>">Klik untuk lebih detil</a>
									<div class="td-meta">
										<i class="far fa-clock"></i> <?=date('M, d Y',strtotime($value->tanggal))?>
										<i class="fa fa-circle"></i>
										<i class="far fa-comment"></i> <?=$value->jumlah_komen?>
										<i class="fa fa-circle"></i>
										<i class="far fa-eye"></i> <?=$value->jumlah_dilihat?>
									</div>
								</td>
								<td>
									<?=$value->kategori?>
								</td>
								<td>
									<span class="btn btn-custom <?=($value->status == 'SOLVED') ? 'btn-status-green' : 'btn-status-red'?> "><i class="fa <?=($value->status == 'SOLVED') ? 'fa-check-circle' : 'fa-times-circle'?>"></i><?=$value->status?></span>
								</td>
								<td>
									<a href="<?=base_url()?>edit-pertanyaan-pendidik/<?=$value->id?>"><span class="btn btn-custom btn-plonk-blue">Edit</span></a>
									<span class="btn btn-custom btn-plonk-red" onclick="hapus(<?=$value->id?>)">Hapus</span>
								</td>
							</tr>
								
							<?php
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>

