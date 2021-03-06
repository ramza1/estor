class StoreCredit < ActiveRecord::Base
  belongs_to :customer
  belongs_to :shop

  validates :customer_id, :presence => true
  validates :amount , :presence => true

  after_find :ensure_sql_math_rounding_issues
  # removes amount from object using SQL math
  #
  # @param [Float] amount to remove
  # @return [none]
  def remove_credit(amount_to_remove)
    sql = "UPDATE store_credits SET amount = (amount - #{amount_to_remove.to_f.round_at(2)}) WHERE id = #{self.id}"
    ActiveRecord::Base.connection.execute(sql)
  end

  def add_credit(amount_to_add)
    sql = "UPDATE store_credits SET amount = (amount + #{amount_to_add}) WHERE id = #{self.id}"
    ActiveRecord::Base.connection.execute(sql)
  end

  private

  def ensure_sql_math_rounding_issues
    self.amount = amount.to_f.round_at(2)
  end
end
