<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/assets/css/frontpage-custom.css">

<div class="content-front content-pages">

    <section class="post-content">
        <div class="container container-lg mb-90">
            <div class="row">
                <div class="col-xs-12">
                    <div class="iklan-advantage__header">
                        <h1 class="title">Apa keuntungan beriklan menggunakan <br> berguru?</h1>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="iklan-advantage">

                    <div class="col-md-3">
                        <div class="iklan-advantage__card">
                            <div class="panel-default iklan-advantage__card-panel ">
                                <div class="panel-body">
                                    <img src="<?=base_url()?>assets/assets/images/icons/like-5.png" width="50" height="62" alt="Registrasi Mudah" class="jgicon">
                                    <p class="iklan-advantage__card-panel--desc">Mudah</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="iklan-advantage__card">
                            <div class="panel-default iklan-advantage__card-panel ">
                                <div class="panel-body">
                                    <img src="<?=base_url()?>assets/assets/images/icons/newspaper.png" width="51" height="50" alt="Registrasi Mudah" class="jgicon">
                                    <p class="iklan-advantage__card-panel--desc">Iklan Tertarget</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="iklan-advantage__card">
                            <div class="panel-default iklan-advantage__card-panel ">
                                <div class="panel-body">
                                    <img src="<?=base_url()?>assets/assets/images/icons/padlock-1.png" width="58" height="53" alt="Registrasi Mudah" class="jgicon">
                                    <p class="iklan-advantage__card-panel--desc">Privasi Terjaga</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="iklan-advantage__card">
                            <div class="panel-default iklan-advantage__card-panel ">
                                <div class="panel-body">
                                    <img src="<?=base_url()?>assets/assets/images/icons/percentage.png" width="60" height="52" alt="Registrasi Mudah" class="jgicon">
                                    <p class="iklan-advantage__card-panel--desc">Garansi</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="container container-lg mb-90">
            <div class="row">
                <div class="col-md-12">
                    <div class="media iklan-media">
                        <div class="media-left media-middle iklan-media-left">
                            <h4 class="media-heading iklan-media__title">Bagaimana Caranya Mendaftar?</h4>
                            <p class="iklan-media__desc">Saya mengalami kesulitan dalam menyampaikan mata pelajaran biologi karena murid saya kurang antusias
                            </p>
                            <a href="https://wa.me/6281231241?text=Halo%20berguru.com%20saya%20ingin%20beriklan%20" class="btn btn-green iklan-media__link"><img src="<?=base_url()?>assets/assets/images/icons/whatsapp.svg" alt="Wa" class="iklan-media__icon"> <span class="iklan-media__phone">+6281 231 241</span> </a>
                        </div>
                        <div class="media-body iklan-media-body">
                            <img class="media-object pull-right iklan-media__img " src="<?=base_url()?>assets/assets/images/thumbnails/iklan.jpg" alt="iklan-photo">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container container-lg mb-60">
            <div class="row">
                <div class="col-xs-12">
                    <div class="iklan-testimoni__header">
                        <h1 class="title">Cerita Mereka</h1>
                    </div>
                </div>
            </div>

            <div class="row">
                <?php
                foreach ($testimonial as $key => $value) { 
                    ?>
                    <div class="col-md-4">
                        <div class="iklan-testimoni__card">
                            <div class="panel-default iklan-testimoni__card-panel ">
                                <div class="panel-body">
                                    <p class="iklan-testimoni__desc"><?=$value->teks?></p>
                                    <div class="media">
                                        <div class="media-left media-middle">
                                            <img src="<?=base_url().$value->foto?>" class="media-object iklan-testimoni__img" >
                                        </div>
                                        <div class="media-body media-middle">
                                            <h4 class="media-heading iklan-testimoni__title"><?=$value->nama?></h4>
                                            <p class="iklan-testimoni__job"><?=$value->institusi_or_universitas?></p>
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