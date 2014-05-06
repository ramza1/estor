class CreateReturnReasons < ActiveRecord::Migration
  def change
    create_table :return_reasons do |t|
      t.string "label"
      t.string "description"
      t.timestamps
    end
  end
end
