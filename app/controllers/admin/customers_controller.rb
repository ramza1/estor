class Admin::CustomersController < Admin::BaseController
  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
    @states    = ['inactive', 'active', 'canceled']
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    successfully_updated = if needs_password?(@customer, params)
                             @customer.update_with_password(customer_params)
                           else
                             # remove the virtual current_password attribute
                             # update_without_password doesn't know how to ignore it
                             params[:customer].delete(:current_password)
                             @customer.update_without_password(customer_params)
                           end

    if successfully_updated
      # Sign in the user bypassing validation in case his password changed
      #sign_in @user, :bypass => true
      redirect_to admin_customers_url, notice: "#{@customer.display_name} has been updated."
    else
      @states    = ['inactive', 'active', 'canceled']
      render "edit"
    end
  end



  def destroy
    @customer = Customer.find(params[:id])
    @customer.update_attribute(:state, "inactive")
    redirect_to admin_customers_url
  end


  private

  def customer_params
    params.require(:customer).permit(:password, :password_confirmation, :first_name, :last_name, :email, :state, :current_password)
  end

  def needs_password?(user, params)
     params[:customer][:password].present?
  end
end
