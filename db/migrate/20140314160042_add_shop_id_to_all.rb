class AddShopIdToAll < ActiveRecord::Migration
  def change
    add_reference :purchase_order_variants, :shop, index: true
    add_reference :transactions, :shop, index: true
    add_reference :batches, :shop, index: true
    add_reference :purchase_orders, :shop, index: true
    add_reference :suppliers, :shop, index: true
    add_reference :transaction_accounts , :shop, index: true
    add_reference :transaction_ledgers , :shop, index: true
    add_reference :accounting_adjustments , :shop, index: true
  end
end
