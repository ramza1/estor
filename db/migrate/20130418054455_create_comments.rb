class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :order
      t.belongs_to :customer
      t.string :shop_name

      t.timestamps
    end
    add_index :comments, :order_id
    add_index :comments, :customer_id
  end
end
