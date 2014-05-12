class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :check_for_users
  include BootstrapFlashHelper
  protect_from_forgery :except => [:notify, :thank_you, :failure_alert,  :single_notify]


  helper_method :featured_product,
                :all_categories,
                :most_likely_user,
                :random_user,
                :current_customer_id,
                :session_cart,
                :is_production_simulation,
                :product_types

  #before_filter :secure_session

  skip_around_filter :scope_current_shop, if: :no_subdomain
  #layout 'home'

  def featured_product
    Product.featured
  end

  def pagination_page
    params[:page] ||= 1
    params[:page].to_i
  end

  def pagination_rows
    params[:rows] ||= 25
    params[:rows].to_i
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit! }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
  end

  def after_sign_in_path_for(resource)
    if current_user
      stored_location_for(resource) || admin_root_url
    elsif current_customer
      stored_location_for(resource) || root_url
    else
      render :nothing => "Unknown request"
    end
  end

  def set_layout
    unless request.fullpath.match(/admin/)
      prepend_view_path "#{Rails.root}/app/views/#{requested_shop.active_layout}"
      puts requested_shop.active_layout
    end
  end
  def all_categories
    Category.all
  end


  private


  def is_production_simulation
    false
  end

  def secure_session
    if Rails.env == 'production' || is_production_simulation
      if session_cart && !request.ssl?
        cookies[:insecure] = true
      else
        cookies[:insecure] = false
      end
    else
      cookies[:insecure] = false
    end
  end

  def session_cart
    return @session_cart if defined?(@session_cart)
    session_cart!
  end

  # use this method if you want to force a SQL query to get the cart.

  def session_cart!
    if cookies[:cart_id]
      @session_cart = Cart.includes(:shopping_cart_items).find_by_id(cookies[:cart_id])
      unless @session_cart
        @session_cart = Cart.create(:customer_id => current_customer_id)
        cookies[:cart_id] = @session_cart.id
      end
    elsif current_customer && current_customer.current_cart
      @session_cart = current_customer.current_cart
      cookies[:cart_id] = @session_cart.id
    else
      @session_cart = Cart.create
      cookies[:cart_id] = @session_cart.id
    end
    @session_cart
  end


  ## The most likely user can be determined off the session / cookies or for now lets grab a random user
  #   Change this method for showing products that the end user will more than likely like.
  #
  def current_customer_session
    return @current_customer_session if defined?(@current_customer_session)
    @current_customer_session = Customer.find(current_customer.id)
  end

  def most_likely_user
    current_customer ? current_customer.id : random_user
  end

  ## TODO cookie[:hadean_user_id] value needs to be encrypted ### Authlogic persistence_token might work here
  def random_user
    return @random_user if defined?(@random_user)
    @random_user = cookies[:hadean_uid] ? Customer.find_by_authentication_token(cookies[:hadean_uid]) : nil
  end

  def current_customer_id
    return @current_customer_id if defined?(@current_customer_id)
    @current_customer_id = current_customer_session && current_customer_session.id
  end

  def product_types
    @product_types ||= ProductType.roots
  end

  def expire_all_browser_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  private


  def check_for_users
    unless User.exists?
      redirect_to new_user_registration_path and return
    end
    if User.exists?
      redirect_to user_session_path and return
    end
  end

end
