function fnFilterGlobal(){$("#example").dataTable().fnFilter($("#global_filter").val(),null,$("#global_regex")[0].checked,$("#global_smart")[0].checked)}function fnFilterColumn(a){$("#example").dataTable().fnFilter($("#col"+(a+1)+"_filter").val(),a,$("#col"+(a+1)+"_regex")[0].checked,$("#col"+(a+1)+"_smart")[0].checked)}function fnGetSelected(a){return a.$("tr.info")}$.extend(!0,$.fn.dataTable.defaults,{sDom:"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",sPaginationType:"bootstrap",oLanguage:{sLengthMenu:"_MENU_ records per page"}}),$.extend($.fn.dataTableExt.oStdClasses,{sWrapper:"dataTables_wrapper form-inline"}),$.fn.dataTableExt.oApi.fnPagingInfo=function(a){return{iStart:a._iDisplayStart,iEnd:a.fnDisplayEnd(),iLength:a._iDisplayLength,iTotal:a.fnRecordsTotal(),iFilteredTotal:a.fnRecordsDisplay(),iPage:-1===a._iDisplayLength?0:Math.ceil(a._iDisplayStart/a._iDisplayLength),iTotalPages:-1===a._iDisplayLength?0:Math.ceil(a.fnRecordsDisplay()/a._iDisplayLength)}},$.extend($.fn.dataTableExt.oPagination,{bootstrap:{fnInit:function(a,e,l){var t=a.oLanguage.oPaginate,n=function(e){e.preventDefault(),a.oApi._fnPageChange(a,e.data.action)&&l(a)};$(e).addClass("pagination").append('<ul><li class="prev disabled"><a href="#">&larr; '+t.sPrevious+'</a></li><li class="next disabled"><a href="#">'+t.sNext+" &rarr; </a></li></ul>");var i=$("a",e);$(i[0]).bind("click.DT",{action:"previous"},n),$(i[1]).bind("click.DT",{action:"next"},n)},fnUpdate:function(a,e){var l,t,n,i,o,s,r=5,c=a.oInstance.fnPagingInfo(),d=a.aanFeatures.p,f=Math.floor(r/2);for(c.iTotalPages<r?(o=1,s=c.iTotalPages):c.iPage<=f?(o=1,s=r):c.iPage>=c.iTotalPages-f?(o=c.iTotalPages-r+1,s=c.iTotalPages):(o=c.iPage-f+1,s=o+r-1),l=0,t=d.length;t>l;l++){for($("li:gt(0)",d[l]).filter(":not(:last)").remove(),n=o;s>=n;n++)i=n==c.iPage+1?'class="active"':"",$("<li "+i+'><a href="#">'+n+"</a></li>").insertBefore($("li:last",d[l])[0]).bind("click",function(l){l.preventDefault(),a._iDisplayStart=(parseInt($("a",this).text(),10)-1)*c.iLength,e(a)});0===c.iPage?$("li:first",d[l]).addClass("disabled"):$("li:first",d[l]).removeClass("disabled"),c.iPage===c.iTotalPages-1||0===c.iTotalPages?$("li:last",d[l]).addClass("disabled"):$("li:last",d[l]).removeClass("disabled")}}}}),$.fn.DataTable.TableTools&&($.extend(!0,$.fn.DataTable.TableTools.classes,{container:"DTTT btn-group",buttons:{normal:"btn",disabled:"disabled"},collection:{container:"DTTT_dropdown dropdown-menu",buttons:{normal:"",disabled:"disabled"}},print:{info:"DTTT_print_info modal"},select:{row:"active"}}),$.extend(!0,$.fn.DataTable.TableTools.DEFAULTS.oTags,{collection:{container:"ul",button:"li",liner:"a"}})),$(document).ready(function(){var a;$("#example tbody").on("click","tr",function(){$(this).hasClass("info")?($(this).removeClass("info").removeClass("text-success"),$("#delete-row").addClass("disabled")):(a.$("tr.info").removeClass("info"),$(this).addClass("info").addClass("text-success"),$("#delete-row").removeClass("disabled"))}),$("#delete-row").click(function(){var e=fnGetSelected(a);0!==e.length&&(a.fnDeleteRow(e[0]),$(this).addClass("disabled"))}),a=$("#example").dataTable({sDom:"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",sPaginationType:"bootstrap",oLanguage:{sLengthMenu:"_MENU_ records per page"},aaSorting:[[1,"asc"]],aoColumnDefs:[{bSortable:!1,aTargets:[0]}]});var e=1;$("#add-row").click(function(){a.fnAddData(['<input type="checkbox" id="newInlineCheckbox"'+e+'" value="option2">',e+".1",e+".2",e+".3",e+".4",e+".5"]),e++}),$("#global_filter").keyup(fnFilterGlobal),$("#global_regex").click(fnFilterGlobal),$("#global_smart").click(fnFilterGlobal),$("#col1_filter").keyup(function(){fnFilterColumn(0)}),$("#col1_regex").click(function(){fnFilterColumn(0)}),$("#col1_smart").click(function(){fnFilterColumn(0)}),$("#col2_filter").keyup(function(){fnFilterColumn(1)}),$("#col2_regex").click(function(){fnFilterColumn(1)}),$("#col2_smart").click(function(){fnFilterColumn(1)})});