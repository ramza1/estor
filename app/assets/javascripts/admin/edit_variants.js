var Hadean = window.Hadean || {};

// If we already have the Appointments namespace don't override
if (typeof Hadean.Admin == "undefined") {
    Hadean.Admin = {};
}
var kk = null;
// If we already have the Appointments object don't override
if (typeof Hadean.Admin.products == "undefined") {

    Hadean.Admin.products = {
        //scheduled_at    : null,
        initialize      : function( ) {
          // If the user clicks add new variant button
          jQuery(document).on('click', '.add_variant_child', function() {
            Hadean.Admin.products.addVariant();// product_table_body
          });
          jQuery(document).on('click', 'form .remove_variant_child', function() {
            Hadean.Admin.products.removeVariant(this);// product_table_body
          });
        },
        addVariant : function(){
          var content =  $('#variants_fields_template').html() ;
          var regexp  = new RegExp('new_variants', 'g');
          var new_id  = new Date().getTime();
          $('#variants_container').append(content.replace(regexp, new_id));
          return false;
        },
        removeVariant : function(obj){
          kk = obj;
          jQuery(obj).closest( '.new_variant_container' ).remove();
        }
    };

    jQuery(function() {
      Hadean.Admin.products.initialize();
    });
};

