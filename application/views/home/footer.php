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
            <div class="col-sm-4 col-md-2">
                <h4 class="footer-title">Tentang Kami</h4>
                <ul class="footer-list-menu">
                    <li><a href="#">Tentang Kami</a></li>
                    <li><a href="#">Karier</a></li>
                    <li><a href="#">Kontak</a></li>
                    <li><a href="#">Materi dari Berguru.com</a></li>
                </ul>
            </div>
            <div class="col-sm-4 col-md-2">
                <h4 class="footer-title">Bantuan</h4>
                <ul class="footer-list-menu">
                    <li><a href="#">Syarat &amp; Ketentuan</a></li>
                    <li><a href="#">Cara memperoleh poin</a></li>
                    <li><a href="#">Iklan</a></li>
                </ul>
            </div>
            <div class="col-sm-12 col-md-4 newsletter-content">
                <h4 class="footer-title">Langganan Berita</h4>
                <p class="newsletter-caption">
                    Langganan berita dari <a href="#">Berguru.com</a> dan kita akan memberikan kabar tentang promo
                </p>
                <form method="POST" action="<?=base_url()?>add-subscriber">
                    <div class="input-group newsletter-form">
                        <input type="text" class="form-control" placeholder="Email anda..." aria-describedby="basic-addon2">
                        <span class="input-group-addon" id="basic-addon2">
                            <input type="submit" name="submitrss" class="btn btn-green" value="Langganan">
                        </span>
                    </div>
                </form>
            </div>
        </div>
        <div class="row footer-copyright">
            <div class="col-sm-12 col-md-4">
                <ul class="list-inline list-social">
                    <li><a href="#"><span class="bgicon icon-twitter"></span></a></li>
                    <li><a href="#"><span class="bgicon icon-facebook"></span></a></li>
                    <li><a href="#"><span class="bgicon icon-google-plus"></span></a></li>
                    <li><a href="#"><span class="bgicon icon-instagram"></span></a></li>
                    <li><a href="#"><span class="bgicon icon-rss"></span></a></li>
                </ul>
            </div>
            <div class="col-sm-6 col-md-4">
                <p>&copy; 2018 Hak Cipta Dilindungi Undang-Undang</p>
            </div>
            <div class="col-sm-6 col-md-4 support-by>
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
        nav: false,
        dots: true,
        responsive:{
            0:{
                items:1
            },
            640:{
                items:2
            }
        }
    });
</script>
<script type="text/javascript">

    var overlay = $(".sidemenu-overlay");
    var sidemenu = $(".navbar-collapse");
    var toggle = $(".navbar-toggle");

    overlay.on("click", function(){
        sidemenu.addClass('slideOutLeft');
        sidemenu.removeClass('slideInLeft');
        $(this).addClass('fadeOut');
        $(this).addClass('hide');
    });

    toggle.on("click", function(){
        sidemenu.css('display', 'block');
        sidemenu.addClass('slideInLeft');
        sidemenu.removeClass('slideOutLeft');
        overlay.removeClass('hide');
        overlay.removeClass('fadeOut');
    });

    $(".link-disabled").click(function(e) {
        e.preventDefault();
    });

</script>

</body>
</html>