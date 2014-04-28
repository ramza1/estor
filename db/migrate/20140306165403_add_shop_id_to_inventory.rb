class AddShopIdToInventory < ActiveRecord::Migration
  def change
    add_reference :inventories, :shop, index: true
  end
end
