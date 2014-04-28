class Shop < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  # attr_accessible :title, :body
  validates :name, presence: true, uniqueness: true
  validates :name, :format => {:with => /\A[0-9a-z]+\Z/i, :message => "should only contain letters, numbers, or - no spaces or _ allowed as we will do the spacing for you."}, on: :create
  has_attached_file :logo,
                    :styles => {
                        :small => "242x60>"
                    }
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  validates_attachment_size :logo, :less_than => 1.megabyte
  #validates_numericality_of :mobile_number, on: :create
  #validates_presence_of :mobile_number, on: :create

  after_create :become_subscriber#, :send_welcome_mail
=begin
  before_validation :set_trial_ends_date, on: :create
=end
  before_validation :downcase_name
  has_many :shop_themes
  has_many :themes, through: :shop_themes

  #scope :trial_shops, -> {with_state(:trial)}
  #
  #scope :next_renewal_period, -> {where("next_renewal_at < ?", 2.days.ago)}

  #scope :deactivate_shops, -> {where("next_renewal_at < ?", 3.days.ago)}
  #scope :deactivate_pending_shops, -> {where("next_renewal_at < ?", 1.week.ago)}
  #scope :activated_shops, -> {with_state(:active)}
  #scope :pending_shops, -> {with_state(:pending)}
  has_many :withdrawals
  has_many :products
  has_many :categories

  state_machine :initial => 'trial' do
    after_transition :to => 'active', :do => [:update_my_shop_renewal]

    event :activate_shop do
      transition :to => 'active', :from => ['trial', 'pending']
    end

    event :awaiting_subscription do
      transition :to => 'pending', :from => ['trial', 'active']
    end
  end

  def self.current_id=(id)
    Thread.current[:shop_id] = id
  end

  def self.current_id
    Thread.current[:shop_id]
  end


  def become_subscriber
      Subscriber.where(email: self.email).first_or_create!
  end



  #
  #def set_trial_ends_date
  #  self.next_renewal_at = trial_expires_at(Time.now.midnight)
  #end
  #
  #def update_my_shop_renewal
  #  self.next_renewal_at = expires_at(Time.now)
  #  self.save
  #  ShopMailer.activated(self).deliver
  #  #update_attribute(:next_renewal_at, expires_at(Time.now))
  #end
  #
  #def trial_expires_at(time = next_renewal_at)
  #  time ||= Time.now.midnight
  #  (time + 14.days).midnight
  #end
  #
  #def expires_at(time = next_renewal_at)
  #  time ||= Time.now.midnight
  #  (time + 1.year).midnight
  #end

  def downcase_name
    self.name = name.downcase
  end

  def send_welcome_mail
    ShopMailer.welcome(self).deliver
  end

  def debit_account(amount_minus)
    self.subtract_from_account(amount_minus)
  end

  def add_to_account(new_credit)
    update_account_balance(new_credit)
  end

  def subtract_from_account(credit_to_deduct)
    add_to_account(-credit_to_deduct)
  end

  def bank_details_present?
    bank_name.present? and account_name.present? and account_number.present?
  end

  def name_with_balance
    [name, account_balance].compact.join(': ')
  end

  def active_layout
    shop_themes.display_layout.first ? shop_themes.display_layout.first.theme.name : "default"
  end

  def shop_layout
    shop_themes.display_layout.first
  end

  def has_layout
    shop_themes.display_layout.first.present?
  end

  def active_theme
    shop_themes.display_layout.first.theme
  end



  private

  def update_account_balance(new_credit)
    new_score = self.account_balance += new_credit
    self.update_attribute(:account_balance, new_score)
  end

end
