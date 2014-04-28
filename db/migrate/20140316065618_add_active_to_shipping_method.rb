class AddActiveToShippingMethod < ActiveRecord::Migration
  def change
    add_column :shipping_methods, :active, :boolean, default: true
  end
end
