<footer class="content-footer">
            <div class="container">
                <div class="row footer-menu">
                    <div class="col-lg-4">
                        <div class="footer-img">
                            <img src="<?=base_url()?>assets/assets/images/footer-logo.png" width="144" height="33" alt="Logo" class="img-responsive">
                        </div>
                        <div class="footer-address">
                            <h4 class="footer-title">Kantor Pusat</h4>
                            <p>
                                Universitas Negeri Malang
                                <br>
                                Jl. Semarang 5 Malang 65145
                                <br>
                                Telp. (0341) 551312
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <h4 class="footer-title">Tentang Kami</h4>
                        <ul class="footer-list-menu">
                            <li><a href="#">Tentang Kami</a></li>
                            <li><a href="#">Karier</a></li>
                            <li><a href="#">Kontak</a></li>
                            <li><a href="#">Materi dari Berguru.com</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-2">
                        <h4 class="footer-title">Bantuan</h4>
                        <ul class="footer-list-menu">
                            <li><a href="#">Syarat &amp; Ketentuan</a></li>
                            <li><a href="#">Cara memperoleh poin</a></li>
                            <li><a href="#">Iklan</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-4 newsletter-content">
                        <h4 class="footer-title">Langganan Berita</h4>
                        <p class="newsletter-caption">
                            Langganan berita dari <a href="#">Berguru.com</a> dan kita akan memberikan kabar tentang promo
                        </p>
                        <div class="input-group newsletter-form">
                            <input type="text" class="form-control" placeholder="Email anda..." aria-describedby="basic-addon2">
                            <span class="input-group-addon" id="basic-addon2">
                                <input type="submit" name="submitrss" class="btn btn-green" value="Langganan">
                            </span>
                        </div>
                    </div>
                </div>
                <div class="row footer-copyright">
                    <div class="col-lg-4">
                        <ul class="list-inline">
                            <li><a href="#"><span class="bgicon bgicon-twitter"></span></a></li>
                            <li><a href="#"><span class="bgicon bgicon-facebook"></span></a></li>
                            <li><a href="#"><span class="bgicon bgicon-google-plus"></span></a></li>
                            <li><a href="#"><span class="bgicon bgicon-instagram"></span></a></li>
                            <li><a href="#"><span class="bgicon bgicon-rss"></span></a></li>
                        </ul>
                    </div>
                    <div class="col-lg-4">
                        <p>&copy; 2018 Hak Cipta Dilindungi Undang-Undang</p>
                    </div>
                    <div class="col-lg-4 support-by">
                        <p>Didukung oleh</p>
                        <img src="<?=base_url()?>assets/assets/images/logo-um.png" width="36" height="36" alt="Logo UM" class="footer-support">
                        <img src="<?=base_url()?>assets/assets/images/logo-um-flat.png" width="42" height="33" alt="Logo UM" class="footer-support">
                    </div>
                </div>
            </div>
        </footer>
        
        <!-- Javascript -->
        <script type="text/javascript" src="<?=base_url()?>assets/assets/libs/bootstrap.3.3.7/js/bootstrap.js"></script>
        <script type="text/javascript" src="<?=base_url()?>assets/assets/libs/owl-carousel.2.3.4/owl.carousel.js"></script>
        <script type="text/javascript">
            $('.testi-carousel').owlCarousel({
                loop: true,
                margin: 40,
                nav: true,
                responsive:{
                    0:{
                        items:1
                    },
                    600:{
                        items:2
                    }
                }
            });
        </script>
        
    </body>
</html>