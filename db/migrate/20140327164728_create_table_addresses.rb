class CreateTableAddresses < ActiveRecord::Migration
  def change
    create_table :addresses, force: true do |t|
      t.integer  "address_type_id"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "addressable_type",                  null: false
      t.integer  "addressable_id",                    null: false
      t.string   "address1",                          null: false
      t.string   "address2"
      t.string   "city",                              null: false
      t.integer  "state_id"
      t.string   "state_name"
      t.string   "zip_code",                          null: false
      t.integer  "phone_id"
      t.string   "alternative_phone"
      t.boolean  "default",           default: false
      t.boolean  "billing_default",   default: false
      t.boolean  "active",            default: true
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "country_id"
      t.belongs_to :shop, index: true
    end
    add_index "addresses", ["addressable_id"], name: "index_addresses_on_addressable_id", using: :btree
    add_index "addresses", ["addressable_type"], name: "index_addresses_on_addressable_type", using: :btree
    add_index "addresses", ["state_id"], name: "index_addresses_on_state_id", using: :btree
  end
end
