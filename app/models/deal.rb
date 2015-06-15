class Deal < ActiveRecord::Base

  validates :buy_quantity,            :presence => true
  validates :get_percentage,          :presence => true, :if => :get_amount_is_blank?
  validates :product_type_id,         :presence => true
  validates :get_amount,              :presence => true, :if => :get_percentage_is_blank?

  belongs_to :deal_type
  belongs_to :product_type

  def self.best_qualifing_deal(order)
    product_type_and_amount_hash = order.number_of_a_given_product_type.sort_by{|v| v.last.size }.reverse # sort the hashes by the number of items for that product type
    deal_time = order.completed_at || order.deal_time || Time.zone.now # Deal.best_qualifing_deal(ooo)
    Hash[product_type_and_amount_hash].each_pair do |product_type_id, product_type_prices|
      deal_amount = qualifing_deal(product_type_id, product_type_prices, deal_time)
      return deal_amount.round_at(2) if deal_amount
    end
    0.0
  end
  def self.qualifing_deal(product_type_id, product_type_prices, at)
    deal = self.for_x_number_purchased(product_type_prices.size).
        for_product_type_id(product_type_id).existed_at(at).active_at(at).
        order('deals.get_percentage DESC').first
    deal ? deal.final_deal_amount(product_type_prices) : false
  end

  def self.for_x_number_purchased(num)
    where(['deals.buy_quantity <= ?', num])
  end

  def self.active_at(at)
    where(['deals.deleted_at >= ? OR deals.deleted_at IS NULL', at])
  end

  def self.existed_at(at)
    where(['deals.created_at <= ?', at])
  end

  def self.for_product_type_id(product_type_id)
    where(['deals.product_type_id IN (?)', product_type_id])
  end

  def final_deal_amount(product_type_prices)
    if get_amount && get_amount > 0.0
      get_amount.to_f / 100.0
    else
      ((product_type_prices.sort.reverse[0..(buy_quantity - 1)].min) * get_percentage).to_f / 100.0
    end
  end

  private
  def get_percentage_is_blank?
    get_percentage.blank?
  end
  def get_amount_is_blank?
    get_amount.blank?
  end
end
