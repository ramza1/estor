class AddShopIdToShippingCategory < ActiveRecord::Migration
  def change
    add_reference :shipping_categories, :shop, index: true
  end
end
