<script type="text/javascript">
	<!-- SCRIPT UNTUK ADD ACTIVE -->
	$( document ).ready(function() {
		$("#<?=$active?>").attr("class","active");
	});
	function setToTerlihat() {
		$.post( "<?=base_url()?>Pendidik/setTerlihat",{ id:<?=$this->session->userdata('loginSession')['id']?>},function(data){
			$('#jumlah_notif').html('');
		});
	}
	<!-- END SCRIPT UNTUKADD ACTIVE CLASS PADA MENU -->
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
									<em class="fa fa-envelope"></em><span class="label label-danger" id="jumlah_notif"><?=(sizeof($belum_dilihat) !== 0 ? sizeof($belum_dilihat) : '')?></span>
								</a>
								<ul class="dropdown-menu dropdown-messages">
									<?php foreach ($notif as $key => $value) { ?>
									<li>
										<div class="dropdown-messages-box"><a href="#" class="pull-left">
											<img alt="image" class="img-circle" src="<?=$this->session->userdata('loginSession')['foto']?>">
										</a>
										<div class="message-body"><small class="pull-right"><?=time_elapsed_string($value->datetime)?></small>
											<?php if ($value->untuk == $this->session->userdata('loginSession')['id'] AND $value->konteks == 'komentar') { ?>
											<a href="<?=base_url()?>detail-pertanyaan-pendidik/<?=$value->id_konteks?>" title='klik untuk melihat komentar'><strong><?=$value->dari?></strong> mengomentari pertanyaan anda</a>
											<?php }elseif($value->untuk == 'semua'){?>
												<a href="#"><strong>Pemberitahuan!</strong></a>
											<?php } ?>
											<br /><small class="text-muted"><?=date('H:i - M, d Y',strtotime($value->datetime))?></small></div>
										</div>
									</li>
									<li class="divider"></li>
									<?php } ?>
									<?php if ($notif !== array()) { ?>
									<li>
										<div class="all-button"><a href="#">
											<em class="fa fa-inbox"></em> <strong>All Messages</strong>
										</a></div>
									</li>
									<?php }else{ ?>
										<li>
										<div class="all-button"><a href="#">
											<em class="fa fa-inbox"></em> <strong>No Messages for you</strong>
										</a></div>
									</li>
									<?php } ?>
								</ul>
							</li>
							<li class="dropdown"><a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
								<em class="fa fa-bell"></em><span class="label label-info">53</span>
							</a>
							<ul class="dropdown-menu dropdown-alerts">
								<li><a href="#">
									<div><em class="fa fa-envelope"></em> 1 New Message
										<span class="pull-right text-muted small">3 mins ago</span></div>
									</a></li>
									<li class="divider"></li>
									<li><a href="#">
										<div><em class="fa fa-heart"></em> 12 New Likes
											<span class="pull-right text-muted small">4 mins ago</span></div>
										</a></li>
										<li class="divider"></li>
										<li><a href="#">
											<div><em class="fa fa-user"></em> 5 New Followers
												<span class="pull-right text-muted small">4 mins ago</span></div>
											</a></li>
										</ul>
									</li>
									<li class="dropdown user-menu"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
										<div class="user-name"><?=$this->session->userdata('loginSession')['nama']?></div>
										<div class="user-photo">
											<img src="<?=$this->session->userdata('loginSession')['foto']?>"  class="img-circle" alt="Photo">
										</div>
									</a>
									<ul class="dropdown-menu">
										<li><a href="<?=base_url()?>profil-pendidik">
											<div><em class="fa fa-user"></em> Profile</div>
										</a></li>
										<li class="divider"></li>
										<li><a href="<?=base_url()?>logout">
											<div><em class="fa fa-power-off"></em> Log Out</div>
										</a></li>
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
				<a href="#" class="profile-option"><i class="fa fa-cog"></i></a>
				<div class="profile-userpic">
					<img src="<?=$this->session->userdata('loginSession')['foto']?>" class="" alt="Photo">
				</div>
				<div class="profile-usertitle">
					<div class="profile-usertitle-name"><?=$this->session->userdata('loginSession')['nama']?></div>
					<div class="profile-usertitle-status"><?=$this->session->userdata('loginSession')['email']?></div>
				</div>
				<div class="btn-hakakses"><em class="fa fa-user"></em> Pendidik</div>
				<div class="clear"></div>
			</div>
			<div class="divider"></div>
			<!-- <form role="search">
			<div class="form-group">
			<input type="text" class="form-control" placeholder="Search">
		</div>
	</form> -->
	<ul class="nav menu">
		<li class="" id="home">
			<a href="index.html"><em class="fa fa-home">&nbsp;</em> Home <span class="badge">42</span></a>
		</li>
		<li class="" id="pertanyaanSaya">
			<a href="<?=base_url()?>pertanyaan-pendidik" ><em class="fa fa-book-open">&nbsp;</em> Pertanyaan Saya</a>
		</li>
		<li class="" id="pesan">
			<a href="<?=base_url()?>pesan-pendidik" ><em class="fa fa-comments">&nbsp;</em> Pesan</a>
		</li>
		<li class="" id="materi">
			<a href="<?=base_url()?>materi-pendidik"><em class="fa fa-layer-group">&nbsp;</em> Materi</a>
		</li>
		<li class="" id="karir">
			<a href="<?=base_url()?>karir-pendidik" ><em class="fa fa-briefcase">&nbsp;</em> Karir</a>
		</li>
		<li>
			<a href="<?=base_url()?>logout"><em class="fa fa-power-off">&nbsp;</em> Log Out</a>
		</li>
	</ul>
	<div class="side-credit">
		<p>&copy; Berguru.com</p>
	</div>
</div><!--/.sidebar-->
