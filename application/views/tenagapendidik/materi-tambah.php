<link href="<?=base_url()?>assets/dashboard/assets/css/icon-picker.min.css" rel="stylesheet">
<script src="<?=base_url()?>assets/dashboard/assets/js/iconPicker.min.js"></script>
<script type="text/javascript">
	$(function () {
		$(".icon-picker").iconPicker();
	});
	

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
			<li class="active">Materi</li>
		</ol>
	</div><!--/.row-->

	
	<div class="main-container">
		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="panel panel-plain">
					<div class="panel-nav">
						<a href="<?=base_url('materi-pendidik')?>" class="panel-link"><i class="fa fa-chevron-left"></i> Kembali</a>
					</div>
					<div class="panel-heading">
						<h1>Tambah Materi Baru</h1>
						<p>membuat materi baru</p>
					</div>
					<div class="panel-body">
						<form class="input-55" action="<?=base_url()?>submit-tambah-materi-pendidik" method="POST" enctype="multipart/form-data" accept-charset="utf-8" id="form-tambah-baru" onsubmit="return publishMateri(this);">
							<div class="row">
								<div class="col-md-5">
									<div class="form-group">
										<label for="">Nama Materi</label>
										<input type="text" class="form-control" name="nama" placeholder="Masukkan Nama Materi">
									</div>
								</div>
								<div class="col-md-7">
									<div class="form-group">
										<label for="thefile">Upload File Materi</label>
										<input type="file" id="thefile" class="input-file" data-multiple-caption="{count} files selected" name="files[]" multiple>
										<label for="thefile" class="input-label">
											<span class="placeholder">Pilih file...</span>
											<span class="tombol"><i class="fa fa-cloud-upload-alt"></i> Upload file</span>
										</label>
										<p class="help-block">file maks 2mb</p>
									</div>
								</div>
								<div class="col-md-5">
									<div class="form-group">
										<label for="">Pilih Kategori</label>
										<select name="kategori" id="" class="form-control">
											<option value="" selected="" disabled="">Pilih kategori</option>
											<?php foreach ($kategori as $key => $value) { ?>
												<option value="<?=$value->id?>"><?=$value->nama?></option>
											<?php } ?>
										</select>
									</div>
									<div class="form-group">
										<label for="">Pilih Icon</label>
										<input type="text" placeholder="Pilih Icon..." name="icon" class="form-control icon-picker"/>                         
									</div>
									<div class="form-group">
										<label for="">Tags</label>
										<input type="text" class="form-control" name="tags" placeholder="Masukkan tag anda">
										<p class="help-block">contoh: sejarah,gratis,edukasi</p>
									</div>
								</div>
								<div class="col-md-7">
									<label for="">Deskripsi</label>
									<textarea name="deskripsi" id="" rows="6" class="form-control" placeholder="Deskripsi"></textarea>
								</div>
							</div>
							<div class="form-separator"></div>
							<div class="row">
								<div class="col-sm-6 col-sm-push-6 col-lg-push-7 col-lg-5">
									<label for="">&nbsp;</label>
									<button class="btn btn-55 btn-success btn-block" type="submit">Publish <span class="hidden-sm">Materi</span></button>
								</div>

							</div>

						</form>
					</div>
				</div>
			</div>
			<div class="col-sm-4 col-md-3">
				<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-fw"></a>
			</div>
		</div>
	</div>
</div>	<!--/.main-->