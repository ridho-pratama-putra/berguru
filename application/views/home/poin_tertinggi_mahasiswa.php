<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/assets/css/style-point.css">
<link rel="stylesheet" href="<?=base_url()?>assets/assets/icon-doc/css/fontello-codes.css">
<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/assets/css/frontpage.css">
<!-- start table -->
<div class="tabel">
    <div class="container">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#harian" aria-controls="home" role="tab" data-toggle="tab">Harian</a></li>
            <li role="presentation"><a href="#mingguan" aria-controls="profile" role="tab" data-toggle="tab">Mingguan</a></li>
            <li role="presentation"><a href="#bulanan" aria-controls="messages" role="tab" data-toggle="tab">Bulanan</a>
            </li>
            <!-- <label><input type="search" class="searchkey" placeholder="Cari Mahasiswa" aria-controls="example"></label> -->
        </ul>

        <div class="table-responsive">
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane fade in active" id="harian">
                    <table class="table table-borderless" id="daily">
                        <thead>
                            <tr>
                                <th scope="col">Peringkat</th>
                                <th scope="col" class="stud">Mahasiswa</th>
                                <th scope="col" class="medal hidden-xs">Medals
                                </th>
                                <th scope="col" class="medal">
                                    <span href="" class="icon-star"></span>
                                </th>
                                <th scope="col" class="medal">
                                    <span href="" class="icon-trophy"></span>
                                </th>
                                <th scope="col" class="medal">
                                    <span href="" class="icon-material-diamond"></span>
                                </th>
                                <th scope="col">Points</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 1;
                            foreach ($ranking_harian as $key => $value) { ?>
                                <tr>
                                    <th scope="row"><?=$i?></th>
                                    <td class="table-user"><img src="assets/images/icons/gal6.jpg" alt=""><?=$value->nama?></td>
                                    <td class="hidden-xs"></td>
                                    <td class="star-inner">3</td>
                                    <td class="trophy-inner" class="trophy-inner">40</td>
                                    <td class="diamond-inner">12</td>
                                    <td><?=$value->poin?></td>
                                </tr>
                                
                                <?php 
                                $i++; 
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="mingguan">
                    <table class="table table-borderless" id="weekly">
                        <thead>
                            <tr>
                                <th scope="col">Peringkat</th>
                                <th scope="col" class="stud">Mahasiswa</th>
                                <th scope="col" class="medal hidden-xs">Medals
                                </th>
                                <th scope="col" class="medal">
                                    <span href="" class="icon-star"></span>
                                </th>
                                <th scope="col" class="medal">
                                    <span href="" class="icon-trophy"></span>
                                </th>
                                <th scope="col" class="medal">
                                    <span href="" class="icon-material-diamond"></span>
                                </th>
                                <th scope="col">Points</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 1;
                            foreach ($ranking_mingguan as $key => $value) { ?>
                                <tr>
                                    <th scope="row"><?=$i?></th>
                                    <td class="table-user"><img src="assets/images/icons/gal6.jpg" alt=""><?=$value->nama?></td>
                                    <td class="hidden-xs"></td>
                                    <td class="star-inner">3</td>
                                    <td class="trophy-inner" class="trophy-inner">40</td>
                                    <td class="diamond-inner">12</td>
                                    <td><?=$value->poin?></td>
                                </tr>

                                <?php 
                                $i++; 
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
                <div role="tabpanel" class="tab-pane fade" id="bulanan">
                    <table class="table table-borderless" id="monthly">
                        <thead>
                            <tr>
                                <th scope="col">Peringkat</th>
                                <th scope="col" class="stud">Mahasiswa</th>
                                <th scope="col" class="medal hidden-xs">Medals
                                </th>
                                <th scope="col" class="medal">
                                    <span href="" class="icon-star"></span>
                                </th>
                                <th scope="col" class="medal">
                                    <span href="" class="icon-trophy"></span>
                                </th>
                                <th scope="col" class="medal">
                                    <span href="" class="icon-material-diamond"></span>
                                </th>
                                <th scope="col">Points</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 1;
                            foreach ($ranking_bulanan as $key => $value) { ?>
                                <tr>
                                    <th scope="row"><?=$i?></th>
                                    <td class="table-user"><img src="assets/images/icons/gal6.jpg" alt=""><?=$value->nama?></td>
                                    <td class="hidden-xs"></td>
                                    <td class="star-inner">3</td>
                                    <td class="trophy-inner" class="trophy-inner">40</td>
                                    <td class="diamond-inner">12</td>
                                    <td><?=$value->poin?></td>
                                </tr>
                                
                                <?php 
                                $i++; 
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- end table -->
<script>
    $(document).ready(function() {
        $('#daily').DataTable({
                // "paging": false,
                "ordering": false,
                "lengthChange": false,
                // "info": false
            });
        $('#weekly').DataTable({
                // "paging": false,
                "ordering": false,
                "lengthChange": false,
                // "info": false
            });
        $('#monthly').DataTable({
                // "paging": false,
                "ordering": false,
                "lengthChange": false,
                // "info": false
            });
    });
</script>

<script src="<?=base_url()?>assets/assets/libs/bootstrap.3.3.7/js/jquery.dataTables.min.js"></script>