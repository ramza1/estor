class AddImageGroupToVariant < ActiveRecord::Migration
  def change
    add_reference :variants, :image_group, index: true
  end
end
