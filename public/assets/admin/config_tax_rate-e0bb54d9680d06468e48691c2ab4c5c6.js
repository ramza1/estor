var Hadean=window.Hadean||{};Hadean.Utility={registerOnLoadHandler:function(e){jQuery(window).ready(e)}},Hadean.TaxRateForm={stateSelect:"#tax_rate_state_id",initialize:function(){var e="#select_country";jQuery(e).bind("change",function(){Hadean.TaxRateForm.getState(jQuery(e).val())})},getState:function(e){isNaN(e-0)||""==e||jQuery.getJSON("/states",{country_id:e},function(e){Hadean.TaxRateForm.refreshStates(e)})},refreshStates:function(e){{var t=e,a=jQuery(Hadean.TaxRateForm.stateSelect);a.attr("options")}jQuery("option",a).remove(),i=1,jQuery.each(t,function(e,t){a[0].options[i]=new Option(t[0],t[1]),i+=1})}};