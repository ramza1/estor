if($(window).width()>1024){!function(e){function t(){n=!1;for(var t=0;t<a.length;t++){var r=e(a[t]).filter(function(){return e(this).is(":appeared")});if(r.trigger("appear",[r]),i){var o=i.not(r);o.trigger("disappear",[o])}i=r}}var i,a=[],r=!1,n=!1,o={interval:250,force_process:!1},s=e(window);e.expr[":"].appeared=function(t){var i=e(t);if(!i.is(":visible"))return!1;var a=s.scrollLeft(),r=s.scrollTop(),n=i.offset(),o=n.left,c=n.top;return c+i.height()>=r&&c-(i.data("appear-top-offset")||0)<=r+s.height()&&o+i.width()>=a&&o-(i.data("appear-left-offset")||0)<=a+s.width()?!0:!1},e.fn.extend({appear:function(i){var s=e.extend({},o,i||{}),c=this.selector||this;if(!r){var d=function(){n||(n=!0,setTimeout(t,s.interval))};e(window).scroll(d).resize(d),r=!0}return s.force_process&&setTimeout(t,s.interval),a.push(c),e(c)}}),e.extend({force_appear:function(){return r?(t(),!0):!1}})}(jQuery);var isMobile=!1;!function(e){"use strict";e(function(){function t(){e(".animated:appeared").each(function(t){var i=e(this),a=e(this).data("animated");setTimeout(function(){i.addClass(a)},100*t)})}(navigator.userAgent.match(/Android/i)||navigator.userAgent.match(/webOS/i)||navigator.userAgent.match(/iPhone/i)||navigator.userAgent.match(/iPad/i)||navigator.userAgent.match(/iPod/i)||navigator.userAgent.match(/BlackBerry/i))&&(isMobile=!0),1==isMobile&&(e(".animated").removeClass("animated"),e(".op0").removeClass("op0")),0==isMobile&&e("*[data-animated]").addClass("animated"),0==isMobile&&(t(),e(window).scroll(function(){t()}))})}(jQuery)}