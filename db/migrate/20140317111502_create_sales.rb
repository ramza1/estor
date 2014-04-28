class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.belongs_to :shop, index: true
      t.integer  "product_id"
      t.decimal  "percent_off", precision: 8, scale: 2, default: 0.0
      t.datetime "starts_at"
      t.datetime "ends_at"
      t.timestamps
    end
    add_index "sales", ["product_id"], name: "index_sales_on_product_id", using: :btree
  end
end
