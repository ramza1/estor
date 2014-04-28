class Slide < ActiveRecord::Base
  #attr_accessible :description, :url, :link_url, :video_url, :slide_image, :title

  has_attached_file :slide_image, {  :styles => {:mini => '48x48>',
                                                 :large => '600x600>' },
                                     :default_style => :slide}

  validates :video_url, presence: true, unless: :image_present?
  validates_attachment_size     :slide_image, :less_than => 5.megabytes
  validates_attachment_content_type :slide_image, :content_type => ['image/jpeg', 'image/png']

  validates_length_of :description, :maximum => 500, message: "Cannot be more than 500 characters"


  def image_present?
    slide_image.present?
  end
end
