!function(t){var e,s,h;h=function(t,i){return function(){return t.apply(i,arguments)}},s={align:"center",container:t("body"),offset:2,autoResize:!1,itemWidth:0,flexibleWidth:0,resizeDelay:50,onLayoutChanged:void 0},e=function(){function e(i,e){this.handler=i,this.columns=null,this.containerWidth=null,this.resizeTimer=null,this.direction="left",this.itemHeightsDirty=!0,t.extend(!0,this,s,e),this.update=h(this.update,this),this.onResize=h(this.onResize,this),this.onRefresh=h(this.onRefresh,this),this.getItemWidth=h(this.getItemWidth,this),this.layout=h(this.layout,this),this.layoutFull=h(this.layoutFull,this),this.layoutColumns=h(this.layoutColumns,this),this.filter=h(this.filter,this),this.clear=h(this.clear,this),this.getActiveItems=h(this.getActiveItems,this);for(var o,n=j=0,r={};n<i.length;n++)if($item=i.eq(n),o=$item.data("filterClass"),"object"==typeof o&&o.length>0)for(j=0;j<o.length;j++)filterClass=t.trim(o[j]).toLowerCase(),filterClass in r||(r[filterClass]=[]),r[filterClass].push($item[0]);this.filterClasses=r,this.autoResize&&t(window).bind("resize.wookmark",this.onResize),this.container.bind("refreshWookmark",this.onRefresh)}return e.prototype.update=function(i){this.itemHeightsDirty=!0,t.extend(!0,this,i)},e.prototype.onResize=function(){clearTimeout(this.resizeTimer),this.itemHeightsDirty=0!=this.flexibleWidth,this.resizeTimer=setTimeout(this.layout,this.resizeDelay)},e.prototype.onRefresh=function(){this.itemHeightsDirty=!0,this.layout()},e.prototype.filter=function(i,e){var s,h,o,n,r,l=[],a=t();if(i=i||[],e=e||"or",i.length){for(h=0;h<i.length;h++)r=t.trim(i[h].toLowerCase()),r in this.filterClasses&&l.push(this.filterClasses[r]);if(s=l.length,"or"==e||1==s)for(h=0;s>h;h++)a=a.add(l[h]);else if("and"==e){var u,f,m,d=l[0],c=!0;for(h=1;s>h;h++)l[h].length<d.length&&(d=l[h]);for(h=0;h<d.length;h++){for(f=d[h],c=!0,o=0;o<l.length&&c;o++)if(m=l[o],d!=m){for(n=0,u=!1;n<m.length&&!u;n++)u=m[n]==f;c&=u}c&&a.push(d[h])}}this.handler.not(a).addClass("inactive")}else a=this.handler;a.removeClass("inactive"),this.columns=null,this.layout()},e.prototype.getActiveItems=function(){return this.handler.not(".inactive")},e.prototype.getItemWidth=function(){var t=this.itemWidth,i=this.container.width(),e=this.handler.eq(0),s=this.flexibleWidth;if(void 0===this.itemWidth||0===this.itemWidth&&!this.flexibleWidth?t=e.outerWidth():"string"==typeof this.itemWidth&&this.itemWidth.indexOf("%")>=0&&(t=parseFloat(this.itemWidth)/100*i),s){"string"==typeof s&&s.indexOf("%")>=0&&(s=parseFloat(s)/100*i-e.outerWidth()+e.innerWidth());var h=~~(1+i/(s+this.offset)),o=(i-(h-1)*this.offset)/h;t=Math.max(t,~~o),this.handler.css("width",t)}return t},e.prototype.layout=function(){if(this.container.is(":visible")){var t,e=this.getItemWidth()+this.offset,s=this.container.width(),h=~~((s+this.offset)/e),o=maxHeight=i=0,n=this.getActiveItems(),r=n.length;if(this.itemHeightsDirty){for(;r>i;i++)t=n.eq(i),t.data("outerHeight",t.outerHeight());this.itemHeightsDirty=!1}h=Math.max(1,Math.min(h,r)),o="left"==this.align||"right"==this.align?~~(h/e+this.offset>>1):~~(.5+(s-(h*e-this.offset))>>1),this.direction="right"==this.align?"right":"left",maxHeight=null!=this.columns&&this.columns.length==h?this.layoutColumns(e,o):this.layoutFull(e,h,o),this.container.css("height",maxHeight),void 0!==this.onLayoutChanged&&"function"==typeof this.onLayoutChanged&&this.onLayoutChanged()}},e.prototype.layoutFull=function(t,i,e){var s,h=0,o=0,n=this.getActiveItems(),r=n.length,l=null,a=null,u={position:"absolute"},f=[],m="left"==this.align?!0:!1;for(this.columns=[];f.length<i;)f.push(0),this.columns.push([]);for(;r>h;h++){for($item=n.eq(h),l=f[0],a=0,o=0;i>o;o++)f[o]<l&&(l=f[o],a=o);s=0==a&&m?0:a*t+e,u[this.direction]=s,u.top=l,$item.css(u),f[a]+=$item.data("outerHeight")+this.offset,this.columns[a].push($item)}return Math.max.apply(Math,f)},e.prototype.layoutColumns=function(t,i){for(var e,s,h,o=[],n=0,r=0;n<this.columns.length;n++)for(o.push(0),e=this.columns[n],h=n*t+i,r=0;r<e.length;r++)$item=e[r],s={top:o[n]},s[this.direction]=h,$item.css(s),o[n]+=$item.data("outerHeight")+this.offset;return Math.max.apply(Math,o)},e.prototype.clear=function(){clearTimeout(this.resizeTimer),t(window).unbind("resize.wookmark",this.onResize),this.container.unbind("refreshWookmark",this.onRefresh)},e}(),t.fn.wookmark=function(t){return this.wookmarkInstance?this.wookmarkInstance.update(t||{}):this.wookmarkInstance=new e(this,t||{}),this.wookmarkInstance.layout(),this.show()}}(jQuery);