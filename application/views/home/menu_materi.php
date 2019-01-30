        <script type="text/javascript">
            // SCRIPT UNTUK ADD ACTIVE
            $( document ).ready(function() {
                $("#<?=$active?>").attr("class","active");
                $("#filter").keyup(function() {
                    // Retrieve the input field text and reset the count to zero
                    var filter = $(this).val(),
                    count = 0;

                    // Loop through the comment list
                    $('#results div').each(function() {

                        // If the list item does not contain the text phrase fade it out
                        if ($(this).text().search(new RegExp(filter, "i")) < 0) {
                            $(this).hide();

                        // Show the list item if the phrase matches and increase the count by 1
                    } else {
                        $(this).show();
                        count++;
                    }

                });

                });
            });
            // END SCRIPT UNTUKADD ACTIVE CLASS PADA MENU
        </script>
        <div class="sidemenu-overlay hide animated"></div>
        <header class="pages">
            <nav class="navbar navbar-default nav-front">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="<?=base_url()?>">
                                    <img src="<?=base_url()?>assets/assets/images/logo.png" width="144" height="33" alt="" class="img-responsive">
                                </a>
                            </div>
                            
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse animated">
                                <ul class="nav navbar-nav">
                                    <li class="" id="home"><a href="<?=base_url()?>">Home</a></li>
                                    <!-- <li class="active"><a href="<?=base_url()?>">Home <span class="sr-only">(current)</span></a></li> -->
                                    <li class="dropdown" id="kategori">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            Kategori <span class="bgicon icon-arrow-down"></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <?php foreach ($kategori as $key => $value) { ?>
                                                <li><a href="<?=base_url()?>kategori-mapel/?q=<?=$value->nama?>"><?=$value->nama?></a></li>
                                            <?php } ?>
                                        </ul>
                                    </li>
                                    <li id="materi" class=""><a href="#">Materi</a></li>
                                    <li id="karir" class=""><a href="#">Karir</a></li>
                                    <li id="tentangKami" class=""><a href="#">Tentang Kami</a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <?php
                                    if ($this->session->userdata('loginSession') == array()) { ?>
                                        <li class=""><a href="<?=base_url()?>login"><span class="bgicon icon-lock"></span> Masuk</a></li>
                                        <li class="nav-button"><a href="<?=base_url()?>register"><span class="bgicon icon-user-add"></span> Daftar</a></li>
                                    <?php }else{ if ($this->session->userdata('loginSession')['aktor'] !== 'admin'){
                                        ?>
                                        <li><a href="<?=base_url()?>dashboard-<?=$this->session->userdata('loginSession')['aktor']?>">Dashboard</a></li>
                                        <li><a href="<?=base_url()?>logout"><span class="bgicon icon-unlock"></span> Logout</a></li>
                                    <?php }else{ ?>
                                        <li><a href="<?=base_url()?>logout"><span class="bgicon icon-unlock"></span> Logout</a></li>
                                    <?php } } ?>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div>
                    </div>
                </div><!-- /.container -->
            </nav>
            
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="header-content header-pages">
                            <h1 class="title">Materi</h1>
                            <p class="caption">Temukan materi yang anda butuhkan disini</p>
                            <form class="form-inline header-search">
                                <div class="form-group">
                                    <div class="input-group search-field">
                                        <span class="input-group-addon"><i class="bgicon icon-search"></i></span>
                                        <input type="text" class="form-control" placeholder="Ketik untuk mencari materi">
                                    </div>
                                    <input type="submit" name="searchheader" class="btn btn-green" value="Cari Materi">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            
        </header>
        