class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.belongs_to :shop, index: true
      t.string   "type",                                                  null: false
      t.string   "code",                                                  null: false
      t.decimal  "amount",        precision: 8, scale: 2, default: 0.0
      t.decimal  "minimum_value", precision: 8, scale: 2
      t.integer  "percent",                               default: 0
      t.text     "description",                                           null: false
      t.boolean  "combine",                               default: false
      t.datetime "starts_at"
      t.datetime "expires_at"
      t.timestamps
    end
    add_index "coupons", ["code"], name: "index_coupons_on_code", using: :btree
    add_index "coupons", ["expires_at"], name: "index_coupons_on_expires_at", using: :btree
  end
end
