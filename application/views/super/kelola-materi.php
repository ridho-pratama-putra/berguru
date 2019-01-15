<script type="text/javascript">
	// Script untuk panel search diluar tabel
	$( document ).ready(function() {
		var table = $('#tabel-materi').DataTable(); 
		$('#cari-materi').on( 'keyup', function () {
			table.search( this.value ).draw();
		} );
	});
	// END Script untuk panel search diluar tabel

	// script untuk prevent submit sebuah file yang tidak termasuk di list extension
	var _validFileExtensions = [".pdf", ".docx", ".doc", ".xlsx", ".xls"];    
	function publishMateri(oForm) {
		var arrInputs = oForm.getElementsByTagName("input");
		for (var i = 0; i < arrInputs.length; i++) {
			var oInput = arrInputs[i];
			if (oInput.type == "file") {
				var sFileName = oInput.value;
				if (sFileName.length > 0) {
					var blnValid = false;
					for (var j = 0; j < _validFileExtensions.length; j++) {
						var sCurExtension = _validFileExtensions[j];
						if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
							blnValid = true;
							break;
						}
					}
					
					if (!blnValid) {
						alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
						return false;
					}
				}
			}
		}
	  
		return true;
	}	
</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Kelola Materi</li>
		</ol>
	</div><!--/.row-->
	<div class="main-container mr-1">
		<?=$this->session->flashdata("kelolaMateri");?>
	</div>
	<div class="panel panel-plain main-container">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-6">
					<h1>Kelola Materi</h1>
					<p>klik sesuai kolom untuk melakukan penyortiran</p>
				</div>
				<div class="col-sm-8 col-md-3">
					<form class="" action="index.html" method="post">
						<div class="form-group">
							<div class="input-group plain-group">
								<input type="text" name="" value="" placeholder="Cari Materi" class="form-control dt-search" id="cari-materi">
								<span class="input-group-addon"><i class="fa fa-search"></i></span>
								<!-- <span class="input-group-btn">
									<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
								</span> -->
							</div>
						</div>
					</form>
				</div>
				<div class="col-sm-4 col-md-3">
					<a href="#modal-addmateri" class="btn btn-success btn-normal btn-block" role="button" data-toggle="modal">Tambah Materi</a>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table datatable mid-v" id="tabel-materi">
					<thead>
						<tr>
							<th>Nama Materi</th>
							<th>Kategori</th>
							<th>Terakhir Diedit</th>
							<th><i class="fa fa-cloud-download"></i></th>
							<th class="no-sort"></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($materi as $key => $value) { ?>
						<tr>
								<td>
									<div class="materi-ikon materi-blue"><i class="fa fa-diamond"></i></div>
									<?=$value->nama_materi?>
								</td>
								<td><?=$value->nama_kategori?></td>
								<td><?=date('m/d/y',strtotime($value->waktu_terakhir_edit))?>
									<span class="td-meta">
										<i class="fa fa-circle"></i> <?=$value->nama_editor?>
									</span>
								</td>
								<td><?=$value->jumlah_diunduh?></td>
								<td class="td-right">
									<div class="dropdown td-menu">
									<a href="#" class="dropdown-toggle" type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
										<i class="fa fa-ellipsis-v"></i>
									</a>
									<ul class="dropdown-menu dropdown-menu-right" aria-labelledby="">
										<li><a href="#">Edit</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="#">Hapus</a></li>
									</ul>
								</div>
							</td>
						</tr>					
						<?php }
						?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>	<!--/.main-->

<!-- Modal -->
<div class="modal fade" id="modal-addmateri" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
		  <form class="input-55" action="<?=base_url()?>tambah-materi" method="POST" enctype="multipart/form-data" accept-charset="utf-8" id="form-tambah-baru" onsubmit="return publishMateri(this);">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Tambah Materi Baru</h4>
					<h5 class="modal-subtitle">Tambahkan materi baru</h5>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
								<label for="">Nama Materi</label>
								<input type="text" class="form-control" placeholder="Masukkan Nama Materi" name="nama" required="">
							</div>
						</div>
						<div class="col-md-7">
							<div class="form-group">
								<label for="thefile">Upload File Materi</label>
								<input type="file" id="thefile" class="input-file" data-multiple-caption="{count} files selected" name="files[]" multiple >
								<label for="thefile" class="input-label">
									<span class="placeholder">Pilih file...</span>
									<span class="tombol"><i class="fa fa-cloud-upload"></i> Upload file</span>
								</label>
							</div>
						</div>
						<div class="col-md-5">
							<div class="form-group">
								<label for="">Pilih Kategori</label>
								<select name="kategori" id="" class="form-control" required="">
									<option value="" disabled="" selected="">Pilih kategori</option>
									<?php foreach ($kategori as $key => $value) { ?>
										<option value="<?=$value->id?>"><?=$value->nama?></option>
									<?php } ?>
									
								</select>
							</div>
							<div class="form-group">
								<label for="">Tags</label>
								<input type="text" class="form-control" placeholder="Masukkan tag anda" name="tags" required="">
								<p class="help-block">contoh: sejarah,gratis,edukasi</p>
							</div>
						</div>
						<div class="col-md-7">
							<label for="">Deskripsi</label>
							<textarea name="deskripsi" id="" rows="6" class="form-control" placeholder="Deskripsi" required=""></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="pull-left btn btn-normal btn-plonk-red" data-dismiss="modal">Close</button>
					<button type="submit" class="pull-right btn btn-normal btn-success" >Publish Materi</button>
				</div>
			</form>
		</div>
	</div>
</div>
