class CreatePurchaseOrderVariants < ActiveRecord::Migration
  def change
    create_table :purchase_order_variants do |t|
      t.integer  "purchase_order_id",                                         null: false
      t.integer  "variant_id",                                                null: false
      t.integer  "quantity",                                                  null: false
      t.decimal  "cost",              precision: 8, scale: 2,                 null: false
      t.boolean  "is_received",                               default: false
      t.timestamps
    end
    add_index "purchase_order_variants", ["purchase_order_id"], name: "index_purchase_order_variants_on_purchase_order_id", using: :btree
    add_index "purchase_order_variants", ["variant_id"], name: "index_purchase_order_variants_on_variant_id", using: :btree
  end
end
