class CreateVariantProperties < ActiveRecord::Migration
  def self.up
    create_table :variant_properties do |t|
      t.integer       :variant_id,  :null => false
      t.integer       :property_id, :null => false
      t.string        :description, :null => false
      t.boolean       :primary,     :default => false
      t.integer :shop_id
    end

    add_index :variant_properties, :shop_id
    add_index :variant_properties, :variant_id
    add_index :variant_properties, :property_id
  end

  def self.down
    drop_table :variant_properties
  end
end
