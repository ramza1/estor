class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal :price, :precision => 8, :scale => 2
      t.decimal :total, :precision => 8, :scale => 2
      t.belongs_to :order,                                       :null => false
      t.belongs_to :product,                                       :null => false
      t.string :state
      t.belongs_to :shipping_rate

      t.timestamps
    end
    add_index :order_items, :order_id
    add_index :order_items, :product_id
    add_index :order_items, :shipping_rate_id
  end
end
