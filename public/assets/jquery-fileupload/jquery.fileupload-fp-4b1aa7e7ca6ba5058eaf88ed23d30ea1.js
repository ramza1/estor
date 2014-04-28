!function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","load-image","canvas-to-blob","./jquery.fileupload"],e):e(window.jQuery,window.loadImage)}(function(e,i){"use strict";e.widget("blueimp.fileupload",e.blueimp.fileupload,{options:{process:[],add:function(i,s){e(this).fileupload("process",s).done(function(){s.submit()})}},processActions:{load:function(s,n){var t=this,o=s.files[s.index],r=e.Deferred();return window.HTMLCanvasElement&&window.HTMLCanvasElement.prototype.toBlob&&("number"!==e.type(n.maxFileSize)||o.size<n.maxFileSize)&&(!n.fileTypes||n.fileTypes.test(o.type))?i(o,function(e){return e.src?(s.img=e,r.resolveWith(t,[s]),void 0):r.rejectWith(t,[s])}):r.rejectWith(t,[s]),r.promise()},resize:function(s,n){var t,o=s.img;return n=e.extend({canvas:!0},n),o&&(t=i.scale(o,n),(t.width!==o.width||t.height!==o.height)&&(s.canvas=t)),s},save:function(i){if(!i.canvas)return i;var s=this,n=i.files[i.index],t=n.name,o=e.Deferred(),r=function(e){e.name||(n.type===e.type?e.name=n.name:n.name&&(e.name=n.name.replace(/\..+$/,"."+e.type.substr(6)))),i.files[i.index]=e,o.resolveWith(s,[i])};return i.canvas.mozGetAsFile?r(i.canvas.mozGetAsFile(/^image\/(jpeg|png)$/.test(n.type)&&t||(t&&t.replace(/\..+$/,"")||"blob")+".png",n.type)):i.canvas.toBlob(r,n.type),o.promise()}},_processFile:function(i,s,n){var t=this,o=e.Deferred().resolveWith(t,[{files:i,index:s}]),r=o.promise();return t._processing+=1,e.each(n.process,function(e,i){r=r.pipe(function(e){return t.processActions[i.action].call(this,e,i)})}),r.always(function(){t._processing-=1,0===t._processing&&t.element.removeClass("fileupload-processing")}),1===t._processing&&t.element.addClass("fileupload-processing"),r},process:function(i){var s=this,n=e.extend({},this.options,i);return n.process&&n.process.length&&this._isXHRUpload(n)&&e.each(i.files,function(t){s._processingQueue=s._processingQueue.pipe(function(){var o=e.Deferred();return s._processFile(i.files,t,n).always(function(){o.resolveWith(s)}),o.promise()})}),this._processingQueue},_create:function(){this._super(),this._processing=0,this._processingQueue=e.Deferred().resolveWith(this).promise()}})});