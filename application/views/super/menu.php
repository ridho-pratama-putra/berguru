<script type="text/javascript">
	<!-- SCRIPT UNTUK ADD ACTIVE PADA SUB MENU KELOLA DAN ACTIVE COLLAPSE MENU KELOLA JIKA MASUK LIST SUBMENU KELOLA-->
	$( document ).ready(function() {
		$("#<?=$active?>").attr("class","active");
		if ("<?=$active?>" == "pengguna" || "<?=$active?>" == "tenagapendidik" || "<?=$active?>" == "kategorikonten" || "<?=$active?>" == "kontenpermasalahan" || "<?=$active?>" == "komentar" || "<?=$active?>" == "daftarmessage" || "<?=$active?>" == "materi" || "<?=$active?>" == "pesaninfo" ) {
			$('#sub-item-kelola').addClass('in');
			$('#kelola').addClass('active');
			$('#chevron').removeClass('fa-chevron-down').addClass('fa-chevron-up');
		}else{
			$('#sub-item-kelola').removeClass('in');
			$('#chevron').removeClass('fa-chevron-up').addClass('fa-chevron-down');
		}
		$(".link-disabled").click(function(e) {
			e.preventDefault();
		});
	});
	<!-- END SCRIPT UNTUKADD ACTIVE CLASS PADA MENU -->

	// function ajax untuk set alert badge
	function setToTerlihat() {
		$.post( "<?=base_url()?>Admin/setTerlihat",{ id:<?=$this->session->userdata('loginSession')['id']?>},function(data){
			$('#jumlah_notif').html('');
		});
	}
