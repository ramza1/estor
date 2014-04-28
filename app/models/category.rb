class Category < ActiveRecord::Base
  #attr_accessible :name
  validates :name, :presence => true, uniqueness:{:scope => :shop_id}
  has_many :products
  validates_length_of :name, :maximum => 50


  def to_param
    "#{id}-#{name.parameterize}"
  end
end
