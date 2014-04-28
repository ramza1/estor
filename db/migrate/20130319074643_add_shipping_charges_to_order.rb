class AddShippingChargesToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_fee, :integer, default: 0
  end
end
