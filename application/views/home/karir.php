 <div class="content-front content-pages content-materi">

    <section class="post-content">
        <div class="container">
            <div class="row ask-header">
                <div class="col-sm-6 col-md-8">
                    <p class="ask-count">Lowongan Terbaru</p>
                </div>
                <div class="col-sm-6 col-md-4 materi-dropdown">
                    <ul class="list-inline">
                        <li>
                            <select class="form-control dropdown-item" id="select-karir" onchange="karir()">
                                <option value="semua">Semua lowongan</option>
                                <option value="tahun">Tahun ini</option>
                                <option value="bulan">Bulan ini</option>
                                <option value="hari">Hari ini</option>
                            </select>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row ask-list">
                <div class="col-md-12">

                    <!-- Item Karir -->
                    <div id="item-karir"></div>

                </div>
            </div>

        </div>
    </section>
</div>

<script type="text/javascript">
    $( document ).ready(function() {
        karir()
    });
    function karir() {
        jangka_waktu = $("#select-karir").val();
        console.log(jangka_waktu)
        $.get(
            "<?=base_url()?>get-karir",
            {
                jangka_waktu:jangka_waktu
            },
            function( res ) {
                res = JSON.parse(res)
                elementToRender = ''
                $('#item-karir').html(elementToRender);
                if (res.data.length === 0) {
                    elementToRender += 
                    '<h6 class="title text-center"> Data lowongan masih kosong untuk kategori yang anda pilih</h6>'
                }else{
                    for (var i = 0; i < res.data.length; i++) {
                        elementToRender += 
                        '<div class="panel panel-default panel-ask panel-karir">'+
                        '<div class="panel-body">'+
                        '<div class="row panel-ask-account">'+
                        '<div class="col-sm-6">'+
                        '<div class="media">'+
                        '<div class="media-body materi-content">'+
                        '<h4 class="media-heading">'+res.data[i].nama+'</h4>'+
                        '<p class="location">'+res.data[i].instansi+'</p>'+
                        '</div>'+
                        '</div>'+
                        '</div>'+
                        '<div class="col-sm-6 ask-data-list">'+
                        '<p class="address"><i class="bgicon icon-map-marker"></i> '+res.data[i].lokasi+'</p>'+
                        '<a href="tel:'+res.data[i].kontak+'" class="btn btn-transparent-green btn-download"><i class="bgicon icon-phone"></i>Hubungi</a>'+
                        '</div>'+
                        '</div>'+
                        '</div>    '+
                        '</div>'
                    }
                    elementToRender +=
                    '<div class="load-more">'+
                    '<div class="load-line"></div>'+
                    '<div class="load-btn">'+
                    '<a href="#" class="btn btn-transparent-blue">Muat Lebih Banyak</a>'+
                    '</div>'+
                    '</div>'
                }
                $('#item-karir').html(elementToRender);
            });
    }
</script>