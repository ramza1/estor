// JavaScript Document

$(window).load(function(){

	// Flexslider index banner
	$('#mainslider').flexslider({
        animation: "slide",		
        start: function(slider){
          $('body').removeClass('loading');
        }
   });
	// Flexslider Category banner  
	$('#catergoryslider').flexslider({
        animation: "slide",		
        start: function(slider){
          $('body').removeClass('loading');
        }
    });
	 
	 // Flexslider Brand    
	$('#brand').flexslider({
        animation: "fade",		
        start: function(slider){
          $('body').removeClass('loading');
        }
      });
	  
	// Flexslider Blog   
	$('#blogslider').flexslider({
        animation: "fade",		
        start: function(slider){
          $('body').removeClass('loading');
    }
      });

})


// Dropdown on Mouseover
$('document').ready(function(){
	
	$('.dropdown').hover(
		function(){
			$(this).addClass('open')
			
		},
		function(){			
			$(this).removeClass('open')
		}
		);
		
	// Product Thumb
	$('.mainimage li #wrap').hide()
	$('.mainimage li #wrap').eq(0).fadeIn()
	$('ul.mainimage li.producthtumb').click(function(){
		var thumbindex = $(this).index()		
		$('.mainimage li #wrap').fadeOut(0)
		$('.mainimage li #wrap').eq(thumbindex).fadeIn()
		 $('.cloud-zoom, .cloud-zoom-gallery').CloudZoom();
	})
			
	// List & Grid View
	$('#list').click(function()
	{	$(this).addClass ('btn-success').children('i').addClass('icon-white')
		$('.grid').fadeOut()
		$('.list').fadeIn()
		$('#grid').removeClass ('btn-success').children('i').removeClass('icon-white')
	});
	$('#grid').click(function()
	{	$(this).addClass ('btn-success').children('i').addClass('icon-white')
		$('.list').fadeOut()
		$('.grid').fadeIn()
		$('#list').removeClass ('btn-success').children('i').removeClass('icon-white')
	});
			// Prdouctpagetab
				$('#myTab a:first').tab('show')
		$('#myTab a').click(function (e) {
		e.preventDefault();
		$(this).tab('show');
		
				
	})
	
// Checkout


$('.checkoutsteptitle').addClass('down').next('.checkoutstep').fadeIn()
	$('.checkoutsteptitle').on('click', function(){
        $("select, input:checkbox, input:radio, input:file").css('display', 'blcok');
		$(this).toggleClass('down').next('.checkoutstep').slideToggle()
    });

		
		// alert close
	
	$('.clostalert').click(function()
	{
				
	$(this).parent('.alert').fadeOut ()
	});	
	});
	
	
// Category Menu mobile
 $("<select />").appendTo("nav.subnav");
      
      // Create default option "Go to..."
      $("<option />", {
         "selected": "selected",
         "value"   : "",
         "text"    : "Go to..."
      }).appendTo("nav.subnav select");
      
      // Populate dropdown with menu items
      $("nav.subnav a").each(function() {
       var el = $(this);
       $("<option />", {
           "value"   : el.attr("href"),
           "text"    : el.text()
       }).appendTo("nav.subnav select");
      });
      
	   // To make dropdown actually work
	   // To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
      $("nav.subnav select").change(function() {
        window.location = $(this).find("option:selected").val();
      });



$(window).scroll(function () {
		if ($(this).scrollTop() > 50) {
			$('#gotop').fadeIn(500);
		} else {
			$('#gotop').fadeOut(500);
		}
	});
			
	
	$('#gotop').click(function(){
		$('html, body').animate({scrollTop:0}, 2200);
	});  



	  