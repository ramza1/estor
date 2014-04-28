class ChangeColumnTypeForMails < ActiveRecord::Migration
  def change
    change_column :news_letters, :body, :text
    #change_column :subscribers_emails, :body, :text
  end
end
