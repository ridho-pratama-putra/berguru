<header class="home">
            <nav class="navbar navbar-default nav-front">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- Brand and toggle get grouped for better mobile display -->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand" href="#">
                                    <img src="<?=base_url()?>assets/assets/images/logo.png" width="144" height="33" alt="" class="img-responsive">
                                </a>
                            </div>
                            
                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li class="" id="homeActive"><a href="<?=base_url()?>">Home</a></li>
                                    <!-- <li class="active"><a href="<?=base_url()?>">Home <span class="sr-only">(current)</span></a></li> -->
                                    <li class="dropdown" id="kategoriActive">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                            Kategori <span class="bgicon bgicon-arrow-down-white"></span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <?php foreach ($kategori as $key => $value) { ?>
                                            <li><a href="#"><?=$value->nama?></a></li>
                                            <?php } ?>
                                        </ul>
                                    </li>
                                    <li id="materiActive" class=""><a href="#">Materi</a></li>
                                    <li id="karirActive" class=""><a href="#">Karir</a></li>
                                    <li id="tentangKamiActive" class=""><a href="#">Tentang Kami</a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <?php
                                    if ($this->session->userdata('loginSession') == array()) { ?>
                                    <li><a href="<?=base_url()?>login"><span class="bgicon bgicon-lock"></span> Masuk</a></li>
                                    <li class="nav-button"><a href="<?=base_url()?>register"><span class="bgicon bgicon-add-person"></span> Daftar</a></li>
                                    <?php }else{ ?>
                                        <li><a href="<?=base_url()?>dashboard-<?=$this->session->userdata('loginSession')['aktor']?>">Dashboard</a></li>
                                        <li><a href="<?=base_url()?>logout"><span class="bgicon bgicon-lock"></span> Logout</a></li>
                                    <?php } ?>
                                </ul>
                            </div><!-- /.navbar-collapse -->
                        </div>
                    </div>
                </div><!-- /.container -->
            </nav>
            
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="header-content">
                            <h1 class="title">Anda Guru? Temukan jawaban untuk pertanyaan anda</h1>
                            <form class="form-inline header-search">
                                <div class="form-group">
                                    <div class="input-group search-field">
                                        <span class="input-group-addon"><i class="bgicon bgicon-search"></i></span>
                                        <input type="text" class="form-control" placeholder="Apa pertanyaan anda?">
                                        <span class="input-group-addon select-category">
                                            <select>
                                                <option value="">Kategori</option>
                                                <option value="1">Solved</option>
                                                <option value="2">Unsolved</option>
                                            </select>
                                        </span>
                                    </div>
                                    <input type="submit" name="searchheader" class="btn btn-green" value="Cari Sekarang">
                                </div>
                            </form>
                            <p class="caption">Anda Mahasiswa? Berikan solusi untuk Guru. <a href="<?=base_url()?>register">Daftar Sekarang!</a></p>
                        </div>
                    </div>
                </div>
            </div>
            
        </header>