class CreateShippingRateTypes < ActiveRecord::Migration
  def change
    create_table :shipping_rate_types do |t|
      t.belongs_to :shop, index: true
      t.string   "name",             null: false
      t.timestamps
    end
  end
end
