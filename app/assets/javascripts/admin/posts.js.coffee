# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#post_published_at, #coupon_starts_at, #coupon_expires_at, #tax_rate_start_date, #tax_rate_end_date, #purchase_order_ordered_at, #purchase_order_estimated_arrival_on').datepicker
    dateFormat: 'yy-mm-dd'