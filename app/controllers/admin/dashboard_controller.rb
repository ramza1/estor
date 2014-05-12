class Admin::DashboardController < Admin::BaseController

  def index
    @products = Product.all
    @orders = Order.find_finished_order_grid(params).paginate(:page => pagination_page, :per_page => pagination_rows)
  end
end
