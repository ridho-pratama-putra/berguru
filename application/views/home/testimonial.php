<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/assets/css/frontpage-custom.css">
<div class="content-front content-pages">
    <section class="post-content">
        <div class="container container-lg">
            <div class="row">
                <?php
                if ($testimonial !== array()) {

                    foreach ($testimonial as $key => $value) { ?>
                        <div class="col-md-4">
                            <div class="testi">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="testi__item">
                                            <img src="<?=base_url().$value->foto?>" alt="avatar" class="testi__avatar">
                                            <p class="testi__title"><?=$value->nama?></p>
                                            <p class="testi__subtitle">Comedian - HBO</p>
                                            <div class="testi-desc">
                                                <p class="testi-desc__text"><?=$value->teks?></p>
                                                <div class="icon-style">
                                                    <span class="icon-star icon--yellow"></span>
                                                    <span class="icon-star icon--yellow"></span>
                                                    <span class="icon-star icon--yellow"></span>
                                                    <span class="icon-star icon--yellow"></span>
                                                    <span class="icon-star-empty icon--yellow"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php 
                    }
                }else{ 
                    ?>
                    <div class="col-sm-12">
                        <div class="testi">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="testi__item">
                                        <div class="testi-desc">
                                            <p class="testi-desc__text">Belum ada cerita dari pengguna</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <?php
                }

                ?>
            </div>
        </div>
    </section>
</div>