class Myaccount::OrdersController < Myaccount::BaseController
  def index
    @orders = current_customer.finished_orders.find_myaccount_details
  end


  def show
    @order = current_customer.finished_orders.includes([:invoices]).find_by_number(params[:id])
  end

  private

  def selected_myaccount_tab(tab)
    tab == 'orders'
  end
end

