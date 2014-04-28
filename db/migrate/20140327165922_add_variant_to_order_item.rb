class AddVariantToOrderItem < ActiveRecord::Migration
  def change
    add_reference :order_items, :variant, index: true
    add_reference :order_items, :tax_rate, index: true
    remove_column :order_items, :product_id
  end
end
