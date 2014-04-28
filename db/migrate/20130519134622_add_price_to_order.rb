class AddPriceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :price, :decimal, default: 0
  end
end
