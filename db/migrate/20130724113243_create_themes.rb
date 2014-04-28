class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.decimal :price
      t.boolean :public
      t.boolean :has_slider
      t.text :description

      t.timestamps
    end
  end
end
