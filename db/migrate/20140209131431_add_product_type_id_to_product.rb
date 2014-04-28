class AddProductTypeIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :prototype_id, :integer
    add_column :products, :meta_keywords, :string
    add_column :products, :meta_description, :string
    add_column :products, :description_markup, :string
  end
end
