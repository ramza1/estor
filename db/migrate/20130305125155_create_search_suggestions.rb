class CreateSearchSuggestions < ActiveRecord::Migration
  def change
    create_table :search_suggestions do |t|
      t.integer :popularity
      t.string :term

      t.timestamps
    end
  end
end
