class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.string :ip_address
      t.string :email
      t.string :state
      t.belongs_to :customer
      t.boolean :active, default: true
      t.boolean :shipped, default: false
      t.integer :shipments_count
      t.datetime :calculated_at
      t.datetime :completed_at
      t.decimal :credited_amount
      t.belongs_to :ship_address

      t.timestamps
    end
    add_index :orders, :customer_id
    add_index :orders, :ship_address_id
  end
end
