class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string  "name",                       null: false
      t.string  "abbreviation",     limit: 5, null: false
      t.string  "described_as"
      t.integer "country_id",                 null: false
      t.integer "shipping_zone_id",           null: false
      t.belongs_to :shop, index: true
      t.timestamps
    end
    add_index "states", ["abbreviation"], name: "index_states_on_abbreviation", using: :btree
    add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree
    add_index "states", ["name"], name: "index_states_on_name", using: :btree
  end
end
