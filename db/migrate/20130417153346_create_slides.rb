class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
