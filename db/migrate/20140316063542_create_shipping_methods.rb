class CreateShippingMethods < ActiveRecord::Migration
  def change
    create_table :shipping_methods do |t|
      t.belongs_to :shop, index: true
      t.string   "name",             null: false
      t.integer  "shipping_zone_id", null: false
      t.timestamps
    end
    add_index "shipping_methods", ["shipping_zone_id"], name: "index_shipping_methods_on_shipping_zone_id", using: :btree
  end
end
