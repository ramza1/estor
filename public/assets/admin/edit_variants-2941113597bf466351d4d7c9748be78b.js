var Hadean=window.Hadean||{};"undefined"==typeof Hadean.Admin&&(Hadean.Admin={});var kk=null;"undefined"==typeof Hadean.Admin.products&&(Hadean.Admin.products={initialize:function(){jQuery(document).on("click",".add_variant_child",function(){Hadean.Admin.products.addVariant()}),jQuery(document).on("click","form .remove_variant_child",function(){Hadean.Admin.products.removeVariant(this)})},addVariant:function(){var n=$("#variants_fields_template").html(),a=new RegExp("new_variants","g"),e=(new Date).getTime();return $("#variants_container").append(n.replace(a,e)),!1},removeVariant:function(n){kk=n,jQuery(n).closest(".new_variant_container").remove()}},jQuery(function(){Hadean.Admin.products.initialize()}));