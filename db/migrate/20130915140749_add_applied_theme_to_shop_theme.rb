class AddAppliedThemeToShopTheme < ActiveRecord::Migration
  def change
    add_column :shop_themes, :applied_theme, :boolean, default: false
  end
end
