class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
