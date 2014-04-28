class RemoveCountAtHandFormVariant < ActiveRecord::Migration
  def self.up
    remove_column :variants, :count_on_hand
    remove_column :variants, :count_pending_from_supplier
    remove_column :variants, :count_pending_to_customer
  end

  def self.down
    add_column :variants, :count_on_hand, :integer
    add_column :variants, :count_pending_from_supplier, :integer
    add_column :variants, :count_pending_to_customer, :integer
  end

end
