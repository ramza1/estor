$(document).ready(function(){$("a[class^='prettyPhoto']").prettyPhoto({theme:"pp_default"}),$(".item").hover(function(){$(this).find("img").stop().fadeTo("slow",.4)},function(){$(this).find("img").stop().fadeTo("slow",1)}),$("#main-slider").flexslider({animation:"fade"}),$(".slidewrap").carousel({slider:".slider",slide:".slide",slideHed:".slidehed",nextSlide:".next",prevSlide:".prev",addPagination:!1,addNav:!1}),$(".slidewrap2").carousel({slider:".slider2",slide:".slide2",slideHed:".slidehed",nextSlide:".next2",prevSlide:".prev2",addPagination:!1,addNav:!1}),function(e){"use strict";e.fn.foundationAccordion=function(){var i=e(".accordion");i.hasClass("hover")&&!Modernizr.touch?e(".accordion li",this).on({mouseenter:function(){var i=e(this).parent(),t=e(this).children(".content").first();e(".content",i).not(t).hide().parent("li").removeClass("active"),t.show(0,function(){t.parent("li").addClass("active")})}}):e(".accordion li",this).on("click.fndtn",function(){var i=e(this),t=e(this).parent(),n=e(this).children(".content").first();i.hasClass("active")?t.find("li").removeClass("active").end().find(".content").hide():(e(".content",t).not(n).hide().parent("li").removeClass("active"),n.show(0,function(){n.parent("li").addClass("active")}))})}}(jQuery,this)});