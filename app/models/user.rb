class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
  validates :username, presence: true, uniqueness: true
  #after_create :send_account_notification
  
  def send_account_notification
    unless Rails.env.test? 
        UserMailer.registration_email(self).deliver
    end
  end
  
  def self.generate_password
    ('a'..'z').to_a.shuffle[0,8].join
  end
end
