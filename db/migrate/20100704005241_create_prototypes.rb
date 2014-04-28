class CreatePrototypes < ActiveRecord::Migration
  def self.up
    create_table :prototypes do |t|
      t.string      :name, :null => false
      t.boolean     :active, :null => false, :default => true
      t.integer :shop_id
    end
    add_index :prototypes, :shop_id
  end

  def self.down
    drop_table :prototypes
  end
end
