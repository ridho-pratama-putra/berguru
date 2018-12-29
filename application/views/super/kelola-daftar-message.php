<script type="text/javascript">
	const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

	window.onload=show();
	function show(status='all'){
        $.get('<?=base_url('kelola-daftar-message-')?>'+status, function(jsonData){
        	var data = JSON.parse(jsonData);
        	$('#tabel-kelola-daftar-message').DataTable().destroy();
            table=$('#tabel-kelola-daftar-message').DataTable({
                data : (data),
                columns: [
                	{ "data": "teks_permasalahan" , render: function(data,type,full,meta){
                		return '<td>'+data+'<div class="td-meta"><i class="fa fa-clock-o"></i> '+monthNames[new Date(full.tanggal_message).getMonth()]+' '+ new Date(full.tanggal_message).getDate()+', '+new Date(full.tanggal_message).getFullYear()+' <i class="fa fa-circle"></i><i class="fa fa-user"></i> '+full.siapa_message+'</div></td>';
                	}},
                	{ "data": "teks_komentar" , render: function(data,type,full,meta){
                		if (data != null) {
	                		if (full.status_message =='SOLVED') {
	                			return '<td>'+data+'<div class="td-meta"><i class="fa fa-clock-o"></i>'+monthNames[new Date(full.tanggal_komentar).getMonth()]+' '+ new Date(full.tanggal_komentar).getDate()+', '+new Date(full.tanggal_komentar).getFullYear()+' <i class="fa fa-circle"></i><i class="fa fa-user"></i> '+full.siapa_komentar+'<span class="btn btn-custom btn-status-green"><i class="fa fa-times-circle"></i> Solved</span></div></td>';
	                		}else{
	                			return '<td>'+data+'<div class="td-meta"><i class="fa fa-clock-o"></i> '+monthNames[new Date(full.tanggal_komentar).getMonth()]+' '+ new Date(full.tanggal_komentar).getDate()+', '+new Date(full.tanggal_komentar).getFullYear()+' <i class="fa fa-circle"></i><i class="fa fa-user"></i> '+full.siapa_komentar+'<span class="btn btn-custom btn-status-red"><i class="fa fa-times-circle"></i> Unsolved</span></div></td>';
	                		}
                		}else{
                			return '<td>Belum ada komentar</td>';
                		}
                	}},
                	{
                		"data":"id", render: function(){
                			return '<div class="td-right"><div class="dropdown td-menu"><a href="#" class="dropdown-toggle" type="button" id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><i class="fa fa-ellipsis-v"></i></a><ul class="dropdown-menu dropdown-menu-right" aria-labelledby=""><li><a href="#">Bekukan DM</a></li></ul></div></div>';
                		}
                	}                	
                ],
                aoColumnDefs: [{ "bSortable": false, "aTargets": [2] }],
                order: [],
				columnDefs: [
						{
								'orderable': false,
								'targets': ['no-sort']
						}
				],
				'dom': '<"row"<"col-sm-12 text-right">> <"row"<"col-sm-6"><"col-sm-6">> <"row"<"col-sm-12"t>> <"row"<"col-sm-6"><"col-sm-6"p>>',
      		});

		    $('#cari-daftar-message').on( 'keyup', function () {
			    table.search( this.value ).draw();
			});
			if (status=='all') {
				$("#all-category").addClass("active");
				$("#solved-category").removeClass("active");
				$("#unsolved-category").removeClass("active");
			}else if (status=='solved') {
				$("#all-category").removeClass("active");
				$("#solved-category").addClass("active");
				$("#unsolved-category").removeClass("active");
			}else if (status=='unsolved') {
				$("#all-category").removeClass("active");
				$("#solved-category").removeClass("active");
				$("#unsolved-category").addClass("active");
			}
    	});
    }
</script>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row visible-xs">
			<ol class="breadcrumb">
				<li><a href="#">
					Home
				</a></li>
				<li class="active">Kelola Daftar Message</li>
			</ol>
		</div><!--/.row-->
		<div class="main-container mr-1">
			<?=$this->session->flashdata('alert')?>
		</div>
		<div class="panel panel-plain main-container">
			<div class="panel-heading">
				<div class="row">
					<div class="col-md-5">
						<h1>Kelola Daftar Message</h1>
						<p>klik sesuai kolom untuk melakukan penyortiran</p>
					</div>
					<div class="col-sm-7 col-md-4">
						<div class="btn-group btn-group-justified dt-category" role="group" aria-label="...">
							<a href="#" type="button" class="btn btn-normal" id="all-category" onclick="show()">All</a>
							<a href="#" type="button" class="btn btn-normal" id="solved-category" onclick="show('solved')">Solved</a>
							<a href="#" type="button" class="btn btn-normal" id="unsolved-category" onclick="show('unsolved')">Unsolved</a>
						</div>
					</div>
					<div class="col-sm-5 col-md-3">
						<form class="" action="index.html" method="post">
							<div class="form-group">
								<div class="input-group plain-group">
									<input type="text" id="cari-daftar-message" name="" value="" placeholder="Cari Message" class="form-control dt-search">
									<span class="input-group-addon"><i class="fa fa-search"></i></span>
									<!-- <span class="input-group-btn">
										<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
									</span> -->
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table" id="tabel-kelola-daftar-message">
						<thead>
							<tr>
								<th>Permasalahan</th>
								<th>Komentar</th>
								<th class="no-sort"></th>
							</tr>
						</thead>
						<tbody>

							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>	<!--/.main-->