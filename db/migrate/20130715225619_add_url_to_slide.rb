class AddUrlToSlide < ActiveRecord::Migration
  def change
    add_column :slides, :link_url, :string
    add_column :slides, :video_url, :string
    change_column :slides, :description, :string, :limit => 500
    add_column :slides, :title, :string
  end
end
