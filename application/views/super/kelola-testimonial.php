<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Kelola Testimonial</li>
		</ol>
	</div><!--/.row-->
	<div class="main-container mr-1">
		<?=$this->session->flashdata("alert");?>
	</div>
	<div class="panel panel-plain main-container">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-8">
					<h1>Kelola Testimonial</h1>
					<p>klik sesuai kolom untuk melakukan penyortiran</p>
				</div>
				<div class="col-md-4">
					<form class="" action="index.html" method="post">
						<div class="form-group">
							<div class="input-group plain-group">
								<input type="text" name="" value="" placeholder="Cari Testimonial" class="form-control dt-search">
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit"><i class="bgicon icon-search"></i></button>
								</span>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table datatable">
					<thead>
						<tr>
							<th><h5 align="center">Nama</h5></th>
							<th ><h5 align="center">Testimonial</h5></th>
							<th><h5 align="center">Tanggal Post</h5></th>
							<th width="140" class="no-sort"></th>
						</tr>
					</thead>
					<tbody>
						<?php
						foreach ($testimonial as $key => $value) {?>
							<tr>
								<td>
									<div class="media mid-v">
										<div class="media-left media-middle">
											<div class="user-photo">
												<img src="<?=base_url().$value->foto?>" alt="Photo">
											</div>
										</div>
										<div class="media-body">
											<?=$value->nama?>
										</div>
									</div>
								</td>
								<td>
									<div class="td-pesan">
										<?=$value->teks?>
									</div>
								</td>
								<td>
									<?=tgl_indo($value->tanggal)?>
								</td>
								<td>
									<a href="<?=base_url()?>delete-testimonial/<?=$value->id?>" class="btn btn-custom btn-plonk-red">Hapus</a>
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