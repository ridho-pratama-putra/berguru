<!DOCTYPE html>
<html lang="id">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?=$title?> - Berguru.com</title>
	<link href="<?=base_url()?>assets/dashboard/assets/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/assets/icon-doc/css/fontello.css">
	<!-- Icon -->
    <link rel="shortcut icon" href="<?=base_url()?>assets/assets/images/title-logo.ico">
    <link rel="icon" sizes="128x128" href="<?=base_url()?>assets/assets/images/title-logo.ico">
    <link rel="apple-touch-icon" sizes="128x128" href="<?=base_url()?>assets/assets/images/title-logo.ico">
	
	<!-- admin -->
	<?php
	if ($this->session->userdata('loginSession')['aktor'] == 'admin') { ?>
	<link href="<?=base_url()?>assets/dashboard/assets/css/font-awesome.min.css" rel="stylesheet">
	<?php		
	}else{
	?>
	<!-- other -->
	<link rel="stylesheet" href="<?=base_url()?>assets/dashboard/assets/libs/fontawesome-free-5.3.1-web/css/all.min.css">
	<?php		
	}
	?>
	
	<link href="<?=base_url()?>assets/dashboard/assets/css/datepicker3.css" rel="stylesheet">
	<link rel="stylesheet" href="<?=base_url()?>assets/dashboard/assets/libs/datatables/datatables.min.css">
	<link rel="stylesheet" href="<?=base_url()?>assets/dashboard/assets/libs/malihu-scroll/jquery.mCustomScrollbar.min.css">
	
	<link rel="stylesheet" href="<?=base_url()?>assets/dashboard/assets/libs/raty/jquery.raty.css">

	<link href="<?=base_url()?>assets/dashboard/assets/css/styles.css" rel="stylesheet">
	
	<!--Custom Font-->
	<link href="<?=base_url()?>assets/dashboard/assets/fonts/font-stylesheet.css" rel="stylesheet">
	
	<!-- berguru css -->
	<link href="<?=base_url()?>assets/dashboard/assets/css/berguru-stylesheet.css" rel="stylesheet">
	
	<script src="<?=base_url()?>assets/assets/libs/jquery.3.3.1/jquery-3.3.1.js"></script>
	<!-- <script src="<?=base_url()?>assets/dashboard/assets/js/jquery-1.11.1.min.js"></script> -->
	<script src="<?=base_url()?>assets/dashboard/assets/libs/datatables/datatables.min.js" charset="utf-8"></script>
	<script src="<?=base_url()?>assets/dashboard/assets/libs/malihu-scroll/jquery.mCustomScrollbar.js"></script>
	<script src="<?=base_url()?>assets/dashboard/assets/libs/raty/jquery.raty.js" charset="utf-8"></script>

	<!-- <link href="<?=base_url()?>assets/assets/libs/Select2-4.0.6-rc.1/css/select2.min.css" rel="stylesheet"> -->
	<!-- <script src="<?=base_url()?>assets/assets/libs/Select2-4.0.6-rc.1/js/select2.min.js" charset="utf-8"></script> -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

	<!-- owlcarousel -->
	<link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/assets/libs/owl-carousel.2.3.4/assets/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="<?=base_url()?>assets/assets/libs/owl-carousel.2.3.4/assets/owl.theme.default.css">
	
	<script type="text/javascript">
		$(function () {
			$('[data-toggle="tooltip"]').tooltip()
		})
	</script>
</head>
<body>
