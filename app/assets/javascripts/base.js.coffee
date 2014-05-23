# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#featured_product_product_ids').select2
    placeholder: 'Select Products'
    width: '400px'
    allowClear: true