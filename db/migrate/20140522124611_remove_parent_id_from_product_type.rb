class RemoveParentIdFromProductType < ActiveRecord::Migration
  def change
    remove_column :product_types, :parent_id
  end
end
