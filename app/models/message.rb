class Message < ActiveRecord::Base
  #attr_accessible :email, :message, :name
  validates :email, :message, :name, presence: true

  after_create :send_notice_mail, :send_to_admin

  def send_notice_mail
    MessageMailer.notify_sender(self).deliver
  end

  def send_to_admin
    MessageMailer.notify_receiver(self).deliver
  end
end
