class Admin::ActivationController < Admin::BaseController
  skip_before_filter :authenticate_shop!
  def notify
    @transaction_id = params[:transaction_id]
    response = HTTParty.get("https://voguepay.com/?v_transaction_id=#{@transaction_id}&type=json").body
    transaction = JSON(response)
    single_notify_info(transaction)
  end

  def single_notify_info(transaction)
    if transaction["status"] == "Approved" && transaction["merchant_id"] == "#{MERCHANT_ID}"
      if transaction["total"].to_f >= BILLING_AMOUNT
        requested_shop.activate_shop
        render :text => "Your account has been activated", :layout => false
      else
        render :text => "Invalid transaction amount", :layout => false
      end
    else
      render :text => "Transaction declined", :layout => false
    end
  end

  def thank_you
    redirect_to admin_root_url, notice: "Your account has been activated"
  end

  def failure_alert
    redirect_to admin_root_url, notice: "Failed to activate your account"
  end
end
