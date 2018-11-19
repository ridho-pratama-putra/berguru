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
								<div class="achie achie-orange" title="Pencapaian"><i class="fa fa-star"></i></div>
								<div class="achie achie-green" title="Pencapaian"><i class="fa fa-trophy"></i></div>
								<div class="achie achie-blue" title="Pencapaian"><i class="far fa-gem"></i></div>
								<div class="achie achie-black" title="Pencapaian"><i class="fa fa-bicycle"></i></div>
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
							<th>121</th>
							<td>DM</td>
							<td></td>
						</tr>
						<tr>
							<th>13</th>
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
				<h1>Pertanyaan yang mendapat respon</h1>
			</div>
			<div class="panel-body">
				<div class="profil-pertanyaan">
					<div class="p-pertanyaan">
						Saya mengalami kesulitan dalam menyampaikan mata pelajaran biologi karena murid saya kurang antusias. Kira2 apa yg harus saya lakukan supaya motivasi murid saya ini meningkat? terimakasih
					</div>
					<div class="p-jawaban">
						<div class="media">
							<div class="media-left media-middle">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Daniel Webber
									<br/>
									14 Sep 2018
								</div>
							</div>
							<div class="media-body">
								<div class="small">Jawaban Terbaru</div>
								Pada dasarnya murid memiliki behavior berbeda per individu, jadi kita bisa membuat analisa untuk individu yang kurang termotivasi. Bisa menggunakan metode ABCD untuk itu. Link detail http://Url.googl.co/eihbvq4
							</div>
						</div>
					</div>
				</div>
				<div class="profil-pertanyaan">
					<div class="p-pertanyaan">
						Saya mengalami kesulitan dalam menyampaikan mata pelajaran biologi karena murid saya kurang antusias. Kira2 apa yg harus saya lakukan supaya motivasi murid saya ini meningkat? terimakasih
					</div>
					<div class="p-jawaban">
						<div class="media">
							<div class="media-left media-middle">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Daniel Webber
									<br/>
									14 Sep 2018
								</div>
							</div>
							<div class="media-body">
								<div class="small">Jawaban Terbaru</div>
								Pada dasarnya murid memiliki behavior berbeda per individu, jadi kita bisa membuat analisa untuk individu yang kurang termotivasi. Bisa menggunakan metode ABCD untuk itu. Link detail http://Url.googl.co/eihbvq4
							</div>
						</div>
					</div>
				</div>
				<div class="profil-pertanyaan">
					<div class="p-pertanyaan">
						Saya mengalami kesulitan dalam menyampaikan mata pelajaran biologi karena murid saya kurang antusias. Kira2 apa yg harus saya lakukan supaya motivasi murid saya ini meningkat? terimakasih
					</div>
					<div class="p-jawaban">
						<div class="media">
							<div class="media-left media-middle">
								<div class="user-photo">
									<img src="<?=base_url()?>assets/dashboard/assets/images/reading.png" alt="Photo">
								</div>
								<div class="user-nama">
									Daniel Webber
									<br/>
									14 Sep 2018
								</div>
							</div>
							<div class="media-body">
								<div class="small">Jawaban Terbaru</div>
								Pada dasarnya murid memiliki behavior berbeda per individu, jadi kita bisa membuat analisa untuk individu yang kurang termotivasi. Bisa menggunakan metode ABCD untuk itu. Link detail http://Url.googl.co/eihbvq4
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>


	</div>






</div>	<!--/.main-->
