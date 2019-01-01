<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?=$title?> - Berguru.com</title>
	<link href="<?=base_url()?>assets/dashboard/assets/css/bootstrap.min.css" rel="stylesheet">
	
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
	<!--[if lt IE 9]>
	<script src="js/html5shiv.js"></script>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<!-- berguru css -->
	<link href="<?=base_url()?>assets/dashboard/assets/css/berguru-stylesheet.css" rel="stylesheet">
	
	<!-- <script src="<?=base_url()?>assets/assets/libs/jquery3.3.1/jquery-3.3.1.js"></script> -->
	<script src="<?=base_url()?>assets/dashboard/assets/js/jquery-1.11.1.min.js"></script>
	<script src="<?=base_url()?>assets/dashboard/assets/libs/datatables/datatables.min.js" charset="utf-8"></script>
	<script src="<?=base_url()?>assets/dashboard/assets/libs/malihu-scroll/jquery.mCustomScrollbar.js"></script>
	<script src="<?=base_url()?>assets/dashboard/assets/libs/raty/jquery.raty.js" charset="utf-8"></script>

	<!-- list -->
	<script src="<?=base_url()?>assets/assets/libs/list/list.min.js" charset="utf-8"></script>

	<link href="<?=base_url()?>assets/assets/libs/Select2-4.0.6-rc.1/css/select2.min.css" rel="stylesheet">
	<script src="<?=base_url()?>assets/assets/libs/Select2-4.0.6-rc.1/js/select2.min.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function () {
		$('[data-toggle="tooltip"]').tooltip()
	})
</script>
</head>
<body>
