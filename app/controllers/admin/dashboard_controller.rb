class Admin::DashboardController < Admin::BaseController

  def index
    @products = Product.all
    @orders = Order.visible_orders.order("created_at desc")
  end
end
