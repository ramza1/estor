class ShippingCategory < ActiveRecord::Base
  has_many :products
  has_many :shipping_rates

  validates :name,            :presence => true,       :length => { :maximum => 255 }

end

