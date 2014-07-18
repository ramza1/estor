class CreatePaymentProfiles < ActiveRecord::Migration
  def change
    create_table :payment_profiles do |t|
      t.integer  "customer_id"
      t.integer  "address_id"
      t.string   "payment_cim_id"
      t.boolean  "default"
      t.boolean  "active"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "last_digits"
      t.string   "month"
      t.string   "year"
      t.string   "cc_type"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "card_name"
      t.timestamps
    end
    add_index "payment_profiles", ["address_id"], name: "index_payment_profiles_on_address_id", using: :btree
    add_index "payment_profiles", ["customer_id"], name: "index_payment_profiles_on_customer_id", using: :btree
  end
end
