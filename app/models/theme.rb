class Theme < ActiveRecord::Base
  #attr_accessible :description, :has_slider, :name, :price, :public
  has_many :theme_images
  scope :public, where(public: true)


  def featured_image_big(image_size = :large)
    theme_images.display_image.first ? theme_images.display_image.first.screenshot.url(image_size) : "no_image_#{image_size.to_s}.jpg"
  end

  def featured_image_original(image_size = :original)
    theme_images.display_image.first ? theme_images.display_image.first.screenshot.url(image_size) : "no_image_#{image_size.to_s}.jpg"
  end
end
