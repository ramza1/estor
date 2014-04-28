class CreateTaxRates < ActiveRecord::Migration
  def change
    create_table :tax_rates do |t|
      t.belongs_to :shop, index: true
      t.decimal "percentage", precision: 8, scale: 2, default: 0.0,  null: false
      t.integer "state_id"
      t.integer "country_id"
      t.date    "start_date",                                        null: false
      t.date    "end_date"
      t.boolean "active",                             default: true
      t.timestamps
    end
    add_index "tax_rates", ["state_id"], name: "index_tax_rates_on_state_id", using: :btree
  end
end
