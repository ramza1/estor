$.extend(true,$.fn.dataTable.defaults,{sDom:"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",sPaginationType:"bootstrap",oLanguage:{sLengthMenu:"_MENU_ records per page"}});$.extend($.fn.dataTableExt.oStdClasses,{sWrapper:"dataTables_wrapper form-inline"});$.fn.dataTableExt.oApi.fnPagingInfo=function(a){return{iStart:a._iDisplayStart,iEnd:a.fnDisplayEnd(),iLength:a._iDisplayLength,iTotal:a.fnRecordsTotal(),iFilteredTotal:a.fnRecordsDisplay(),iPage:a._iDisplayLength===-1?0:Math.ceil(a._iDisplayStart/a._iDisplayLength),iTotalPages:a._iDisplayLength===-1?0:Math.ceil(a.fnRecordsDisplay()/a._iDisplayLength)}};$.extend($.fn.dataTableExt.oPagination,{bootstrap:{fnInit:function(e,b,d){var a=e.oLanguage.oPaginate;var f=function(g){g.preventDefault();if(e.oApi._fnPageChange(e,g.data.action)){d(e)}};$(b).addClass("pagination").append('<ul><li class="prev disabled"><a href="#">&larr; '+a.sPrevious+'</a></li><li class="next disabled"><a href="#">'+a.sNext+" &rarr; </a></li></ul>");var c=$("a",b);$(c[0]).bind("click.DT",{action:"previous"},f);$(c[1]).bind("click.DT",{action:"next"},f)},fnUpdate:function(c,k){var l=5;var e=c.oInstance.fnPagingInfo();var h=c.aanFeatures.p;var g,m,f,d,a,n,b=Math.floor(l/2);if(e.iTotalPages<l){a=1;n=e.iTotalPages}else{if(e.iPage<=b){a=1;n=l}else{if(e.iPage>=(e.iTotalPages-b)){a=e.iTotalPages-l+1;n=e.iTotalPages}else{a=e.iPage-b+1;n=a+l-1}}}for(g=0,m=h.length;g<m;g++){$("li:gt(0)",h[g]).filter(":not(:last)").remove();for(f=a;f<=n;f++){d=(f==e.iPage+1)?'class="active"':"";$("<li "+d+'><a href="#">'+f+"</a></li>").insertBefore($("li:last",h[g])[0]).bind("click",function(i){i.preventDefault();c._iDisplayStart=(parseInt($("a",this).text(),10)-1)*e.iLength;k(c)})}if(e.iPage===0){$("li:first",h[g]).addClass("disabled")}else{$("li:first",h[g]).removeClass("disabled")}if(e.iPage===e.iTotalPages-1||e.iTotalPages===0){$("li:last",h[g]).addClass("disabled")}else{$("li:last",h[g]).removeClass("disabled")}}}}});if($.fn.DataTable.TableTools){$.extend(true,$.fn.DataTable.TableTools.classes,{container:"DTTT btn-group",buttons:{normal:"btn",disabled:"disabled"},collection:{container:"DTTT_dropdown dropdown-menu",buttons:{normal:"",disabled:"disabled"}},print:{info:"DTTT_print_info modal"},select:{row:"active"}});$.extend(true,$.fn.DataTable.TableTools.DEFAULTS.oTags,{collection:{container:"ul",button:"li",liner:"a"}})}function fnFilterGlobal(){$("#example").dataTable().fnFilter($("#global_filter").val(),null,$("#global_regex")[0].checked,$("#global_smart")[0].checked)}function fnFilterColumn(a){$("#example").dataTable().fnFilter($("#col"+(a+1)+"_filter").val(),a,$("#col"+(a+1)+"_regex")[0].checked,$("#col"+(a+1)+"_smart")[0].checked)}function fnGetSelected(a){return a.$("tr.info")}$(document).ready(function(){var b;$("#example tbody").on("click","tr",function(c){if($(this).hasClass("info")){$(this).removeClass("info").removeClass("text-success");$("#delete-row").addClass("disabled")}else{b.$("tr.info").removeClass("info");$(this).addClass("info").addClass("text-success");$("#delete-row").removeClass("disabled")}});$("#delete-row").click(function(){var c=fnGetSelected(b);if(c.length!==0){b.fnDeleteRow(c[0]);$(this).addClass("disabled")}});b=$("#example").dataTable({sDom:"<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",sPaginationType:"bootstrap",oLanguage:{sLengthMenu:"_MENU_ records per page"},aaSorting:[[1,"asc"]],aoColumnDefs:[{bSortable:false,aTargets:[0]}]});var a=1;$("#add-row").click(function(){b.fnAddData(['<input type="checkbox" id="newInlineCheckbox"'+a+'" value="option2">',a+".1",a+".2",a+".3",a+".4",a+".5"]);a++});$("#global_filter").keyup(fnFilterGlobal);$("#global_regex").click(fnFilterGlobal);$("#global_smart").click(fnFilterGlobal);$("#col1_filter").keyup(function(){fnFilterColumn(0)});$("#col1_regex").click(function(){fnFilterColumn(0)});$("#col1_smart").click(function(){fnFilterColumn(0)});$("#col2_filter").keyup(function(){fnFilterColumn(1)});$("#col2_regex").click(function(){fnFilterColumn(1)});$("#col2_smart").click(function(){fnFilterColumn(1)})});