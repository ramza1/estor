class CreateReturnItems < ActiveRecord::Migration
  def change
    create_table :return_items do |t|
      t.integer  "return_authorization_id",                 null: false
      t.integer  "order_item_id",                           null: false
      t.integer  "return_condition_id"
      t.integer  "return_reason_id"
      t.boolean  "returned",                default: false
      t.integer  "updated_by"
      t.timestamps
    end
    add_index "return_items", ["order_item_id"], name: "index_return_items_on_order_item_id", using: :btree
    add_index "return_items", ["return_authorization_id"], name: "index_return_items_on_return_authorization_id", using: :btree
    add_index "return_items", ["return_condition_id"], name: "index_return_items_on_return_condition_id", using: :btree
    add_index "return_items", ["return_reason_id"], name: "index_return_items_on_return_reason_id", using: :btree
    add_index "return_items", ["updated_by"], name: "index_return_items_on_updated_by", using: :btree
  end
end
