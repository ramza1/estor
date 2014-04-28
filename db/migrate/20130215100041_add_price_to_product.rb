class AddPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :price, :decimal,    :precision => 8, :scale => 2, :default => 0.0,   :null => false
    add_column :products, :quantity_available, :integer, :default => 0
    add_column :products, :quantity_pending, :integer, :default => 0
  end
end
