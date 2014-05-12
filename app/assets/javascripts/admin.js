// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require twitter/bootstrap
//= require master/product_types
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require admin/images
//= require admin/posts
//= require products
//= require jquery.slimscroll.min
//= require extents
//= require jquery.dataTables.min
//= require tables.dynamic
//= require sidebar
//= require ckeditor/init
//= require jquery.gritter.min
//= require jquery.pulsate.min
//= require master/theme_images
//= require admin/product_form
//= require ckeditor/config
//= require chosen-jquery



$('.dataTable').dataTable({
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap"
});


$('.trigger-user-settings').pulsate({
    color:"#f89406", // set the color of the pulse
    reach: 20,                              // how far the pulse goes in px
    speed: 1000,                            // how long one pulse takes in ms
    pause: 0,                               // how long the pause between pulses is in ms
    glow:false,                           // if the glow should be shown too
    repeat: true,                           // will repeat forever if true, if given a number will repeat for that many times
    onHover: false                          // if true only pulsate if user hovers over the element
});

$(function(){
    $('.menu').slimScroll({
        height: '600px'
    });
});


// THIS CODE WILL HAVE A LINK OPEN IN A NEW POPUP
$(document).on('click','a[data-popup]', function(e) {
    window.open($(this)[0].href);
    e.preventDefault();
});

//THIS CODE WILL DISABLE ANY AUTOCOMPLETE for CSS class == disableAutoComplete
if (document.getElementsByTagName) {
    var inputElements = document.getElementsByTagName("input");
    for (i=0; inputElements[i]; i++) {
        if (inputElements[i].className && (inputElements[i].className.indexOf("disableAutoComplete") != -1)) {
            inputElements[i].setAttribute("autocomplete","off");
        }//if current input element has the disableAutoComplete class set.
    }//loop thru input elements
}//basic DOM-happiness-check

// This allows forms to have unobtrusive JS nested forms.
$(function() {
    $('form a.add_child').click(function() {
        var assoc   = $(this).attr('data-association');
        var content = $('#' + assoc + '_fields_template').html();
        var regexp  = new RegExp('new_' + assoc, 'g');
        var new_id  = new Date().getTime();

        $(this).parent().before(content.replace(regexp, new_id));
        return false;
    });

    $('form').on('click', 'a.remove_child', function() {
        var hidden_field = $(this).prev('input[type=hidden]')[0];
        if(hidden_field) {
            hidden_field.value = '1';
        }
        $(this).parents('.new_fields').remove();
        $(this).parents('.fields').hide();
        return false;
    });
});







