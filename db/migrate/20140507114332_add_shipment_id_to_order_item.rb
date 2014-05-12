class AddShipmentIdToOrderItem < ActiveRecord::Migration
  def change
    add_reference :order_items, :shipment, index: true
  end
end
