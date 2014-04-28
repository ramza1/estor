class AddBillingAddressIdToOrder < ActiveRecord::Migration
  def change
    add_reference :orders, :bill_address, index: true
  end
end
