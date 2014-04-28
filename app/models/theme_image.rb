class ThemeImage < ActiveRecord::Base
  belongs_to :theme
   #attr_accessible :screenshot
  has_attached_file :screenshot,
                    :styles => {
                        :large => "300x500>"
                    }
  validates_attachment_content_type :screenshot, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :screenshot, :less_than => 1.megabyte
  scope :display_image, where(active_image: true)

  def save_default_image(theme)
    ThemeImage.transaction do
        theme.theme_images.update_all( { :active_image  => false})
        self.active_image = true
      self.save
    end
  end
end

