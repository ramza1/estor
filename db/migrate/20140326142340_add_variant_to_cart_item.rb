class AddVariantToCartItem < ActiveRecord::Migration
  def change
    add_reference :cart_items, :variant, index: true
  end
end
