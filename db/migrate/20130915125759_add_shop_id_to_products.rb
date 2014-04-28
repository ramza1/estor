class AddShopIdToProducts < ActiveRecord::Migration
  def change
    add_index :products, :shop_id
    add_column :addresses, :shop_id, :integer
    add_index :addresses, :shop_id
    add_column :adverts, :shop_id, :integer
    add_index :adverts, :shop_id
    add_column :brands, :shop_id, :integer
    add_index :brands, :shop_id
    add_column :carts, :shop_id, :integer
    add_index :carts, :shop_id
    add_column :cart_items, :shop_id, :integer
    add_index :cart_items, :shop_id
    add_column :categories, :shop_id, :integer
    add_index :categories, :shop_id
    add_column :comments, :shop_id, :integer
    add_index :comments, :shop_id
    add_column :images, :shop_id, :integer
    add_index :images, :shop_id
    add_column :item_types, :shop_id, :integer
    add_index :item_types, :shop_id
    add_column :mailing_lists, :shop_id, :integer
    add_index :mailing_lists, :shop_id
    add_column :news_letters, :shop_id, :integer
    add_index :news_letters, :shop_id
    add_column :orders, :shop_id, :integer
    add_index :orders, :shop_id
    add_column :order_items, :shop_id, :integer
    add_index :order_items, :shop_id
    add_column :posts, :shop_id, :integer
    add_index :posts, :shop_id
    add_column :search_suggestions, :shop_id, :integer
    add_index :search_suggestions, :shop_id
    add_column :slides, :shop_id, :integer
    add_index :slides, :shop_id
    add_column :customers, :shop_id, :integer
    add_index :customers, :shop_id
    add_column :variants, :shop_id, :integer
    add_index :variants, :shop_id
  end
end
