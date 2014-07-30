!function(t){t.gritter={},t.gritter.options={position:"",class_name:"",fade_in_speed:"medium",fade_out_speed:1e3,time:6e3},t.gritter.add=function(t){try{return e.add(t||{})}catch(i){var r="Gritter Error: "+i;"undefined"!=typeof console&&console.error?console.error(r,t):alert(r)}},t.gritter.remove=function(t,i){e.removeSpecific(t,i||{})},t.gritter.removeAll=function(t){e.stop(t||{})};var e={position:"",fade_in_speed:"",fade_out_speed:"",time:"",_custom_timer:0,_item_count:0,_is_setup:0,_tpl_close:'<div class="gritter-close"></div>',_tpl_title:'<span class="gritter-title">[[title]]</span>',_tpl_item:'<div id="gritter-item-[[number]]" class="gritter-item-wrapper [[item_class]]" style="display:none"><div class="gritter-top"></div><div class="gritter-item">[[close]][[image]]<div class="[[class_name]]">[[title]]<p>[[text]]</p></div><div style="clear:both"></div></div><div class="gritter-bottom"></div></div>',_tpl_wrap:'<div id="gritter-notice-wrapper"></div>',add:function(i){if("string"==typeof i&&(i={text:i}),null===i.text)throw'You must supply "text" parameter.';this._is_setup||this._runSetup();var r=i.title,o=i.text,s=i.image||"",n=i.sticky||!1,a=i.class_name||t.gritter.options.class_name,_=t.gritter.options.position,c=i.time||"";this._verifyWrapper(),this._item_count++;var p=this._item_count,l=this._tpl_item;t(["before_open","after_open","before_close","after_close"]).each(function(r,o){e["_"+o+"_"+p]=t.isFunction(i[o])?i[o]:function(){}}),this._custom_timer=0,c&&(this._custom_timer=c);var u=""!=s?'<img src="'+s+'" class="gritter-image" />':"",f=""!=s?"gritter-with-image":"gritter-without-image";if(r=r?this._str_replace("[[title]]",r,this._tpl_title):"",l=this._str_replace(["[[title]]","[[text]]","[[close]]","[[image]]","[[number]]","[[class_name]]","[[item_class]]"],[r,o,this._tpl_close,u,this._item_count,f,a],l),this["_before_open_"+p]()===!1)return!1;t("#gritter-notice-wrapper").addClass(_).append(l);var m=t("#gritter-item-"+this._item_count);return m.fadeIn(this.fade_in_speed,function(){e["_after_open_"+p](t(this))}),n||this._setFadeTimer(m,p),t(m).bind("mouseenter mouseleave",function(i){"mouseenter"==i.type?n||e._restoreItemIfFading(t(this),p):n||e._setFadeTimer(t(this),p),e._hoverState(t(this),i.type)}),t(m).find(".gritter-close").click(function(){e.removeSpecific(p,{},null,!0)}),p},_countRemoveWrapper:function(e,i,r){i.remove(),this["_after_close_"+e](i,r),0==t(".gritter-item-wrapper").length&&t("#gritter-notice-wrapper").remove()},_fade:function(t,i,r,o){var r=r||{},s="undefined"!=typeof r.fade?r.fade:!0,n=r.speed||this.fade_out_speed,a=o;this["_before_close_"+i](t,a),o&&t.unbind("mouseenter mouseleave"),s?t.animate({opacity:0},n,function(){t.animate({height:0},300,function(){e._countRemoveWrapper(i,t,a)})}):this._countRemoveWrapper(i,t)},_hoverState:function(t,e){"mouseenter"==e?(t.addClass("hover"),t.find(".gritter-close").show()):(t.removeClass("hover"),t.find(".gritter-close").hide())},removeSpecific:function(e,i,r,o){if(!r)var r=t("#gritter-item-"+e);this._fade(r,e,i||{},o)},_restoreItemIfFading:function(t,e){clearTimeout(this["_int_id_"+e]),t.stop().css({opacity:"",height:""})},_runSetup:function(){for(opt in t.gritter.options)this[opt]=t.gritter.options[opt];this._is_setup=1},_setFadeTimer:function(t,i){var r=this._custom_timer?this._custom_timer:this.time;this["_int_id_"+i]=setTimeout(function(){e._fade(t,i)},r)},stop:function(e){var i=t.isFunction(e.before_close)?e.before_close:function(){},r=t.isFunction(e.after_close)?e.after_close:function(){},o=t("#gritter-notice-wrapper");i(o),o.fadeOut(function(){t(this).remove(),r()})},_str_replace:function(t,e,i,r){var o=0,s=0,n="",a="",_=0,c=0,p=[].concat(t),l=[].concat(e),u=i,f=l instanceof Array,m=u instanceof Array;for(u=[].concat(u),r&&(this.window[r]=0),o=0,_=u.length;_>o;o++)if(""!==u[o])for(s=0,c=p.length;c>s;s++)n=u[o]+"",a=f?void 0!==l[s]?l[s]:"":l[0],u[o]=n.split(p[s]).join(a),r&&u[o]!==n&&(this.window[r]+=(n.length-u[o].length)/p[s].length);return m?u:u[0]},_verifyWrapper:function(){0==t("#gritter-notice-wrapper").length&&t("body").append(this._tpl_wrap)}}}(jQuery);