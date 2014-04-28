class CreateShopThemes < ActiveRecord::Migration
  def change
    create_table :shop_themes do |t|
      t.belongs_to :theme

      t.timestamps
    end
    add_index :shop_themes, :theme_id
  end
end
