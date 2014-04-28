class Prototype < ActiveRecord::Base

  has_many :products
  has_many :prototype_properties
  has_many :properties,          :through => :prototype_properties
  scope :active, -> {where(active: true)}


  validates :name,    :presence => true, :length => { :maximum => 255 }

  accepts_nested_attributes_for :properties, :prototype_properties

  # paginated results from the admin Prototype grid
  #
  # @param [Optional params]
  # @return [ Array[Prototype] ]
  def self.admin_grid(params = {})

    grid = Prototype
    grid = grid.where("active = ?",true)
    grid

  end

end
