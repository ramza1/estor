class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.string      :identifing_name, :null => false
      t.string      :display_name
      t.boolean     :active,          :default => true
      t.integer :shop_id
    end
    add_index :properties, :shop_id
  end

  def self.down
    drop_table :properties
  end
end
