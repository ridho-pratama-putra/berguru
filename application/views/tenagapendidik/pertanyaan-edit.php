<script type="text/javascript">
	$( document ).ready(function() {
		$("#kategori").val("<?=$pertanyaan[0]->kategori?>");
	});
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

		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="panel panel-plain">
					<div class="panel-nav">
						<a href="<?=base_url()?>pertanyaan-saya"><i class="fa fa-chevron-left"></i> Kembali</a>
					</div>
					<div class="panel-heading">
						<h1>Edit Pertanyaan</h1>
						<p>mengubah konten pertanyaan</p>
					</div>
					<div class="panel-body">
						<form action="<?=base_url()?>submit-edit-pertanyaan" class="input-55" method="POST">
							<input type="hidden" name="id" value="<?=$pertanyaan[0]->id?>">
							<div class="form-group">
								<label for="pertanyaan">Pertanyaan</label>
								<textarea name="pertanyaan" id="pertanyaan" rows="5" class="form-control" 
								placeholder="Contoh: Saya mengalami kesulitan dalam menyampaikan mata pelajaran biologi karena murid saya kurang antusias. Kira2 apa yg harus saya lakukan supaya motivasi murid saya ini meningkat? terimakasih" required=""><?=$pertanyaan[0]->teks?></textarea>
							</div>
							<div class="form-group row">
								<div class="col-sm-6 col-lg-4">
									<label for="kategori">Kategori</label>
									<select name="kategori" id="kategori" class="form-control" required="">
										<option value="" selected="" disabled="">Pilih Kategori</option>
										<?php
										foreach ($kategori as $key => $value) { ?>
											<option value="<?=$value->id?>"><?=$value->nama?></option>
										<?php }
										?>
									</select>
								</div>
								<div class="col-sm-6 col-lg-push-4 col-lg-4">
									<label for="">&nbsp;</label>
									<button class="btn btn-55 btn-success btn-block" type="submit">Publish <span class="hidden-sm">Pertanyaan</span></button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="col-sm-4 col-md-3">
				<a href="#"><img src="<?=base_url()?>assets/dashboard/assets/images/iklan.png" alt="Image" class="img-responsive iklan-sidebar"></a>
			</div>


		</div>

	</div>
</div>	<!--/.main-->