class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.integer  "supplier_id",                                                null: false
      t.string   "invoice_number"
      t.string   "tracking_number"
      t.string   "notes"
      t.string   "state"
      t.datetime "ordered_at",                                                 null: false
      t.date     "estimated_arrival_on"
      t.decimal  "total_cost",           precision: 8, scale: 2, default: 0.0, null: false

      t.timestamps
    end
    add_index "purchase_orders", ["supplier_id"], name: "index_purchase_orders_on_supplier_id", using: :btree
    add_index "purchase_orders", ["tracking_number"], name: "index_purchase_orders_on_tracking_number", using: :btree
  end
end
