class CreateWithdrawals < ActiveRecord::Migration
  def change
    create_table :withdrawals do |t|
      t.decimal :amount
      t.belongs_to :shop
      t.string :state

      t.timestamps
    end
    add_index :withdrawals, :shop_id
  end
end
