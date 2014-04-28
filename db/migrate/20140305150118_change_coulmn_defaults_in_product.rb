class ChangeCoulmnDefaultsInProduct < ActiveRecord::Migration
  def change
    change_column :products, :description_markup, :text
    change_column :products, :meta_description, :text
  end
end
