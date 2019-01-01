<script type="text/javascript">
	// Script untuk panel search diluar tabel
	$( document ).ready(function() {
		var table = $('#tabel-pengguna').DataTable(); 
		$('#cari-pengguna').on( 'keyup', function () {
		    table.search( this.value ).draw();
		} );
	});
	// END Script untuk panel search diluar tabel

	// script untuk hapus mahasiswa
	function hapus(id){
		$.post( "<?=base_url()?>delete-pengguna",{ id: id},function(){
			window.location.replace("<?=base_url()?>kelola-pengguna");
		}).fail(function() {
		    alert( "Data tidak dapat dihapus. Data sedang digunakan" );
		});
	}
	// end script untuk hapus mahasiswa

	// script untuk ubah status active/dibekukan mahasiswa
	function ubahStatus(status,id){
		$.post( "<?=base_url()?>ubah-status-pengguna",{status: status, id: id},function(){
			window.location.replace("<?=base_url()?>kelola-pengguna");
		}).fail(function() {
		    alert( "Data tidak dapat dihapus. Data sedang digunakan" );
		});
	}
	// end script untuk ubah status active/dibekukan mahasiswa

</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Kelola Pengguna</li>
		</ol>
	</div><!--/.row-->
	<div class="main-container mr-1">
		<?=$this->session->flashdata("kelolaPengguna");?>
	</div>
	<div class="panel panel-plain main-container">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-8">
					<h1>Kelola Pengguna</h1>
					<p>klik sesuai kolom untuk melakukan penyortiran</p>
				</div>
				<div class="col-md-4">
					<form class="" action="index.html" method="post">
						<div class="form-group">
							<div class="input-group plain-group">
								<input type="text" id="cari-pengguna" name="" value="" placeholder="Cari Pengguna" class="form-control dt-search">
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
				<table class="table datatable" id="tabel-pengguna">
					<thead>
						<tr>
							<th width="20%">Nama</th>
							<th width="20%">Email</th>
							<th>Universitas</th>
							<th>NIM</th>
							<th width="5">Report</th>
							<th width="5">Status</th>
							<th class="no-sort" width="5"></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($mahasiswa as $key => $value) { ?>

						<tr>
							<td><?=$value->nama?></td>
							<td><?=$value->email?></td>
							<td><?=$value->institusi_or_universitas?></td>
							<td><?=$value->nip_or_nim?></td>
							<td><span class="dot-status dot-red"></span><?=$value->report?></td>
							<td><span class="<?=($value->status == 'DIBEKUKAN') ? 'text-red' : 'text-blue'?> text-status"><?=$value->status?></span></td>
							<td class="td-right">
								<div class="dropdown td-menu">
									<a href="#" class="dropdown-toggle" type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
										<i class="fa fa-ellipsis-v"></i>
									</a>
									<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="">
										<li><a href="#" onclick="hapus(<?=$value->id?>)">Hapus</a></li>
										<?php
										if ($value->status == 'DIBEKUKAN') { ?>
											<li><a href="#" onclick="ubahStatus('ACTIVE',<?=$value->id?>)">Aktifkan Akun</a></li>
										<?php
										}else{ ?>
											<li><a href="#" onclick="ubahStatus('DIBEKUKAN',<?=$value->id?>)">Bekukan Akun</a></li>
										<?php }
										?>
										<!-- <li role="separator" class="divider"></li>
										<li><a href="#">Separated link</a></li> -->
									</ul>
								</div>
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






</div>	<!--/.main-->