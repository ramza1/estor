class Inventory < ActiveRecord::Base
  has_one :variant
  has_many :accounting_adjustments, as: :adjustable

  validate :must_have_stock


  private

  def must_have_stock
    if (count_on_hand - count_pending_to_customer) < 0
      errors.add :count_on_hand, 'There is not enough stock to sell this item'
    end
  end
end
