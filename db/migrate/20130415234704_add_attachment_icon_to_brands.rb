class AddAttachmentIconToBrands < ActiveRecord::Migration
  def self.up
    change_table :brands do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :brands, :icon
  end
end
