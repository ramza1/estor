class CreateProductTypes < ActiveRecord::Migration
  def self.up
    create_table :product_types, force: true do |t|
      
      t.string    :name, :null => false
      t.integer   :parent_id
      t.boolean   :active, :default => true
      t.integer :shop_id
    end
    add_index :product_types, :shop_id
    add_index :product_types, :parent_id
  end

  def self.down
    drop_table :product_types
  end
end
