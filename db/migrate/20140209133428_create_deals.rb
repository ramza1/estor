class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer  "buy_quantity",    null: false
      t.integer  "get_percentage"
      t.integer  "deal_type_id",    null: false
      t.integer  "product_type_id", null: false
      t.integer  "get_amount"
      t.integer  :shop_id
      t.datetime :deleted_at
      t.timestamps
    end
    add_index "deals", ["buy_quantity"], name: "index_deals_on_buy_quantity", using: :btree
    add_index "deals", ["deal_type_id"], name: "index_deals_on_deal_type_id", using: :btree
    add_index "deals", ["product_type_id"], name: "index_deals_on_product_type_id", using: :btree
    add_index :deals, :shop_id
  end
end
