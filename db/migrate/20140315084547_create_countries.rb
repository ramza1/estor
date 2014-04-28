class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string  "name"
      t.string  "abbreviation",     limit: 5
      t.integer "shipping_zone_id"
      t.boolean "active",                     default: false
      t.belongs_to :shop, index: true
      t.timestamps
    end
    add_index "countries", ["active"], name: "index_countries_on_active", using: :btree
    add_index "countries", ["name"], name: "index_countries_on_name", using: :btree
    add_index "countries", ["shipping_zone_id", "active"], name: "index_countries_on_shipping_zone_id_and_active", using: :btree
  end
end
