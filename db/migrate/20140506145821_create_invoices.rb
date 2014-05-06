class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices, force: true do |t|
      t.integer  "order_id",                                                     null: false
      t.decimal  "amount",          precision: 8, scale: 2,                      null: false
      t.string   "invoice_type",                            default: "Purchase", null: false
      t.string   "state",                                                        null: false
      t.boolean  "active",                                  default: true,       null: false
      t.decimal  "credited_amount", precision: 8, scale: 2, default: 0.0
      t.timestamps
    end
    add_index "invoices", ["order_id"], name: "index_invoices_on_order_id", using: :btree
  end
end
