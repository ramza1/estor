class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :alternative_phone
      t.string :phone_number
      t.boolean :default,           :default => false
      t.boolean :active,           :default => true
      t.string :country

      t.timestamps
    end
  end
end
