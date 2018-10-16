<script type="text/javascript">
	// Script untuk panel search diluar tabel
	$( document ).ready(function() {
		var table = $('#tabel-tenaga-pendidik').DataTable(); 
		$('#cari-tenaga-pendidik').on( 'keyup', function () {
		    table.search( this.value ).draw();
		} );
	});
	// END Script untuk panel search diluar tabel

	// script untuk hapus mahasiswa
	function hapus(id){
		$.post( "<?=base_url()?>delete-tenaga-pendidik",{ id: id},function(){
			window.location.replace("<?=base_url()?>kelola-tenaga-pendidik");
		});
	}
	// end script untuk hapus mahasiswa

	// script untuk hapus mahasiswa
	function ubahStatus(status,id){
		$.post( "<?=base_url()?>ubah-status-tenaga-pendidik",{status: status, id: id},function(){
			window.location.replace("<?=base_url()?>kelola-tenaga-pendidik");
		});
	}
	// end script untuk hapus mahasiswa

</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Kelola Tenaga Pendidik</li>
		</ol>
	</div><!--/.row-->
	<div class="main-container mr-3">
		<?=$this->session->flashdata("kelolaTenagaPendidik");?>
	</div>
	<div class="panel panel-plain main-container">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-8">
					<h1>Kelola Tenaga Pendidik</h1>
					<p>klik sesuai kolom untuk melakukan penyortiran</p>
				</div>
				<div class="col-md-4">
					<form class="" action="index.html" method="post">
						<div class="form-group">
							<div class="input-group plain-group">
								<input type="text" id="cari-tenaga-pendidik" name="" value="" placeholder="Cari Pendidik" class="form-control dt-search">
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
				<table class="table datatable" id="tabel-tenaga-pendidik">
					<thead>
						<tr>
							<th>Nama</th>
							<th>Email</th>
							<th>Institusi</th>
							<th>NIP</th>
							<th>Report</th>
							<th>Status</th>
							<th class="no-sort"></th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($tenagapendidik as $key => $value) { ?>
						<tr>
							<td><?=$value->nama?></td>
							<td><?=$value->email?></td>
							<td><?=$value->institusi_or_universitas?></td>
							<td><?=$value->nip_or_nim?></td>
							<td><span class="dot-status dot-red"></span><?=$value->report?></td>
							<td><span class="<?=($value->status == 'DIBEKUKAN') ? 'text-red' : 'text-blue' ?> text-status"><?=$value->status?></span></td>
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
										<!-- <li><a href="#">Something else here</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Separated link</a></li> -->
									</ul>
								</div>
							</td>
						</tr>
						<?php							
						} ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>






</div>	<!--/.main-->