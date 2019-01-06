<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row visible-xs">
		<ol class="breadcrumb">
			<li><a href="#">
				Home
			</a></li>
			<li class="active">Profil Saya</li>
		</ol>
	</div><!--/.row-->

	<div class="main-container">
<div class="row">
	<div class="col-md-3">
		<div class="panel panel-plain">
			<div class="panel-heading">
				<h1>Profil Saya</h1>
			</div>
			<div class="panel-body">
				<div class="profile-data">
					<div class="row">
						<div class="col-sm-6">
							<div class="profile-pic">
								<img class="img-circle" src="<?=$this->session->userdata('loginSession')['foto']?>" class="" alt="Photo">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="profile-achievement">
								<div class="profile-point"><span>P</span> <?=$pengguna[0]->poin?></div>
								<br/>
								<?php 
								if(intval($pengguna[0]->poin) !== 0 ){
									if (intval($pengguna[0]->poin) < 40 ) { ?>
										<div class="achie achie-orange" title="Beginner"><i class="fa fa-star"></i></div>
									<?php }elseif (intval($pengguna[0]->poin) < 100) { ?>
										<div class="achie achie-orange" title="Beginner"><i class="fa fa-star"></i></div>
										<div class="achie achie-green" title="Rookie"><i class="fa fa-trophy"></i></div>
									<?php }elseif (intval($pengguna[0]->poin) < 180) { ?>
										<div class="achie achie-orange" title="Beginner"><i class="fa fa-star"></i></div>
										<div class="achie achie-green" title="Rookie"><i class="fa fa-trophy"></i></div>
										<div class="achie achie-blue" title="Regular"><i class="far fa-gem"></i></div>
									<?php }elseif (intval($pengguna[0]->poin) < 300) { ?>
										<div class="achie achie-orange" title="Beginner"><i class="fa fa-star"></i></div>
										<div class="achie achie-green" title="Rookie"><i class="fa fa-trophy"></i></div>
										<div class="achie achie-blue" title="Regular"><i class="far fa-gem"></i></div>
										<div class="achie achie-black" title="Professional"><i class="fa fa-bicycle"></i></div>
								<?php 
									}
								} 
								?>
							</div>
						</div>
					</div>
					<div class="profile-meta">
						<div class="profile-name"><?=$this->session->userdata('loginSession')['nama']?></div>
						<div class="profile-email"><?=$this->session->userdata('loginSession')['email']?></div>
						<div class="profile-phone"><?=$this->session->userdata('loginSession')['no_hp']?></div>
					</div>
				</div>
				<div class="profile-dm-number">
					<table>
						<tr>
							<th><?=$dm['dm'][0]['jumlah']?></th>
							<td>DM</td>
							<td></td>
						</tr>
						<tr>
							<th><?=$dm['dm_solved'][0]['jumlah']?></th>
							<td>DM Solved</td>
							<td><span class="circle circle-green"><i class="fa fa-check"></i></span></td>
						</tr>
					</table>
				</div>
				<a href="<?=base_url()?>edit-profil-mahasiswa" class="btn btn-normal btn-plonk-green btn-block">Edit Profil</a>
			</div>
		</div>
	</div>

	<div class="col-md-9">
		<div class="panel panel-plain">
			<div class="panel-heading">
				<h1>Komentar yang anda kirimkan</h1>
			</div>
			<div class="panel-body">
				<?php 
				if ($komentar !== array()) { 
					foreach ($komentar as $key => $value) { ?>
						<div class="profil-pertanyaan">
							<div class="p-pertanyaan">
								<?=($value->teks_permasalahan !== NULL ? $value->teks_permasalahan : 'Permasalahan telah dihapus')?>
							</div>
							<div class="p-jawaban">
								<div class="media">
									<div class="media-left media-middle">
										<div class="user-photo">
											<img src="<?=base_url().$value->foto?>" alt="Photo">
										</div>
										<div class="user-nama">
											<?=$value->nama?>
											<br/>
											<?=date("d M Y",strtotime($value->tanggal))?>
										</div>
									</div>
									<div class="media-body">
										<div class="small">Jawaban Anda</div>
										<?=$value->teks_komentar?>
									</div>
								</div>
							</div>
						</div>
						
					<?php } ?>
				<?php }else{ ?>
					<div class="profil-pertanyaan">
						<div class="p-pertanyaan">
							Anda belum memiliki kontribusi. Coba lihat dan berikan komentar anda pada beberapa pertanyaan yang ada di beranda.
						</div>
					</div>
				<?php } ?>
			</div>
		</div>
	</div>
</div>


	</div>






</div>	<!--/.main-->
