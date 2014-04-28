class AddDiscountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :discount, :decimal, default: 0
    add_column :products, :sale, :boolean, default: false
  end
end
