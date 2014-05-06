class AddNoteToComment < ActiveRecord::Migration
  def change
    add_column :comments, :note, :text
  end
end
