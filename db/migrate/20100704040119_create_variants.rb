class CreateVariants < ActiveRecord::Migration
  def self.up
    create_table :variants, force: true do |t|
      t.integer         :product_id,                                                :null => false
      t.string          :sku,                                                       :null => false,   :unique => true
      t.string          :name#,                                                      :null => false
      t.decimal         :price,     :precision => 8, :scale => 2, :default => 0.0,  :null => false
      t.decimal         :cost,      :precision => 8, :scale => 2, :default => 0.0,  :null => false
      t.datetime        :deleted_at
      t.boolean         :master,    :default => false, :null => false
      t.timestamps
      t.integer :shop_id
    end
    add_index :variants, :sku 
    add_index :variants, :product_id
    add_index :variants, :shop_id
    
 end

  def self.down
    drop_table :variants
  end
end
