class AddShopIdToShopTheme < ActiveRecord::Migration
  def change
    add_column :shop_themes, :shop_id, :integer
    add_index :shop_themes, :shop_id
  end
end
