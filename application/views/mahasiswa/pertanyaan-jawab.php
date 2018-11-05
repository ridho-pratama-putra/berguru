<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Jawaban Saya</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container">
		<?=$this->session->flashdata("jawab");?>

		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="panel panel-plain">
					<div class="panel-nav">
						<a href="<?=base_url('pertanyaan-detail-mahasiswa/').$permasalahan[0]->id?>" class="panel-link"><i class="fa fa-chevron-left"></i> Jawab Pertanyaan</a>
					</div>
					<div class="panel-body">
						<div class="detper-pertanyaan">
							<?=$permasalahan[0]->teks?>
						</div>
						<form action="<?=base_url()?>pertanyaan-jawab-proses" class="input-55" method="POST">
							<input type="hidden" name="id" value="<?=$permasalahan[0]->id?>">
							<input type="hidden" name="pendidik" value="<?=$permasalahan[0]->siapa?>">
							<div class="form-group">
								<label for="pertanyaan">Jawaban Untuk Pertanyaan</label>
								<textarea name="jawaban" id="pertanyaan" rows="5" class="form-control"
								placeholder="Contoh: Menurut saya, masalah tersebut disebabkan oleh ABCD. Saran saya XYZ"></textarea>
							</div>
							<div class="form-group row">
								<div class="col-sm-6 col-sm-push-6 col-lg-push-8 col-lg-4">
									<label for="">&nbsp;</label>
									<button class="btn btn-55 btn-success btn-block" type="submit">Publish <span class="hidden-sm">Jawaban</span></button>
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