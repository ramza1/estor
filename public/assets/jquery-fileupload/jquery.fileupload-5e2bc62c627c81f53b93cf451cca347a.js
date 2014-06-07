!function(e){"use strict";"function"==typeof define&&define.amd?define(["jquery","jquery.ui.widget"],e):e(window.jQuery)}(function(e){"use strict";e.support.xhrFileUpload=!(!window.XMLHttpRequestUpload||!window.FileReader),e.support.xhrFormDataFileUpload=!!window.FormData,e.propHooks.elements={get:function(t){return e.nodeName(t,"form")?e.grep(t.elements,function(t){return!e.nodeName(t,"input")||"file"!==t.type}):null}},e.widget("blueimp.fileupload",{options:{dropZone:e(document),pasteZone:e(document),fileInput:void 0,replaceFileInput:!0,paramName:void 0,singleFileUploads:!0,limitMultiFileUploads:void 0,sequentialUploads:!1,limitConcurrentUploads:void 0,forceIframeTransport:!1,redirect:void 0,redirectParamName:void 0,postMessage:void 0,multipart:!0,maxChunkSize:void 0,uploadedBytes:void 0,recalculateProgress:!0,progressInterval:100,bitrateInterval:500,formData:function(e){return e.serializeArray()},add:function(e,t){t.submit()},processData:!1,contentType:!1,cache:!1},_refreshOptionsList:["fileInput","dropZone","pasteZone","multipart","forceIframeTransport"],_BitrateTimer:function(){this.timestamp=+new Date,this.loaded=0,this.bitrate=0,this.getBitrate=function(e,t,i){var n=e-this.timestamp;return(!this.bitrate||!i||n>i)&&(this.bitrate=(t-this.loaded)*(1e3/n)*8,this.loaded=t,this.timestamp=e),this.bitrate}},_isXHRUpload:function(t){return!t.forceIframeTransport&&(!t.multipart&&e.support.xhrFileUpload||e.support.xhrFormDataFileUpload)},_getFormData:function(t){var i;return"function"==typeof t.formData?t.formData(t.form):e.isArray(t.formData)?t.formData:t.formData?(i=[],e.each(t.formData,function(e,t){i.push({name:e,value:t})}),i):[]},_getTotal:function(t){var i=0;return e.each(t,function(e,t){i+=t.size||1}),i},_onProgress:function(e,t){if(e.lengthComputable){var i,n,r=+new Date;if(t._time&&t.progressInterval&&r-t._time<t.progressInterval&&e.loaded!==e.total)return;t._time=r,i=t.total||this._getTotal(t.files),n=parseInt(e.loaded/e.total*(t.chunkSize||i),10)+(t.uploadedBytes||0),this._loaded+=n-(t.loaded||t.uploadedBytes||0),t.lengthComputable=!0,t.loaded=n,t.total=i,t.bitrate=t._bitrateTimer.getBitrate(r,n,t.bitrateInterval),this._trigger("progress",e,t),this._trigger("progressall",e,{lengthComputable:!0,loaded:this._loaded,total:this._total,bitrate:this._bitrateTimer.getBitrate(r,this._loaded,t.bitrateInterval)})}},_initProgressListener:function(t){var i=this,n=t.xhr?t.xhr():e.ajaxSettings.xhr();n.upload&&(e(n.upload).bind("progress",function(e){var n=e.originalEvent;e.lengthComputable=n.lengthComputable,e.loaded=n.loaded,e.total=n.total,i._onProgress(e,t)}),t.xhr=function(){return n})},_initXHRData:function(t){var i,n=t.files[0],r=t.multipart||!e.support.xhrFileUpload,o=t.paramName[0];t.headers=t.headers||{},t.contentRange&&(t.headers["Content-Range"]=t.contentRange),r?e.support.xhrFormDataFileUpload&&(t.postMessage?(i=this._getFormData(t),t.blob?i.push({name:o,value:t.blob}):e.each(t.files,function(e,n){i.push({name:t.paramName[e]||o,value:n})})):(t.formData instanceof FormData?i=t.formData:(i=new FormData,e.each(this._getFormData(t),function(e,t){i.append(t.name,t.value)})),t.blob?(t.headers["Content-Disposition"]='attachment; filename="'+encodeURI(n.name)+'"',i.append(o,t.blob,n.name)):e.each(t.files,function(e,n){(window.Blob&&n instanceof Blob||window.File&&n instanceof File)&&i.append(t.paramName[e]||o,n,n.name)})),t.data=i):(t.headers["Content-Disposition"]='attachment; filename="'+encodeURI(n.name)+'"',t.contentType=n.type,t.data=t.blob||n),t.blob=null},_initIframeSettings:function(t){t.dataType="iframe "+(t.dataType||""),t.formData=this._getFormData(t),t.redirect&&e("<a></a>").prop("href",t.url).prop("host")!==location.host&&t.formData.push({name:t.redirectParamName||"redirect",value:t.redirect})},_initDataSettings:function(e){this._isXHRUpload(e)?(this._chunkedUpload(e,!0)||(e.data||this._initXHRData(e),this._initProgressListener(e)),e.postMessage&&(e.dataType="postmessage "+(e.dataType||""))):this._initIframeSettings(e,"iframe")},_getParamName:function(t){var i=e(t.fileInput),n=t.paramName;return n?e.isArray(n)||(n=[n]):(n=[],i.each(function(){for(var t=e(this),i=t.prop("name")||"files[]",r=(t.prop("files")||[1]).length;r;)n.push(i),r-=1}),n.length||(n=[i.prop("name")||"files[]"])),n},_initFormSettings:function(t){t.form&&t.form.length||(t.form=e(t.fileInput.prop("form")),t.form.length||(t.form=e(this.options.fileInput.prop("form")))),t.paramName=this._getParamName(t),t.url||(t.url=t.form.prop("action")||location.href),t.type=(t.type||t.form.prop("method")||"").toUpperCase(),"POST"!==t.type&&"PUT"!==t.type&&"PATCH"!==t.type&&(t.type="POST"),t.formAcceptCharset||(t.formAcceptCharset=t.form.attr("accept-charset"))},_getAJAXSettings:function(t){var i=e.extend({},this.options,t);return this._initFormSettings(i),this._initDataSettings(i),i},_enhancePromise:function(e){return e.success=e.done,e.error=e.fail,e.complete=e.always,e},_getXHRPromise:function(t,i,n){var r=e.Deferred(),o=r.promise();return i=i||this.options.context||o,t===!0?r.resolveWith(i,n):t===!1&&r.rejectWith(i,n),o.abort=r.promise,this._enhancePromise(o)},_getUploadedBytes:function(e){var t=e.getResponseHeader("Range"),i=t&&t.split("-"),n=i&&i.length>1&&parseInt(i[1],10);return n&&n+1},_chunkedUpload:function(t,i){var n,r,o=this,a=t.files[0],s=a.size,l=t.uploadedBytes=t.uploadedBytes||0,p=t.maxChunkSize||s,u=a.slice||a.webkitSlice||a.mozSlice,d=e.Deferred(),f=d.promise();return this._isXHRUpload(t)&&u&&(l||s>p)&&!t.data?i?!0:l>=s?(a.error="Uploaded bytes exceed file size",this._getXHRPromise(!1,t.context,[null,"error",a.error])):(r=function(){var i=e.extend({},t);i.blob=u.call(a,l,l+p,a.type),i.chunkSize=i.blob.size,i.contentRange="bytes "+l+"-"+(l+i.chunkSize-1)+"/"+s,o._initXHRData(i),o._initProgressListener(i),n=(o._trigger("chunksend",null,i)!==!1&&e.ajax(i)||o._getXHRPromise(!1,i.context)).done(function(n,a,p){l=o._getUploadedBytes(p)||l+i.chunkSize,(!i.loaded||i.loaded<i.total)&&o._onProgress(e.Event("progress",{lengthComputable:!0,loaded:l-i.uploadedBytes,total:l-i.uploadedBytes}),i),t.uploadedBytes=i.uploadedBytes=l,i.result=n,i.textStatus=a,i.jqXHR=p,o._trigger("chunkdone",null,i),o._trigger("chunkalways",null,i),s>l?r():d.resolveWith(i.context,[n,a,p])}).fail(function(e,t,n){i.jqXHR=e,i.textStatus=t,i.errorThrown=n,o._trigger("chunkfail",null,i),o._trigger("chunkalways",null,i),d.rejectWith(i.context,[e,t,n])})},this._enhancePromise(f),f.abort=function(){return n.abort()},r(),f):!1},_beforeSend:function(e,t){0===this._active&&(this._trigger("start"),this._bitrateTimer=new this._BitrateTimer),this._active+=1,this._loaded+=t.uploadedBytes||0,this._total+=this._getTotal(t.files)},_onDone:function(t,i,n,r){if(!this._isXHRUpload(r)||!r.loaded||r.loaded<r.total){var o=this._getTotal(r.files)||1;this._onProgress(e.Event("progress",{lengthComputable:!0,loaded:o,total:o}),r)}r.result=t,r.textStatus=i,r.jqXHR=n,this._trigger("done",null,r)},_onFail:function(e,t,i,n){n.jqXHR=e,n.textStatus=t,n.errorThrown=i,this._trigger("fail",null,n),n.recalculateProgress&&(this._loaded-=n.loaded||n.uploadedBytes||0,this._total-=n.total||this._getTotal(n.files))},_onAlways:function(e,t,i,n){this._active-=1,this._trigger("always",null,n),0===this._active&&(this._trigger("stop"),this._loaded=this._total=0,this._bitrateTimer=null)},_onSend:function(t,i){var n,r,o,a,s=this,l=s._getAJAXSettings(i),p=function(){return s._sending+=1,l._bitrateTimer=new s._BitrateTimer,n=n||((r||s._trigger("send",t,l)===!1)&&s._getXHRPromise(!1,l.context,r)||s._chunkedUpload(l)||e.ajax(l)).done(function(e,t,i){s._onDone(e,t,i,l)}).fail(function(e,t,i){s._onFail(e,t,i,l)}).always(function(e,t,i){if(s._sending-=1,s._onAlways(e,t,i,l),l.limitConcurrentUploads&&l.limitConcurrentUploads>s._sending)for(var n,r=s._slots.shift();r;){if(n=r.state?"pending"===r.state():!r.isRejected()){r.resolve();break}r=s._slots.shift()}})};return this._beforeSend(t,l),this.options.sequentialUploads||this.options.limitConcurrentUploads&&this.options.limitConcurrentUploads<=this._sending?(this.options.limitConcurrentUploads>1?(o=e.Deferred(),this._slots.push(o),a=o.pipe(p)):a=this._sequence=this._sequence.pipe(p,p),a.abort=function(){return r=[void 0,"abort","abort"],n?n.abort():(o&&o.rejectWith(l.context,r),p())},this._enhancePromise(a)):p()},_onAdd:function(t,i){var n,r,o,a,s=this,l=!0,p=e.extend({},this.options,i),u=p.limitMultiFileUploads,d=this._getParamName(p);if((p.singleFileUploads||u)&&this._isXHRUpload(p))if(!p.singleFileUploads&&u)for(o=[],n=[],a=0;a<i.files.length;a+=u)o.push(i.files.slice(a,a+u)),r=d.slice(a,a+u),r.length||(r=d),n.push(r);else n=d;else o=[i.files],n=[d];return i.originalFiles=i.files,e.each(o||i.files,function(r,a){var p=e.extend({},i);return p.files=o?a:[a],p.paramName=n[r],p.submit=function(){return p.jqXHR=this.jqXHR=s._trigger("submit",t,this)!==!1&&s._onSend(t,this),this.jqXHR},l=s._trigger("add",t,p)}),l},_replaceFileInput:function(t){var i=t.clone(!0);e("<form></form>").append(i)[0].reset(),t.after(i).detach(),e.cleanData(t.unbind("remove")),this.options.fileInput=this.options.fileInput.map(function(e,n){return n===t[0]?i[0]:n}),t[0]===this.element[0]&&(this.element=i)},_handleFileTreeEntry:function(t,i){var n,r=this,o=e.Deferred(),a=function(e){e&&!e.entry&&(e.entry=t),o.resolve([e])};return i=i||"",t.isFile?t._file?(t._file.relativePath=i,o.resolve(t._file)):t.file(function(e){e.relativePath=i,o.resolve(e)},a):t.isDirectory?(n=t.createReader(),n.readEntries(function(e){r._handleFileTreeEntries(e,i+t.name+"/").done(function(e){o.resolve(e)}).fail(a)},a)):o.resolve([]),o.promise()},_handleFileTreeEntries:function(t,i){var n=this;return e.when.apply(e,e.map(t,function(e){return n._handleFileTreeEntry(e,i)})).pipe(function(){return Array.prototype.concat.apply([],arguments)})},_getDroppedFiles:function(t){t=t||{};var i=t.items;return i&&i.length&&(i[0].webkitGetAsEntry||i[0].getAsEntry)?this._handleFileTreeEntries(e.map(i,function(e){var t;return e.webkitGetAsEntry?(t=e.webkitGetAsEntry(),t&&(t._file=e.getAsFile()),t):e.getAsEntry()})):e.Deferred().resolve(e.makeArray(t.files)).promise()},_getSingleFileInputFiles:function(t){t=e(t);var i,n,r=t.prop("webkitEntries")||t.prop("entries");if(r&&r.length)return this._handleFileTreeEntries(r);if(i=e.makeArray(t.prop("files")),i.length)void 0===i[0].name&&i[0].fileName&&e.each(i,function(e,t){t.name=t.fileName,t.size=t.fileSize});else{if(n=t.prop("value"),!n)return e.Deferred().resolve([]).promise();i=[{name:n.replace(/^.*\\/,"")}]}return e.Deferred().resolve(i).promise()},_getFileInputFiles:function(t){return t instanceof e&&1!==t.length?e.when.apply(e,e.map(t,this._getSingleFileInputFiles)).pipe(function(){return Array.prototype.concat.apply([],arguments)}):this._getSingleFileInputFiles(t)},_onChange:function(t){var i=this,n={fileInput:e(t.target),form:e(t.target.form)};this._getFileInputFiles(n.fileInput).always(function(e){n.files=e,i.options.replaceFileInput&&i._replaceFileInput(n.fileInput),i._trigger("change",t,n)!==!1&&i._onAdd(t,n)})},_onPaste:function(t){var i=t.originalEvent.clipboardData,n=i&&i.items||[],r={files:[]};return e.each(n,function(e,t){var i=t.getAsFile&&t.getAsFile();i&&r.files.push(i)}),this._trigger("paste",t,r)===!1||this._onAdd(t,r)===!1?!1:void 0},_onDrop:function(e){var t=this,i=e.dataTransfer=e.originalEvent.dataTransfer,n={};i&&i.files&&i.files.length&&e.preventDefault(),this._getDroppedFiles(i).always(function(i){n.files=i,t._trigger("drop",e,n)!==!1&&t._onAdd(e,n)})},_onDragOver:function(t){var i=t.dataTransfer=t.originalEvent.dataTransfer;return this._trigger("dragover",t)===!1?!1:(i&&-1!==e.inArray("Files",i.types)&&(i.dropEffect="copy",t.preventDefault()),void 0)},_initEventHandlers:function(){this._isXHRUpload(this.options)&&(this._on(this.options.dropZone,{dragover:this._onDragOver,drop:this._onDrop}),this._on(this.options.pasteZone,{paste:this._onPaste})),this._on(this.options.fileInput,{change:this._onChange})},_destroyEventHandlers:function(){this._off(this.options.dropZone,"dragover drop"),this._off(this.options.pasteZone,"paste"),this._off(this.options.fileInput,"change")},_setOption:function(t,i){var n=-1!==e.inArray(t,this._refreshOptionsList);n&&this._destroyEventHandlers(),this._super(t,i),n&&(this._initSpecialOptions(),this._initEventHandlers())},_initSpecialOptions:function(){var t=this.options;void 0===t.fileInput?t.fileInput=this.element.is('input[type="file"]')?this.element:this.element.find('input[type="file"]'):t.fileInput instanceof e||(t.fileInput=e(t.fileInput)),t.dropZone instanceof e||(t.dropZone=e(t.dropZone)),t.pasteZone instanceof e||(t.pasteZone=e(t.pasteZone))},_create:function(){var t=this.options;e.extend(t,e(this.element[0].cloneNode(!1)).data()),this._initSpecialOptions(),this._slots=[],this._sequence=this._getXHRPromise(!0),this._sending=this._active=this._loaded=this._total=0,this._initEventHandlers()},_destroy:function(){this._destroyEventHandlers()},add:function(t){var i=this;t&&!this.options.disabled&&(t.fileInput&&!t.files?this._getFileInputFiles(t.fileInput).always(function(e){t.files=e,i._onAdd(null,t)}):(t.files=e.makeArray(t.files),this._onAdd(null,t)))},send:function(t){if(t&&!this.options.disabled){if(t.fileInput&&!t.files){var i,n,r=this,o=e.Deferred(),a=o.promise();return a.abort=function(){return n=!0,i?i.abort():(o.reject(null,"abort","abort"),a)},this._getFileInputFiles(t.fileInput).always(function(e){n||(t.files=e,i=r._onSend(null,t).then(function(e,t,i){o.resolve(e,t,i)},function(e,t,i){o.reject(e,t,i)}))}),this._enhancePromise(a)}if(t.files=e.makeArray(t.files),t.files.length)return this._onSend(null,t)}return this._getXHRPromise(!1,t&&t.context)}})});