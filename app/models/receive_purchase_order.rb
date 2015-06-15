class ReceivePurchaseOrder < Transaction

  def self.new_direct_payment(purchase_order, total_cost, at = Time.zone.now)
    transaction = ReceivePurchaseOrder.new()
    transaction.new_transaction_ledgers( purchase_order, TransactionAccount::CASH_ID, TransactionAccount::EXPENSE_ID, total_cost, at)
    transaction
  end

  def self.new_expensed(purchase_order, total_cost, at = Time.zone.now)
    transaction = ReceivePurchaseOrder.new()
    transaction.new_transaction_ledgers( purchase_order, TransactionAccount::CASH_ID, TransactionAccount::ACCOUNTS_PAYABLE_ID, total_cost, at)
    transaction
  end

  def self.new_expensed_payment(purchase_order, total_cost, at = Time.zone.now)
    transaction = ReceivePurchaseOrder.new()
    transaction.new_transaction_ledgers( purchase_order, TransactionAccount::ACCOUNTS_PAYABLE_ID, TransactionAccount::EXPENSE_ID, total_cost, at)
    transaction
  end


end
