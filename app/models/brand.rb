class Brand < ActiveRecord::Base
  #attr_accessible :name
  validates :name,  :presence => true,       :length => { :maximum => 255 }, :uniqueness => true
  #validates :icon, presence: true
  has_many :products
end
