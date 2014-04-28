class CreateProductProperties < ActiveRecord::Migration
  def self.up
    create_table :product_properties, force: true do |t|
      t.integer     :product_id, :null => false
      t.integer     :property_id, :null => false
      t.integer     :position
      t.string      :description, :null => false
      t.integer :shop_id
    end

    add_index :product_properties, :shop_id
    add_index :product_properties, :product_id
    add_index :product_properties, :property_id
  end

  def self.down
    drop_table :product_properties
  end
end
