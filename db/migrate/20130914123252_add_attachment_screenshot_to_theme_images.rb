class AddAttachmentScreenshotToThemeImages < ActiveRecord::Migration
  def self.up
    change_table :theme_images do |t|
      t.attachment :screenshot
    end
  end

  def self.down
    drop_attached_file :theme_images, :screenshot
  end
end
