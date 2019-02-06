<script type="text/javascript">
	$( document ).ready(function() {
		var table = $('#tabel-lowongan').DataTable(); 
		$('#cari-lowongan').on( 'keyup', function () {
			table.search( this.value ).draw();
		} );
	});

	/*
	* function untuk validasi lowongan
	* param1 id
	* param2 state origin
	*/
	function valid(argument) {
		$.post("<?=base_url()?>submit-validasi-lowongan",{id : argument},function (html) {			
			$("#notif").html(html);
		});
	}
</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Lowongan Kerja</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container mr-0" id="notif">
		<?=$this->session->flashdata("alert");?>
	</div>

	<div class="panel panel-plain main-container">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-6">
					<h1>Lowongan Kerja</h1>
					<p>klik sesuai kolom untuk melakukan penyortiran</p>
				</div>
				<div class="col-sm-8 col-md-3">
					<form class="" action="index.html" method="post">
						<div class="form-group">
							<div class="input-group plain-group">
								<input type="text" name="" value="" placeholder="Cari Pekerjaan" class="form-control dt-search" id="cari-lowongan">
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
								</span>
							</div>
						</div>
					</form>
				</div>
				<div class="col-sm-4 col-md-3">
					<a href="#modal-addlowongan" class="btn btn-success btn-normal btn-block" role="button" data-toggle="modal">Tambah Lowongan</a>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table datatable" id="tabel-lowongan">
					<thead>
						<tr>
							<th>Nama Lowongan</th>
							<th>Instansi</th>
							<th>Lokasi</th>
							<th>Kontak</i></th>
							<th>Valid</th>
						</tr>
					</thead>
					<tbody>
						<?php foreach ($lowongan as $key => $value) { ?>
							<tr>
								<td>
									<?=$value->nama?>
								</td>
								<td><?=$value->instansi?></td>
								<td><?=$value->lokasi?></td>
								<td><?=$value->kontak?></td>
								<td data-order="valid">
									<div class="saklar">
										<input type="checkbox" class="saklar-switch" id="valid<?=$value->id?>" <?=($value->valid == 0 ? '' : 'checked')?>  onclick="valid(<?=$value->id?>)">
										<label for="valid<?=$value->id?>"></label>
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
<!-- Modal -->
<div class="modal fade" id="modal-addlowongan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<form class="input-55" action="<?=base_url()?>submit-insert-lowongan" method="POST">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Tambah Lowongan Baru</h4>
					<h5 class="modal-subtitle">Tambahkan lowongan pekerjaan baru</h5>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="">Nama Lowongan</label>
								<input type="text" class="form-control" placeholder="Contoh: Guru SD ulet, bisa ms. Word nilai plus" name="teks">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="">Instansi / Perusahaan</label>
								<input type="text" class="form-control" placeholder="Nama Instansi" name="instansi">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="">Lokasi Lowongan</label>
								<input type="text" class="form-control" placeholder="Lokasi" name="lokasi">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="">Kontak Person</label>
								<input type="text" class="form-control" placeholder="No. Telepon / HP" name="kontak">
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="pull-left btn btn-normal btn-plonk-red" data-dismiss="modal">Close</button>
					<button type="submit" name="insertLowongan" class="pull-right btn btn-normal btn-success">Publish Lowongan</button>
				</div>
			</form>
		</div>
	</div>
</div>