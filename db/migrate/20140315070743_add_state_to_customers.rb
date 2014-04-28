class AddStateToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :customer_cim_id, :string
    add_column :customers, :comments_count, :string, default: 0
  end
end
