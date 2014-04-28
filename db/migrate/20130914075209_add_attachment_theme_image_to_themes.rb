class AddAttachmentThemeImageToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :theme_image
    end
  end

  def self.down
    drop_attached_file :themes, :theme_image
  end
end
