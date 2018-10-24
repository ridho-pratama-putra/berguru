<script type="text/javascript">
	$( document ).ready(function() {
		$.post("<?=base_url()?>get-pesan-pendidik",{id:<?=$this->session->userdata('loginSession')['id']?>}, function( data ) {
		  	$( ".result" ).html( data );
		});
		for (var i = 0; i < 3; i++) {
			$("#listPesan").append('<div class="pesan-item">'+
							'<div class="pi-left">'+
								'<div class="user-photo">'+
									'<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">'+
								'</div>'+
								'<div class="user-nama">'+
									'Daniel Webber'+
								'</div>'+
								'<div class="last-pesan">'+
									'Wah, kenapa ya padahal hal ini sangatlah asik dan gitu'+
								'</div>'+
							'</div>'+
							'<div class="pi-right">'+
								'<span class="time">'+
									'1h'+
								'</span>'+
								'<span class="badge">2</span>'+
							'</div>'+
						'</div>')
		}
	});
</script>

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Pesan</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container">
		<?=$this->session->flashdata("login")?>
		<div class="panel panel-plain panel-pesan">
			<div class="row">
				<div class="col-sm-5 col-md-4 col-lg-3 panel-pleft">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12">
								<h1>Pesan</h1>
							</div>
							<div class="col-xs-12">
								<form class="" action="index.html" method="post">
									<div class="form-group">
										<div class="input-group plain-group">
											<input type="text" name="" value="" placeholder="Pencarian" class="form-control dt-search">
											<span class="input-group-btn">
												<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
											</span>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="panel-body list-pesan scrollable" id="listPesan">
						<!-- <div class="pesan-item">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Daniel Webber
								</div>
								<div class="last-pesan">
									Wah, kenapa ya padahal hal ini sangatlah asik dan gitu
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									1h
								</span>
								<span class="badge">2</span>
							</div>
						</div>
						<div class="pesan-item pi-read">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Aleister Don
								</div>
								<div class="last-pesan">
									Sweet sweet seventy, I am a whole show
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									2d
								</span>
								<span class="badge">1</span>
							</div>
						</div>
						<div class="pesan-item">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Juminten Antartika
								</div>
								<div class="last-pesan">
									Sweet sweet seventy, I am a whole show
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									2d
								</span>
								<span class="badge">1</span>
							</div>
						</div>
						<div class="pesan-item">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Adam McMahon
								</div>
								<div class="last-pesan">
									Sweet sweet seventy, I am a whole show
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									2d
								</span>
								<span class="badge">1</span>
							</div>
						</div>
						<div class="pesan-item">
							<div class="pi-left">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Fanny Wibowo
								</div>
								<div class="last-pesan">
									Sweet sweet seventy, I am a whole show
								</div>
							</div>
							<div class="pi-right">
								<span class="time">
									2d
								</span>
								<span class="badge">99</span>
							</div>
						</div> -->
					</div>
				</div>
				<div class="col-sm-7 col-md-8 col-lg-9 panel-pright">
					<div class="panel-body detail-pesan-empty">
							<img src="<?=base_url()?>assets/dashboard/assets/images/empty-thing.png" alt="Image" class="img-circle">
							<div class="empty-msg">
								Tidak ada pesan yang dipilih
							</div>
					</div>
				</div>
			</div>
		</div>

	</div>






</div>	<!--/.main-->ss