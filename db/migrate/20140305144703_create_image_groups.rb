class CreateImageGroups < ActiveRecord::Migration
  def change
    create_table :image_groups do |t|
      t.belongs_to :shop, index: true
      t.belongs_to :product, index: true
      t.string :name

      t.timestamps
    end
  end
end
