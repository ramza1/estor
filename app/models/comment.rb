class Comment < ActiveRecord::Base
  belongs_to :order
  belongs_to :customer
  #attr_accessible :content, :shop_name, :order_id
  validates :order_id, :content, :presence => true

end
