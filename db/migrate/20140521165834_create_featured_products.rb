class CreateFeaturedProducts < ActiveRecord::Migration
  def change
    create_table :featured_products do |t|

      t.timestamps
    end
  end
end
