class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :shop_id
      t.boolean :featured, :default => false

      t.timestamps
    end
  end
end
