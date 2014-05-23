class Brand < ActiveRecord::Base
  #attr_accessible :name
  validates :name,  :presence => true,       :length => { :maximum => 255 }, :uniqueness => true
  #validates :icon, presence: true
  has_many :products

  has_attached_file :icon
  validates_attachment_presence :icon
  validates_attachment_size     :icon, :less_than => 5.megabytes
  validates_attachment_content_type :icon, :content_type => ['image/jpeg', 'image/png']

end
