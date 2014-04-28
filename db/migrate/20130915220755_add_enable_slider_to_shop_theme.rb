class AddEnableSliderToShopTheme < ActiveRecord::Migration
  def change
    add_column :shop_themes, :enable_slider, :boolean, default: false
  end
end
