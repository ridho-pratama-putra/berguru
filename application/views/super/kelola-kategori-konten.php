<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Kelola Kategori Konten</li>
		</ol>
	</div><!--/.row-->
	<div class="main-container mr-1">
		<?=$this->session->flashdata("alert");?>
	</div>
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
						Tambah / Edit Kategori
					</div>
					<div class="panel panel-default">
						<div class="panel-body">
							<form class="" action="<?=base_url()?>submit-tambah-kategori" method="POST" enctype="multipart/form-data" id="form-edit-or-tambah-kategori">
								<div class="form-group">
									<div class="input-group">
										<div class="btn-group col-xs-push-4" role="group" aria-label="Basic example">
											<button type="button" class="btn btn-primary btn-xs col-xs-6" onclick="tambahKategori()" id="button-tambah-kategori">Tambah</button>
											<button type="button" class="btn btn-secondary btn-xs col-xs-6" id="button-edit-kategori">Edit</button>
										</div>
									</div>
								</div>
								<input type="hidden" name="id_kategori" id="current-id-kategori">
								<div class="form-group">
									<div class="input-group">
										<div class="user-photo wh-100" id="preview-current-bg-kategori">
											
										</div>
									</div>
									<div class="input-group">
										<input type="file" class="form-control" name="background"  accept="image/*" id="current-bg-kategori">
										<span class="input-group-addon"><i class="fa fa-image"></i></span>
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<input type="text" placeholder="Icon" name="icon" id="current-icon-kategori" class="form-control icon-picker" />
										<!-- <input type="text" class="form-control" placeholder="Icon" name="icon" id="current-icon-kategori"> -->
										<span class="input-group-addon"><i class="fa fa-image"></i></span>
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Nama Kategori" name="nama" required="" id="current-nama-kategori">
								</div>
								<div class="form-group">
									<select name="status" class="form-control" required="" id="current-status-kategori">
										<option value="" selected="" disabled="">Status</option>
										<option value="ACTIVE">ACTIVE</option>
										<option value="DIBEKUKAN">DIBEKUKAN</option>
									</select>
								</div>
								<div class="text-right">
									<button class="btn btn-default" type="submit" id="button-submit-add-or-edit-kategori">Submit Add</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
		// window.location.replace('<?=base_url()?>edit-kategori/'+id);
		$("#button-tambah-kategori").removeClass('btn-primary')
		$("#button-tambah-kategori").addClass('btn-secondary')
		$("#button-edit-kategori").addClass('btn-primary')
		$("#button-edit-kategori").removeClass('btn-secondary')

		$.get("<?=base_url()?>get-kategori-konten/",{id : id},function( res ){
			res = JSON.parse(res)
			$("#current-id-kategori").val(res[0].id)
			$("#current-nama-kategori").val(res[0].nama)
			$("#current-nama-kategori").attr("readonly",true)
			$("#current-icon-kategori").val(res[0].icon)
			$("#current-bg-kategori").val(res[0].bg)
			$("#current-status-kategori").val(res[0].status)
			if (res[0].background !== null) {
				$("#preview-current-bg-kategori").html("<img src='<?=base_url()?>"+res[0].background+"' alt='Image'>")
			}else{
				$("#preview-current-bg-kategori").html("<h6>Belum ada gambar</h6>")
			}
		})
		$("#button-submit-add-or-edit-kategori").html("Submit Edit")
		$("#form-edit-or-tambah-kategori").attr("action", "<?=base_url()?>submit-edit-kategori")
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

	function tambahKategori(){
		$("#current-nama-kategori").attr("readonly",false)
		document.getElementById("form-edit-or-tambah-kategori").reset();
		$("#button-tambah-kategori").addClass('btn-primary')
		$("#button-tambah-kategori").removeClass('btn-secondary')
		$("#button-edit-kategori").removeClass('btn-primary')
		$("#button-edit-kategori").addClass('btn-secondary')
		$("#button-submit-add-or-edit-kategori").html("Submit Add")
		$("#form-edit-or-tambah-kategori").attr("action", "<?=base_url()?>submit-tambah-kategor")
		$("#preview-current-bg-kategori").html("")
	}
</script>