class AddActiveToThemeImage < ActiveRecord::Migration
  def change
    add_column :theme_images, :active_image, :boolean, default: false
  end
end
