(function(){jQuery(function(){return $("#new_theme_image").fileupload({dataType:"script",add:function(t,e){var n,i;return i=/(\.|\/)(gif|jpe?g|png)$/i,n=e.files[0],i.test(n.type)||i.test(n.name)?(e.context=$(tmpl("template-upload",n).trim()),$("#new_theme_image").append(e.context),e.submit()):alert(""+n.name+" is not a gif, jpeg, or png image file")},progress:function(t,e){var n;return e.context?(n=parseInt(e.loaded/e.total*100,10),e.context.find(".bar").css("width",n+"%")):void 0},done:function(t,e){return e.context?e.context.hide():void 0}})})}).call(this);