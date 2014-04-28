class DeviseCreateShops < ActiveRecord::Migration
  def change
    create_table(:shops) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      t.string :name
      t.text :about
      t.string :phone_number
      t.string :mobile_number
      t.string :work_number
      t.string :twitter_username
      t.string :facebook_page_url
      t.string :linkedin
      t.string :rss
      t.string :google_plus
      t.string :skype
      t.string :flickr
      t.decimal :users, :account_balance, :precision => 10, :scale => 0, :default => 0,     :null => false

      t.datetime :next_renewal_at
      t.string :state
      t.string :title
      t.string :meta_description
      t.string :meta_keywords
      t.string :bank_name
      t.string :account_number
      t.string :account_name
      t.text   :privacy
      t.text :users, :terms


      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.attachment :logo

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token


      t.timestamps
    end

    add_index :shops, :email,                :unique => true
    add_index :shops, :reset_password_token, :unique => true


    # add_index :shops, :confirmation_token,   :unique => true
    # add_index :shops, :unlock_token,         :unique => true
    # add_index :shops, :authentication_token, :unique => true
  end

end
