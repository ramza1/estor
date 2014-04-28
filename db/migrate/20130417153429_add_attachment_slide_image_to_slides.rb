class AddAttachmentSlideImageToSlides < ActiveRecord::Migration
  def self.up
    change_table :slides do |t|
      t.attachment :slide_image
    end
  end

  def self.down
    drop_attached_file :slides, :slide_image
  end
end
