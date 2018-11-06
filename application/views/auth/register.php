	<div class="login-layout">
		<div class="left-side-wrap">
			<div class="logo-header">
				<a href="<?=base_url()?>"><img src="<?=base_url()?>assets_/images/group-9.png" alt=""></a>
			</div>
			<div class="login-bg">
				<img src="<?=base_url()?>assets_/images/bitmap.png" alt="" style="width: 90%;">
			</div>
			<div class="front-slider">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
					    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					    <li data-target="#myCarousel" data-slide-to="1"></li>
					    <li data-target="#myCarousel" data-slide-to="2"></li>
					  </ol>

					  <!-- Wrapper for slides -->
					  <div class="carousel-inner">
					    <div class="item active">
					     	<p class="quote">
					     		“Berguru.com sangat membantu saya dalam mengembangkan penelitian studi di Sekolah Dasar, Volunteer Mahasiswa dengan sabar membantu saya dan selalu konsisten!”
					     	</p>
					     	<h6 class="author">
					     		Jean Morgan
					     	</h6>
					     	<p class="author-pos">
					     		Pakar Analis di Network Council
					     	</p>
					    </div>

					    <div class="item">
					      	<p class="quote">
					     		“Berguru.com sangat membantu saya dalam mengembangkan penelitian studi di Sekolah Dasar, Volunteer Mahasiswa dengan sabar membantu saya dan selalu konsisten!”
					     	</p>
					     	<h6 class="author">
					     		Jean Morgan
					     	</h6>
					     	<p class="author-pos">
					     		Pakar Analis di Network Council
					     	</p>
					    </div>

					    <div class="item">
					      	<p class="quote">
					     		“Berguru.com sangat membantu saya dalam mengembangkan penelitian studi di Sekolah Dasar, Volunteer Mahasiswa dengan sabar membantu saya dan selalu konsisten!”
					     	</p>
					     	<h6 class="author">
					     		Jean Morgan
					     	</h6>
					     	<p class="author-pos">
					     		Pakar Analis di Network Council
					     	</p>
					    </div>
					  </div>

					  <!-- Left and right controls -->
					</div>
				</div>
		</div>
		<div class="right-side-wrap">
			<div class="row">
				<div class="col-md-12">
					<div class="have-account pull-right">
						<span>Sudah Mempunyai Akun?</span>
						<a href="<?=base_url()?>login"><span class="fa fa-lock" aria-hidden="true"></span>  Masuk</a>
					</div>				
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="login-box register-box">
						<?=$this->session->flashdata("register");?>

						<h2>Daftar <span>Berguru.com</span> <br>
							Berdiskusi Menjadi Mudah</h2>
						<p class="mb-30">Gratis tanpa dipungut Biaya Selamanya</p>
						<form action="<?=base_url()?>register" method="POST">
							<div class="form-group">
							    <label for="email">Email Utama</label>
							    <input type="email" class="form-control" id="email" placeholder="Masukkan Email anda" name="email" value="<?php echo set_value('email'); ?>" required="">
						  	</div>
						  	<div class="form-group">
							    <label for="nama">Nama Lengkap</label>
							    <input type="text" class="form-control" id="nama" placeholder="Masukkan nama anda" name="nama" value="<?php echo set_value('nama'); ?>" required="">
						  	</div>
						  	<div class="form-group mb-10">
							    <label for="password">Password</label>
							    <input type="password" class="form-control" id="password" placeholder="Masukkan password baru" name="password" required="">
						  	</div>
						  	<div class="form-group mb-30 clearfix">
						  		<span class="pull-left">
						  			<input type="checkbox" required=""> Saya setuju dengan Peraturan & Privasi Berguru.com
						  		</span>
						  	</div>
				  			<button type="submit" class="form-control btn btn-login">Simpan & Lanjut Pilih Profesi</button>
						</form>
					</div>
				</div>
			</div>

			<footer>
				<div class="row">
					<div class="col-xs-12 col-md-4">
						<ul> 
							<li>
								<a href=""><i class="fab fa-twitter"></i></a>
							</li>
							<li>
								<a href=""><i class="fab fa-facebook"></i></a>
							</li>
							<li>
								<a href=""><i class="fab fa-google-plus-g"></i></a>
							</li>
							<li>
								<a href=""><i class="fab fa-instagram"></i></a>
							</li>
							<li>
								<a href=""><i class="fas fa-rss"></i></a>
							</li>
						</ul>
					</div>
					<div class="col-xs-12 col-md-8">
						<p>© 2018 Hak Cipta Dilindungi Undang-Undang</p>
					</div>
				</div>
			</footer>
		</div>
	</div>
