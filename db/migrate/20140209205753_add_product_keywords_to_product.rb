class AddProductKeywordsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_keywords, :text
    add_column :products, :shipping_category_id, :integer
    add_column :product_types, :rgt, :integer
    add_column :product_types, :lft, :integer
    add_index :products, :shipping_category_id
  end
end


