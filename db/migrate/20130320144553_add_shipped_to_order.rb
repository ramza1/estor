class AddShippedToOrder < ActiveRecord::Migration
  def change
    change_column_default :orders, :shipped, false
  end
end
