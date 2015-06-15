class Customer < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :first_name,
   #               :last_name, :remember_me, :address, :country, :state, :zip, :phone_number

  validates :first_name, :last_name, :phone_number, :address, :presence => true
  has_many    :finished_orders,           -> { where(state: ['complete', 'paid']) },  class_name: 'Order'
  has_many    :completed_orders,          -> { where(state: 'complete') },            class_name: 'Order'
  # attr_accessible :title, :body


  has_many    :carts,                     :dependent => :destroy

  has_many    :cart_items
  has_many    :shopping_cart_items,       :conditions => {:cart_items => { :active        => true,
                                                                           :item_type_id  => ItemType::SHOPPING_CART_ID}},
              :class_name => 'CartItem'

  has_many    :wish_list_items,           :conditions => {:cart_items => { :active        => true,
                                                                           :item_type_id  => ItemType::WISH_LIST_ID}},
              :class_name => 'CartItem'

  has_many    :saved_cart_items,           :conditions => {:cart_items => { :active        => true,
                                                                            :item_type_id  => ItemType::SAVE_FOR_LATER_ID}},
              :class_name => 'CartItem'

  has_many    :purchased_items,           :conditions => {:cart_items => { :active        => true,
                                                                           :item_type_id  => ItemType::PURCHASED_ID}},
              :class_name => 'CartItem'

  has_many    :deleted_cart_items,        :conditions => {:cart_items => { :active => false}}, :class_name => 'CartItem'

  has_many    :orders
  has_many    :completed_orders,          :class_name => 'Order',
              :conditions => {:orders => { :state => 'complete'}}

  has_many    :phones,          dependent: :destroy,       as: :phoneable
  has_one     :primary_phone, -> { where(primary: true) }, as: :phoneable, class_name: 'Phone'

  has_many    :addresses,       dependent: :destroy,       as: :addressable

  has_one     :default_billing_address,   -> { where(billing_default: true, active: true) },
              as:         :addressable,
              class_name: 'Address'

  has_many    :billing_addresses,         -> { where(active: true) },
              as:         :addressable,
              class_name: 'Address'

  has_one     :default_shipping_address,  -> { where(default: true, active: true) },
              as:         :addressable,
              class_name: 'Address'

  has_many     :shipping_addresses,       -> { where(active: true) },
               as:         :addressable,
               class_name: 'Address'


  validates :email, :presence => true, uniqueness: {scope: :shop_id}

  after_create :become_subscriber, :start_store_credits
  has_one     :store_credit

  def become_subscriber
    MailingList.where(email: self.email).first_or_create!
  end

  # returns your last cart or nil
  #
  # @param [none]
  # @return [ Cart ]
  def current_cart
    carts.last
  end

  def display_name
    [first_name, last_name].join(" ")
  end

  # Returns the default billing address if it exists.   otherwise returns the shipping address
  #
  # @param [none]
  # @return [ Address ]
  def billing_address
    default_billing_address ? default_billing_address : shipping_address
  end

  # Returns the default shipping address if it exists.   otherwise returns the first shipping address
  #
  # @param [none]
  # @return [ Address ]
  def shipping_address
    default_shipping_address ? default_shipping_address : shipping_addresses.first
  end

  def start_store_credits
    self.store_credit = StoreCredit.new(:amount => 0.0, :customer => self)
  end


  def name
    [first_name, last_name].join(" ")
  end
end
