<script type="text/javascript">
	// Script untuk panel search diluar tabel
	$( document ).ready(function() {
		var table = $('#tabel-kategori').DataTable(); 
		$('#cari-kategori').on( 'keyup', function () {
		    table.search( this.value ).draw();
		} );
	});
	// END Script untuk panel search diluar tabel

	// script untuk edit kategori
	function edit(id){
		window.location.replace('<?=base_url()?>edit-kategori/'+id);
	}
	// end script untuk edit kategori

	// script untuk hapus kategori
	function hapus(id,nama){
		$.post( "<?=base_url()?>delete-kategori",{ id: id, nama: nama},function(data){
			window.location.replace("<?=base_url()?>kelola-kategori-konten");
		}).fail(function() {
		    alert( "Data tidak dapat dihapus. Data sedang digunakan" );
		});
	}
	// end script untuk hapus kategori
</script>


<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Kelola Kategori Konten</li>
		</ol>
	</div><!--/.row-->

	<div class="row">
		<div class="col-sm-9 col-md-9">
			<div class="main-container mr-0">
				<?=$this->session->flashdata("kelolaKategoriKonten");?>
			</div>
			<div class="panel panel-plain main-container mr-0">
				<div class="panel-heading">
					<div class="row">
						<div class="col-md-8">
							<h1>Kelola Kategori Konten</h1>
							<p>klik sesuai kolom untuk melakukan penyortiran</p>
						</div>
						<div class="col-md-4">
							<form class="" action="index.html" method="post">
								<div class="form-group">
									<div class="input-group plain-group">
										<input type="text" name="" value="" placeholder="Cari Kategori" class="form-control dt-search" id="cari-kategori">
										<span class="input-group-addon"><i class="fa fa-search"></i></span>
										<!-- <span class="input-group-btn">
											<button class="btn btn-default" ><i class="fa fa-search"></i></button>
										</span> -->
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table datatable" id="tabel-kategori">
							<thead>
								<tr>
									<th>Nama</th>
									<th>Tanggal</th>
									<th>Pertanyaan</th>
									<th>Jawaban</th>
									<th>Status</th>
									<th width="145" class="no-sort"></th>
								</tr>
							</thead>
							<tbody>
								<?php
								foreach ($kategori as $key => $value) {?>
								<tr>
									<td><?=$value->nama?></td>
									<td><?=tgl_indo($value->tanggal)?></td>
									<td><span class="dot-status dot-blue"></span><?=$value->jumlah_pertanyaan?></td>
									<td><span class="dot-status dot-green"></span><?=$value->jumlah_jawaban?></td>
									<td><span class="<?=($value->status == 'ACTIVE') ? 'text-blue' : 'text-red'?> text-status"><?=$value->status?></span></td>
									<td>
										<span class="btn btn-custom btn-plonk-blue" onclick="edit(<?=$value->id?>)">Edit</span>
										<span class="btn btn-custom btn-plonk-red" onclick="hapus(<?=$value->id?>,'<?=$value->nama?>')">Hapus</span>
								</td>
								<?php
								}
								?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3 col-md-3">
			<div class="main-rightbar">
				<!-- <button class="btn btn-danger btn-block">Tambah Kategori</button> -->
				<div class="panel-separated-heading">
					Tambah Kategori
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<form class="" action="<?=base_url()?>tambah-kategori" method="POST">
							<div class="form-group">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Icon" name="icon" >
									<span class="input-group-addon"><i class="fa fa-image"></i></span>
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" placeholder="Nama Kategori" name="nama" required="">
							</div>
							<div class="form-group">
								<select name="status" id="" class="form-control" required="">
									<option value="" selected="" disabled="">Status</option>
									<option value="ACTIVE">ACTIVE</option>
									<option value="DIBEKUKAN">DIBEKUKAN</option>
								</select>
							</div>
							<div class="text-right">
								<button class="btn btn-default" type="submit">Save</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	<!--/.main-->