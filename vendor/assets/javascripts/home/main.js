$(document).ready(function() {
 
//==================== Prettyphoto ========================//

$("a[class^='prettyPhoto']").prettyPhoto({theme:'pp_default'});

//==================== hoverzoom ========================//

$('.item').hover(function(){
    $(this).find('img').stop().fadeTo('slow',0.4);
}, 
function(){
    $(this).find('img').stop().fadeTo('slow',1);
});

//==================== Slider js ========================//

$('#main-slider').flexslider({
	animation: "fade"
});


//==================== Carousel js ========================//

$('.slidewrap').carousel({
	slider: '.slider',
	slide: '.slide',
	slideHed: '.slidehed',
	nextSlide : '.next',
	prevSlide : '.prev',
	addPagination: false,
	addNav : false
});


$('.slidewrap2').carousel({
	slider: '.slider2',
	slide: '.slide2',
	slideHed: '.slidehed',
	nextSlide : '.next2',
	prevSlide : '.prev2',
	addPagination: false,
	addNav : false
});

//==================== Accordion js ========================//

(function(e,t,n){"use strict";e.fn.foundationAccordion=function(t){var n=e(".accordion");n.hasClass("hover")&&!Modernizr.touch?e(".accordion li",this).on({mouseenter:function(){var t=e(this).parent(),n=e(this).children(".content").first();e(".content",t).not(n).hide().parent("li").removeClass("active"),n.show(0,function(){n.parent("li").addClass("active")})}}):e(".accordion li",this).on("click.fndtn",function(){var t=e(this),n=e(this).parent(),r=e(this).children(".content").first();t.hasClass("active")?n.find("li").removeClass("active").end().find(".content").hide():(e(".content",n).not(r).hide().parent("li").removeClass("active"),r.show(0,function(){r.parent("li").addClass("active")}))})}})(jQuery,this);


});

