	<div class="login-layout">
		<div class="left-side-wrap">
			<div class="logo-header">
				<a href="<?=base_url()?>"><img src="<?=base_url()?>assets/assets/images/group-9.png" alt=""></a>
			</div>
			<div class="login-bg">
				<img src="<?=base_url()?>assets/assets/images/thumbnails/testimoni.png" alt="" style="width: 90%;">
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
						<span>Belum punya akun?</span>
						<a href="<?=base_url()?>register"><span class="fa fa-user" aria-hidden="true"></span>  Daftar</a>
					</div>				
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="login-box">
						<?=$this->session->flashdata("login")?>

						<h2>Selamat Datang</h2>
						<p class="mb-30">Masuk dan mulai terhubung dengan tenaga terbaik</p>
						<form action="<?=base_url()?>login" method="POST">
							<div class="form-group">
							    <label for="email">Email</label>
							    <input type="email" class="form-control" id="email" placeholder="Masukkan Email" name="email" autofocus="">
						  	</div>
						  	<div class="form-group mb-10">
							    <label for="password">Password</label>
							    <input type="password" class="form-control" id="password" placeholder="Masukkan Password" name="password">
						  	</div>
						  	<div class="form-group mb-30 clearfix">
						  		<span class="pull-left">
						  			<input type="checkbox" name="remember"> Ingat saya
						  		</span>
						  		<span class="pull-right">
						  			<a href=""><img src="<?=base_url()?>assets/assets/images/icons/question.png"" alt=""> Forgotten Password</a>
						  		</span>
						  	</div>
				  			<button type="submit" class="form-control btn btn-login">Masuk ke Berguru.com</button>
						</form>
					</div>
				</div>
			</div>

			<footer>
				<div class="row">
					<div class="col-md-5">
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
					<div class="col-md-7">
						<p>© 2018 Hak Cipta Dilindungi Undang-Undang</p>
					</div>
				</div>
			</footer>
		</div>
	</div>

<script src="<?=base_url()?>assets/assets/libs/owl-carousel.2.3.4/owl.carousel.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
	  $(".owl-carousel").owlCarousel({
			navigation : true, // показывать кнопки next и prev 

	      slideSpeed : 300,
	      paginationSpeed : 400,
	 
	      items : 1, 
	      itemsDesktop : false,
	      itemsDesktopSmall : false,
	      itemsTablet: false,
	      itemsMobile : false

		});
	});
</script>