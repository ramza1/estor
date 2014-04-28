class CreatePrototypeProperties < ActiveRecord::Migration
  def self.up
    create_table :prototype_properties do |t|
      t.integer 'prototype_id', :null => false
      t.integer 'property_id', :null => false
      t.integer :shop_id
    end
    
    
    add_index :prototype_properties, :prototype_id
    add_index :prototype_properties, :property_id
    add_index :prototype_properties, :shop_id
  end

  def self.down
    drop_table :prototype_properties
  end
end
