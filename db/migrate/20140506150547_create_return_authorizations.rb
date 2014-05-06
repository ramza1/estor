class CreateReturnAuthorizations < ActiveRecord::Migration
  def change
    create_table :return_authorizations do |t|
      t.string   "number"
      t.decimal  "amount",         precision: 8, scale: 2,                null: false
      t.decimal  "restocking_fee", precision: 8, scale: 2, default: 0.0
      t.integer  "order_id",                                              null: false
      t.integer  "customer_id",                                               null: false
      t.string   "state",                                                 null: false
      t.integer  "created_by"
      t.boolean  "active",                                 default: true
      t.timestamps
    end

    add_index "return_authorizations", ["created_by"], name: "index_return_authorizations_on_created_by", using: :btree
    add_index "return_authorizations", ["number"], name: "index_return_authorizations_on_number", using: :btree
    add_index "return_authorizations", ["order_id"], name: "index_return_authorizations_on_order_id", using: :btree
    add_index "return_authorizations", ["customer_id"], name: "index_return_authorizations_on_customer_id", using: :btree
  end
end
