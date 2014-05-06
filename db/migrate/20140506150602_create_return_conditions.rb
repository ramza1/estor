class CreateReturnConditions < ActiveRecord::Migration
  def change
    create_table :return_conditions do |t|
      t.string "label"
      t.string "description"
      t.timestamps
    end
  end
end
