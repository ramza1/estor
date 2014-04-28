class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :imageable, :polymorphic => true
      t.integer :image_height
      t.integer :image_width
      t.integer :position
      t.string :caption

      t.timestamps
    end
    add_index :images, :imageable_id
  end
end
