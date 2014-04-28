class DealType < ActiveRecord::Base
  #default_scope { where(shop_id: Shop.current_id)}
  validates :name,            :presence => true

  has_many :deals
  TYPES = ['Buy X Get % off', 'Buy X Get $ off']
end
