class CreateShippingCategories < ActiveRecord::Migration
  def change
    create_table :shipping_categories do |t|
      t.string "name", null: false
      t.timestamps
    end
  end
end
