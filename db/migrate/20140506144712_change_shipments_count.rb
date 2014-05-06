class ChangeShipmentsCount < ActiveRecord::Migration
  def change
    change_column_default :orders, :shipments_count, 0
  end
end
