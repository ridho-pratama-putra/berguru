		<div class="content-front content-pages content-materi">                        
			<section class="post-content">
				<div class="container">
					<div class="row ask-header">
						<div class="col-sm-6 col-md-8">
							<p class="ask-count">Materi Terbaru</p>
						</div>
						<div class="col-sm-6 col-md-4 materi-dropdown">
							<ul class="list-inline">
								<li>
									<select class="form-control dropdown-item" id="select-jangka-waktu" onchange="loadPagination(1);$('#item-materi').html('')">
										<option value="all">Semua waktu</option>
										<option value="harian">Hari ini</option>
										<option value="tahunan">Tahun ini</option>
										<option value="bulanan">Bulan ini</option>
									</select>
								</li>
								<li>
									<select class="form-control dropdown-item" id="select-kategori" onchange="loadPagination(1);$('#item-materi').html('')">
										<option value="all">Semua kategori</option>
										<?php
										foreach ($kategori as $key => $value) {?>
											<option value="<?=$value->id?>"><?=$value->nama?></option>
										<?php }
										?>
									</select>
								</li>
							</ul>
						</div>
					</div>
					<div class="row ask-list">
						<div class="col-md-12">
							<!-- Item Materi -->
							<div id="item-materi"></div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<script type="text/javascript">
			$(document).ready(function () {

				$('#muat-banyak').on('click',function(e){
					e.preventDefault(); 
					var pageno = $(this).attr('data-ci-pagination-page');
					$('#muat-banyak').attr("data-ci-pagination-page",(parseInt(pageno)+1));
					loadPagination(pageno);
				});
			});

			loadPagination(1);

			function loadPagination(pagno){
				var jangka_waktu = $("#select-jangka-waktu").val()
				var kategori = $("#select-kategori").val()
				const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun","Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];


				$.ajax({
					url: '<?=base_url()?>load-materi/'+pagno+'/'+jangka_waktu+'/'+kategori,
					type: 'GET',
					dataType: 'json',
					success: function(response){
						if (response.result.length == 0 &&  response.row == 0) {
							// alert('panjang response : '+response.result.length + ' nilai row : '+response.row)
							
							$('#button-muat-banyak').html("<a href='#' class='btn btn-transparent-blue link-disabled'>Belum ditemukan materi dengan kategori yang anda pilih</a>")
							$(".link-disabled").click(function(e) {
								e.preventDefault();
							});
						}else if (response.result.length == 0 &&  response.row !== 0) {
							// alert('panjang response : '+response.result.length + ' nilai row : '+response.row)
							$('#button-muat-banyak').html("<a href='#' class='btn btn-transparent-blue link-disabled'>Semua materi telah ditampilkan</a>")
							$(".link-disabled").click(function(e) {
								e.preventDefault();
							});
						}else{
							var elementToRender = ''
							// alert('panjang response : '+response.result.length + ' nilai row : '+response.row)
							
							$("#button-muat-banyak").html("<a href='#' id='muat-banyak' class='btn btn-transparent-blue' data-ci-pagination-page=''>Muat Lebih Banyak</a>")
							$("#muat-banyak").attr("data-ci-pagination-page",(parseInt(pagno)+1));

							// reinitialisasi saat ganti kategori dan jangka waktu. karena sebelumnya terhapus
							$('#muat-banyak').on('click',function(e){
								e.preventDefault(); 
								var pageno = $(this).attr('data-ci-pagination-page');
								$('#muat-banyak').attr("data-ci-pagination-page",(parseInt(pageno)+1));
								loadPagination(pageno);
							});
							
							// if (response.result.length !== 0) {
								for (var i = 0; i < response.result.length; i++) {
									const d = new Date(response.result[i].waktu_terakhir_edit)
									elementToRender += 
									"<div class='panel panel-default panel-ask panel-materi'>"+
									"<div class='panel-body'>"+
									"<div class='row panel-ask-account'>"+
									"<div class='col-sm-6'>"+
									"<div class='media'>"+
									"<div class='media-left'>"+
									"<div class='materi-icon icon-"+response.result[i].ikon_warna+"'><span class='bgicon "+response.result[i].ikon_logo+"'></span></div>"+
									"</div>"+
									"<div class='media-body materi-content'>"+
									"<h4 class='media-heading'>"+response.result[i].nama_materi+"</h4>"+
									"<p class='ask-time'>"+
									"<span><i class='bgicon icon-clock'></i> "+monthNames[d.getMonth()]+", "+d.getDate()+" "+d.getFullYear()+" <i class='fa fa-circle hidden-xs'></i></span>"+
									"<span><i class='bgicon icon-download'></i> "+response.result[i].jumlah_diunduh+" <i class='fa fa-circle hidden-xs'></i></span>"+
									"<span><i class='bgicon icon-user'></i> "+response.result[i].nama_pengguna+"</span>"+
									"</p>"+
									"<p class='materi-tag materi-"+response.result[i].ikon_warna+"'>"+response.result[i].nama_kategori+"</p>"+
									"</div>"+
									"</div>"+
									"</div>"+
									"<div class='col-sm-6 ask-data-list'>"+
									"<a href='<?=base_url()?>download-materi/"+response.result[i].id+"' class='btn btn-transparent-green btn-download'><i class='bgicon icon-download'></i>Unduh</a>"+
									"<p class='tag-list'>Tags "
									var tags = response.result[i].tags.split(',')
									for(var j in tags){
										elementToRender += '<span class="tag-item">#'+tags[j]+'</span> '
									}
									elementToRender +=
									"</p>"+
									"</div>"+
									"</div>"+
									"</div>"+
									"</div>"
								}

								$("#item-materi").append(elementToRender)
							// }else{
								// alert("kosong")
								// $("#item-materi").html(elementToRender)
							// }
						}
					}
				});
			}
		</script>