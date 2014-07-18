class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer  "invoice_id"
      t.string   "confirmation_id"
      t.integer  "amount"
      t.string   "error"
      t.string   "error_code"
      t.string   "message"
      t.string   "action"
      t.text     "params"
      t.boolean  "success"
      t.boolean  "test"
      t.timestamps
    end
    add_index "payments", ["invoice_id"], name: "index_payments_on_invoice_id", using: :btree
  end
end
