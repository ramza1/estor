!function(t){"use strict";function e(t,e){for(var i in e)t[i]=e[i];return t}function i(t){return"[object Array]"===a.call(t)}function n(t){var e=[];if(i(t))e=t;else if("number"==typeof t.length)for(var n=0,o=t.length;o>n;n++)e.push(t[n]);else e.push(t);return e}function o(t,i){function o(t,i,s){if(!(this instanceof o))return new o(t,i);"string"==typeof t&&(t=document.querySelectorAll(t)),this.elements=n(t),this.options=e({},this.options),"function"==typeof i?s=i:e(this.options,i),s&&this.on("always",s),this.getImages(),r&&(this.jqDeferred=new r.Deferred);var h=this;setTimeout(function(){h.check()})}function a(t){this.img=t}o.prototype=new t,o.prototype.options={},o.prototype.getImages=function(){this.images=[];for(var t=0,e=this.elements.length;e>t;t++){var i=this.elements[t];"IMG"===i.nodeName&&this.addImage(i);for(var n=i.querySelectorAll("img"),o=0,r=n.length;r>o;o++){var s=n[o];this.addImage(s)}}},o.prototype.addImage=function(t){var e=new a(t);this.images.push(e)},o.prototype.check=function(){function t(t,o){return e.options.debug&&h&&s.log("confirm",t,o),e.progress(t),i++,i===n&&e.complete(),!0}var e=this,i=0,n=this.images.length;this.hasAnyBroken=!1;for(var o=0;n>o;o++){var r=this.images[o];r.on("confirm",t),r.check()}},o.prototype.progress=function(t){this.hasAnyBroken=this.hasAnyBroken||!t.isLoaded,this.emit("progress",this,t),this.jqDeferred&&this.jqDeferred.notify(this,t)},o.prototype.complete=function(){var t=this.hasAnyBroken?"fail":"done";if(this.isComplete=!0,this.emit(t,this),this.emit("always",this),this.jqDeferred){var e=this.hasAnyBroken?"reject":"resolve";this.jqDeferred[e](this)}},r&&(r.fn.imagesLoaded=function(t,e){var i=new o(this,t,e);return i.jqDeferred.promise(r(this))});var f={};return a.prototype=new t,a.prototype.check=function(){var t=f[this.img.src];if(t)return this.useCached(t),void 0;if(f[this.img.src]=this,this.img.complete&&void 0!==this.img.naturalWidth)return this.confirm(0!==this.img.naturalWidth,"naturalWidth"),void 0;var e=this.proxyImage=new Image;i.bind(e,"load",this),i.bind(e,"error",this),e.src=this.img.src},a.prototype.useCached=function(t){if(t.isConfirmed)this.confirm(t.isLoaded,"cached was confirmed");else{var e=this;t.on("confirm",function(t){return e.confirm(t.isLoaded,"cache emitted confirmed"),!0})}},a.prototype.confirm=function(t,e){this.isConfirmed=!0,this.isLoaded=t,this.emit("confirm",this,e)},a.prototype.handleEvent=function(t){var e="on"+t.type;this[e]&&this[e](t)},a.prototype.onload=function(){this.confirm(!0,"onload"),this.unbindProxyEvents()},a.prototype.onerror=function(){this.confirm(!1,"onerror"),this.unbindProxyEvents()},a.prototype.unbindProxyEvents=function(){i.unbind(this.proxyImage,"load",this),i.unbind(this.proxyImage,"error",this)},o}var r=t.jQuery,s=t.console,h="undefined"!=typeof s,a=Object.prototype.toString;"function"==typeof define&&define.amd?define(["eventEmitter","eventie"],o):t.imagesLoaded=o(t.EventEmitter,t.eventie)}(window);