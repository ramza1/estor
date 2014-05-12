class CustomersController < ApplicationController
  before_filter :authenticate_customer!
  layout 'application'

  def index

  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update_attributes(params[:customer])
       redirect_to myaccount_root_url, :notice => "Profile updated"
    else
      render :edit
    end
  end

  def change_password
    @customer = current_customer
  end

  def change_my_password
    @customer = current_customer
    if @customer.update_with_password(params[:customer])
      sign_in @customer, bypass: true
      redirect_to myaccount_root_url, notice: 'Password Changed'
    else
      render :change_password
    end
  end
end
