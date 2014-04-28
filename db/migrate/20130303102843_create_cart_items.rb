class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.belongs_to :customer
      t.belongs_to :item_type
      t.belongs_to :cart
      t.belongs_to :product
      t.integer :quantity, default: 1
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :cart_items, :customer_id
    add_index :cart_items, :item_type_id
    add_index :cart_items, :cart_id
    add_index :cart_items, :product_id
  end
end
