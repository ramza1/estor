class CreateShippingRates < ActiveRecord::Migration
  def change
    create_table :shipping_rates do |t|
      t.belongs_to :shop, index: true
      t.integer  "shipping_method_id",                                           null: false
      t.decimal  "rate",                  precision: 8, scale: 2, default: 0.0,  null: false
      t.integer  "shipping_rate_type_id",                                        null: false
      t.integer  "shipping_category_id",                                         null: false
      t.decimal  "minimum_charge",        precision: 8, scale: 2, default: 0.0,  null: false
      t.integer  "position"
      t.boolean  "active",                                        default: true

      t.timestamps
    end
    add_index "shipping_rates", ["shipping_category_id"], name: "index_shipping_rates_on_shipping_category_id", using: :btree
    add_index "shipping_rates", ["shipping_method_id"], name: "index_shipping_rates_on_shipping_method_id", using: :btree
    add_index "shipping_rates", ["shipping_rate_type_id"], name: "index_shipping_rates_on_shipping_rate_type_id", using: :btree
  end
end
