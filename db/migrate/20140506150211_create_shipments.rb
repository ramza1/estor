class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer  "order_id"
      t.integer  "shipping_method_id",                null: false
      t.integer  "address_id",                        null: false
      t.string   "tracking"
      t.string   "number",                            null: false
      t.string   "state",                             null: false
      t.datetime "shipped_at"
      t.boolean  "active",             default: true, null: false
      t.timestamps
    end
    add_index "shipments", ["address_id"], name: "index_shipments_on_address_id", using: :btree
    add_index "shipments", ["number"], name: "index_shipments_on_number", using: :btree
    add_index "shipments", ["order_id"], name: "index_shipments_on_order_id", using: :btree
    add_index "shipments", ["shipping_method_id"], name: "index_shipments_on_shipping_method_id", using: :btree
  end
end
