class CreateAccountingAdjustments < ActiveRecord::Migration
  def change
    create_table :accounting_adjustments do |t|
      t.integer  "adjustable_id",                           null: false
      t.string   "adjustable_type",                         null: false
      t.string   "notes"
      t.decimal  "amount",          precision: 8, scale: 2, null: false
      t.timestamps
    end
    add_index "accounting_adjustments", ["adjustable_id"], name: "index_accounting_adjustments_on_adjustable_id", using: :btree
  end
end
