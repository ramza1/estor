class CreateDealTypes < ActiveRecord::Migration
  def change
    create_table :deal_types do |t|
      t.string   "name",       null: false
      t.integer :shop_id
      t.timestamps
    end
    add_index :deal_types, :shop_id
  end
end
