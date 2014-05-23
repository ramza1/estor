class CreateFeaturedProductsProducts < ActiveRecord::Migration
  def change
    create_table :featured_products_products do |t|
      t.belongs_to :product, index: true
      t.belongs_to :featured_product, index: true

      t.timestamps
    end
  end
end
