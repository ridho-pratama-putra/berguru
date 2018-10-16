<script type="text/javascript">
	// Script untuk panel search diluar tabel
	$( document ).ready(function() {
		var table = $('#tabel-permasalahan').DataTable(); 
		$('#cari-permasalahan').on( 'keyup', function () {
		    table.search( this.value ).draw();
		} );
	});
	// END Script untuk panel search diluar tabel

	// script untuk hapus permasalahan
	function hapus(id){
		$.post( "<?=base_url()?>delete-permasalahan",{ id: id},function(){
			window.location.replace("<?=base_url()?>kelola-konten-permasalahan");
		});
	}
	// end script untuk hapus permasalahan

	// script untuk ubah status permasalahan
	function ubahStatus(status,id){
		$.post( "<?=base_url()?>ubah-status-permasalahan",{status: status, id: id},function(){
			window.location.replace("<?=base_url()?>kelola-konten-permasalahan");
		});
	}
	// end script untuk ubah status permasalahan

</script>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Kelola Konten Permasalahan</li>
		</ol>
	</div><!--/.row-->
	<div class="main-container mr-1">
		<?=$this->session->flashdata("kelolaKontenPermasalahan");?>
	</div>
	<div class="panel panel-plain main-container">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-8">
					<h1>Kelola Konten Permasalahan</h1>
					<p>klik sesuai kolom untuk melakukan penyortiran</p>
				</div>
				<div class="col-md-4">
					<form class="" action="index.html" method="post">
						<div class="form-group">
							<div class="input-group plain-group">
								<input type="text" id="cari-permasalahan" name="" value="" placeholder="Cari Permasalahan" class="form-control dt-search">
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
				<table class="table datatable" id="tabel-permasalahan">
					<thead>
						<tr>
							<th>Permasalahan</th>
							<th width="90">Kategori</th>
							<th width="90">Status</th>
							<th width="150" class="no-sort"></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($permasalahan as $key => $value) {?>
						<tr>
							<td>
								<?=$value->teks?>
								<div class="td-meta">
									<i class="fa fa-clock-o"> </i> <?=date('M, d Y',strtotime($value->tanggal))?>
									<i class="fa fa-circle"></i>
									<i class="fa fa-user"></i> <?=$value->nama?>
								</div>
							</td>
							<td>
								<?=$value->kategori?>
							</td>
							<td>
								<span class="btn btn-custom <?=($value->status == 'SOLVED') ? 'btn-status-green' : 'btn-status-red'?> "><i class="fa <?=($value->status == 'ACTIVE') ? 'fa-check-circle' : 'fa-times-circle'?> "></i><?=$value->status?></span>
							</td>
							<td>
								<span class="btn btn-custom btn-plonk-blue">Edit</span>
								<span class="btn btn-custom btn-plonk-red" onclick="hapus(<?=$value->id?>)">Hapus</span>
							</td>
						</tr>

						<?php }  ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>






</div>	<!--/.main-->