class AddTaxByStateToShop < ActiveRecord::Migration
  def change
    add_column :shops, :tax_per_state_id, :boolean, default: true
    add_column :shops, :vat, :boolean, default: false
    add_column :shops, :require_state_in_address, :boolean, default: true
  end
end
