
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Lowongan Kerja</li>
		</ol>
	</div><!--/.row-->

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
								<input type="text" name="" value="" placeholder="Cari Pekerjaan" class="form-control dt-search">
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
				<table class="table datatable">
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
						<tr>
							<td>
								Guru Tingkat SD yang ulet bisa ms. Office nilai plus
							</td>
							<td>SDN Konoha 1</td>
							<td>Kota Malang, Jawa Timur</td>
							<td>+62889911119</td>
							<td data-order="valid">
								<div class="saklar">
									<input type="checkbox" class="saklar-switch" id="valid1" checked>
									<label for="valid1"></label>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								Guru Tingkat SD yang ulet bisa ms. Office nilai plus
							</td>
							<td>SDN Konoha 1</td>
							<td>Kota Malang, Jawa Timur</td>
							<td>+62889911119</td>
							<td data-order="invalid">
								<div class="saklar">
									<input type="checkbox" class="saklar-switch" id="valid2">
									<label for="valid2"></label>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								Guru Tingkat SD yang ulet bisa ms. Office nilai plus
							</td>
							<td>SDN Konoha 1</td>
							<td>Kota Malang, Jawa Timur</td>
							<td>+62889911119</td>
							<td data-order="valid">
								<div class="saklar">
									<input type="checkbox" class="saklar-switch" id="valid3" checked>
									<label for="valid3"></label>
								</div>
							</td>
						</tr>
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
			<form class="input-55" action="index.html" method="post">
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
								<input type="text" class="form-control" placeholder="Contoh: Guru SD ulet, bisa ms. Word nilai plus">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="">Instansi / Perusahaan</label>
								<input type="text" class="form-control" placeholder="Nama Instansi">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="">Lokasi Lowongan</label>
								<input type="text" class="form-control" placeholder="Lokasi">
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label for="">Kontak Person</label>
								<input type="text" class="form-control" placeholder="No. Telepon / HP">
							</div>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="pull-left btn btn-normal btn-plonk-red" data-dismiss="modal">Close</button>
					<button type="button" class="pull-right btn btn-normal btn-success">Publish Lowongan</button>
				</div>
			</form>
		</div>
	</div>
</div>