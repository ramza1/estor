class AddAttachmentAdvertImageToAdverts < ActiveRecord::Migration
  def self.up
    change_table :adverts do |t|
      t.attachment :advert_image
    end
  end

  def self.down
    drop_attached_file :adverts, :advert_image
  end
end
