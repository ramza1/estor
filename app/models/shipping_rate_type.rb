class ShippingRateType < ActiveRecord::Base
  belongs_to :shop
  has_many :shipping_rates
  INDIVIDUAL  = 'Individual'
  ORDER       = 'Order'

  TYPES = [INDIVIDUAL, ORDER]


  INDIVIDUAL_ID  = 1
  ORDER_ID       = 2
end
