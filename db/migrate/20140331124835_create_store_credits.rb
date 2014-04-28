class CreateStoreCredits < ActiveRecord::Migration
  def change
    create_table :store_credits do |t|
      t.belongs_to :customer, index: true
      t.belongs_to :shop, index: true
      t.decimal :amount,            precision: 8, scale: 2

      t.timestamps
    end
  end
end
