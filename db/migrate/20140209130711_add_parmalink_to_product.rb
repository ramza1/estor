class AddParmalinkToProduct < ActiveRecord::Migration
  def change
    add_column :products, :permalink, :string
  end
end
