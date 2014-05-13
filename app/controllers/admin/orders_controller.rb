class Admin::OrdersController < Admin::BaseController

  def index
    @orders = Order.find_finished_order_grid(params).paginate(:page => pagination_page, :per_page => pagination_rows)
  end

  def show
    @order = Order.find_by_number(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update_attribute(:shipping_fee, params[:order][:shipping_fee])
      redirect_to admin_order_path(@order), notice: "Delivery fee has been sent to the customer"
      @order.ready_to_pay
      OrderNotifier.order_delivery_fee(@order, requested_shop).deliver
    else
      render action: 'edit'
    end
  end

  def reject
    @order = Order.find(params[:id])
    @order.reject_order
    redirect_to admin_order_path(@order), alert: "Order has been rejected"
    OrderNotifier.order_rejected(@order, requested_shop).deliver
  end

  def mark_as_shipped
    @order = Order.find(params[:id])
    if @order.shipped?
      redirect_to admin_order_path(@order), alert: "Order has been shipped"
    else
      @order.order_shipped!
    end
    redirect_to admin_order_path(@order), notice: "Order has been marked as shipped"
  end

  def reopen
    @order = Order.find(params[:id])
    @order.reopen
    redirect_to admin_order_path(@order), notice: "Order has been reopened"
    OrderNotifier.order_reopened(@order, requested_shop).deliver
  end
end
