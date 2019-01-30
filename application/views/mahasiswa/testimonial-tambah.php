<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Testimonial</li>
		</ol>
	</div><!--/.row-->
	<div class="main-container mr-1">
		<?=$this->session->flashdata("alert");?>
	</div>
	<div class="main-container">
		<div class="row">
			<div class="col-sm-8 col-md-9">
				<div class="panel panel-plain">
					<div class="panel-nav">
						<a href="<?=base_url()?>testimonial-mahasiswa" class="panel-link"><i class="bgicon icon-arrow-left"></i> Kembali</a>
					</div>
					<div class="panel-heading">
						<h1>Buat Testimonial Baru</h1>
						<p>membuat testimonial baru</p>
					</div>
					<div class="panel-body">
						<form action="<?=base_url()?>insert-testimonial-mahasiswa" class="input-55" method="POST">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="teks">Testimonial</label>
										<textarea class="form-control" name="teks" id="teks" placeholder="Saya sangat terbantu disini, cukup dengan post pertanyaan maka berbagai solusi alternatif akan bermunculan."></textarea>
									</div>
								</div>
							</div>
							<div class="form-separator"></div>
							<div class="row">
								<div class="col-sm-6 col-sm-push-6 col-lg-push-7 col-lg-5">
									<label for="">&nbsp;</label>
									<button class="btn btn-55 btn-success btn-block" type="submit">Publish <span class="hidden-sm">Testimonial</span></button>
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
