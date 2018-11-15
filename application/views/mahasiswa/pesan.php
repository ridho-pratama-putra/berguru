<script type="text/javascript">
	// funtion untuk set form pembukaan chat baru
	function openNewChat(id_komentator,id_permasalahan,id_komentar) {
		$('#new_chat_id_komentator').val(id_komentator);
		$('#formNewChat').submit();
	}
</script>
<form method="POST" action="<?=base_url()?>pesan-mahasiswa" id="formNewChat">
	<input type="hidden" name="id_komentator" value="" id="new_chat_id_komentator">
</form>
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
		<?=$this->session->flashdata('login')?>
		<div class="panel panel-plain panel-pesan">
			<div class="row">
				<div class="col-sm-6 col-md-5 col-lg-3 panel-pleft">
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
					<div class="panel-body list-pesan scrollable">
						<?php foreach ($to as $key => $value) { ?>
							<div class="pesan-item" onclick="openNewChat(<?=$value->id?>)">
								<!--  pi-read -->
								<!--  pi-selected -->
								<div class="pi-left">
									<div class="user-photo">
										<img src="<?=base_url().$value->foto?>" class="img-circle" alt="Photo">
									</div>
									<div class="user-nama">
										<?=$value->nama?>
									</div>
									<div class="last-pesan">
										pesan
									</div>
								</div>
								<div class="pi-right">
									<span class="time">
										1h
									</span>
									<span class="badge">1</span>
								</div>
							</div>
						<?php } ?>
					</div>
				</div>
				<div class="col-sm-6 col-md-7 col-lg-9 panel-pright">
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






</div>	<!--/.main-->