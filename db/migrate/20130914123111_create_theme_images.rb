class CreateThemeImages < ActiveRecord::Migration
  def change
    create_table :theme_images do |t|
      t.belongs_to :theme

      t.timestamps
    end
    add_index :theme_images, :theme_id
  end
end
