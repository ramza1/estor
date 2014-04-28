class CreateSubscribersEmails < ActiveRecord::Migration
  def change
    create_table :subscribers_emails do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