</script>	
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span></button>
				<div class="row">
					<div class="col-xs-12 col-sm-3 col-lg-2 left-header">
						<a class="navbar-brand" href="<?=base_url()?>">Berguru.com</a>
					</div>
					<div class="col-xs-12 col-sm-9 col-lg-10 right-header">
						<div class="nav-breadcrumb hidden-xs">
							<ol class="breadcrumb">
								<li><a href="#">
									Home
								</a></li>
								<li class="active"><?=$breadcrumb?></li>
							</ol>
						</div>
						<ul class="nav navbar-top-links navbar-right">
							<li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#" onclick="setToTerlihat()">
								<em class="fa fa-bell"></em><span class="label label-danger" id="jumlah_notif"><?=(sizeof($belum_dilihat) !== 0 ? sizeof($belum_dilihat) : '')?></span>
							</a>
							<ul class="dropdown-menu dropdown-messages">
								<?php foreach ($notif as $key => $value) { ?>
									<li>
										<div class="dropdown-messages-box"><a href="#" class="pull-left">
											<img alt="image" class="img-circle" src="<?=$value->foto?>">
										</a>
										<div class="message-body"><small class="pull-right"><?=time_elapsed_string($value->datetime)?></small>
											<?php if ($value->untuk == 'admin' AND $value->konteks == 'penggunaBaru' AND $value->aktor == 'mahasiswa') { ?>
												<a href="<?=base_url()?>kelola-pengguna">Mahasiswa baru An. <strong><?=$value->dari?></strong> meminta aktivasi akun.</a>
											<?php }elseif($value->untuk == 'admin' AND $value->konteks == 'penggunaBaru' AND $value->aktor == 'pendidik'){?>
												<a href="<?=base_url()?>kelola-tenaga-pendidik">Pendidik baru An. <strong><?=$value->dari?></strong> meminta aktivasi akun.</a>
											<?php }elseif($value->untuk == 'admin' AND $value->konteks == 'lowongan'){ ?>
												<a href="<?=base_url()?>lowongan-kerja"><strong><?=$value->dari?></strong> meminta verifikasi lowongan.</a>
											<?php }elseif($value->untuk == 'semua' AND $value->konteks == 'materiBaru'){ ?>
												<a href="<?=base_url()?>kelola-materi"><strong><?=$value->dari?></strong> menerbitkan materi baru.</a>
											<?php } ?>
											<br /><small class="text-muted"><?=date('H:i - M, d Y',strtotime($value->datetime))?></small></div>
										</div>
									</li>
									<li class="divider"></li>
								<?php } ?>
								<?php if ($notif !== array()) { ?>
									<li>
										<div class="all-button"><a href="#">
											<em class="fa fa-inbox"></em> <strong>All Notifications</strong>
										</a></div>
									</li>
								<?php }else{ ?>
									<li>
										<div class="all-button"><a href="#">
											<em class="fa fa-inbox"></em> <strong>No Notifications for you</strong>
										</a></div>
									</li>
								<?php } ?>
							</ul>
						</li>
						<li class="dropdown user-menu">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">
								<div class="user-name"><?=$this->session->userdata('loginSession')['nama']?></div>
								<div class="user-photo">
									<img src="<?=$this->session->userdata('loginSession')['foto']?>" class="img-circle" alt="Photo">
								</div>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="<?=base_url()?>profil-admin">
										<div><em class="fa fa-user"></em> Profile</div>
									</a>
								</li>
								<li class="divider"></li>
								<li>
									<a href="<?=base_url()?>logout">
										<div><em class="fa fa-power-off"></em> Log Out</div>
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div><!-- /.container-fluid -->
</nav>
<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar scrollable">
	<div class="profile-sidebar">
		<div class="profile-userpic">
			<img src="<?=$this->session->userdata('loginSession')['foto']?>" class="" alt="Photo">
		</div>
		<div class="profile-usertitle">
			<div class="profile-usertitle-name"><?=$this->session->userdata('loginSession')['nama']?></div>
			<div class="profile-usertitle-status"><?=$this->session->userdata('loginSession')['email']?></div>
		</div>
		<div class="btn-hakakses"><em class="fa fa-user"></em>Super Admin</div>
		<div class="clear"></div>
	</div>
	<div class="divider"></div>
			<!-- <form role="search">
			<div class="form-group">
			<input type="text" class="form-control" placeholder="Search">
		</div>
	</form> -->
	<ul class="nav menu">
		<li class="" id="dashboard"><a href="<?=base_url()?>dashboard-admin"><em class="fa fa-dashboard">&nbsp;</em> Dashboard</a></li>
		<li class="parent" id="kelola">
			<a data-toggle="collapse" href="#sub-item-kelola" class="collapsed">
				<span class="fa fa-th">&nbsp;</span> Kelola <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"><em id="chevron" class="fa fa-chevron-down"></em></span>
			</a>
			<ul class="children collapse" id="sub-item-kelola">
				<li><a class="" href="<?=base_url()?>kelola-pengguna" id="pengguna">
					Pengguna
				</a></li>
				<li><a class="" href="<?=base_url()?>kelola-tenaga-pendidik" id="tenagapendidik">
					Tenaga Pendidik
				</a></li>
				<li><a class="" href="<?=base_url()?>kelola-kategori-konten" id="kategorikonten">
					Kategori Konten
				</a></li>
				<li><a class="" href="<?=base_url()?>kelola-konten-permasalahan" id="kontenpermasalahan">
					Konten Permasalahan
				</a></li>
				<li><a class="" href="<?=base_url()?>kelola-komentar" id="komentar">
					Komentar
				</a></li>
				<li><a class="" href="<?=base_url()?>kelola-daftar-message" id="daftarmessage">
					Daftar Message
				</a></li>
				<li><a class="" href="<?=base_url()?>kelola-materi" id="materi">
					Materi
				</a></li>
				<li><a class="" href="<?=base_url()?>kelola-pesan-info" id="pesaninfo">
					Pesan Info
				</a></li>
			</ul>
		</li>
		<li id="lowongan" class=""><a href="<?=base_url()?>lowongan-kerja"><em class="fa fa-briefcase">&nbsp;</em> Lowongan Kerja</a></li>
		<li id="bantuan"><a href="<?=base_url()?>"><em class="fa fa-question-circle">&nbsp;</em> Bantuan</a></li>
		<li><a href="<?=base_url()?>logout"><em class="fa fa-power-off">&nbsp;</em> Log Out</a></li>
	</ul>
	<div class="side-credit">
		<p>&copy; Berguru.com</p>
	</div>
</div><!--/.sidebar-->
