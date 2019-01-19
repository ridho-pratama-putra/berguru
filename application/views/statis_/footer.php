	
	<script src="<?=base_url()?>assets/assets/libs/bootstrap.3.3.7/js/bootstrap.js"></script>
	<script src="<?=base_url()?>assets/assets/libs/owl-carousel.2.3.4/owl.carousel.js"></script>
	<script>
		$(document).ready(function(){
		  $(".owl-carousel").owlCarousel({
    			navigation : true, // показывать кнопки next и prev 
 
		      slideSpeed : 300,
		      paginationSpeed : 400,
		 
		      items : 1, 
		      itemsDesktop : false,
		      itemsDesktopSmall : false,
		      itemsTablet: false,
		      itemsMobile : false

    		});
		});
		$(".link-disabled").click(function(e) {
			e.preventDefault();
		});
	</script>
</body>
</html>