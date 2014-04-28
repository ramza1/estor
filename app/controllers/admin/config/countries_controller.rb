class Admin::Config::CountriesController < Admin::BaseController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    @states = @country.states
  end

  def new
    @country = Country.new
    form_info
    if @shipping_zones.empty?
      redirect_to new_admin_config_shipping_zone_url, notice: "You must create a shipping zone before you create a country."
    end
  end

  def create
    @country = Country.new(allowed_params)
    if @country.save
      flash[:notice] = "Successfully created Country."
      redirect_to admin_config_country_url(@country)
    else
      form_info
      render :action => 'new'
    end
  end

  def edit
    @country = Country.find(params[:id])
    form_info
  end

  def update
    @country = Country.find(params[:id])
    if @country.update_attributes(allowed_params)
      flash[:notice] = "Successfully updated country."
      redirect_to admin_config_country_url(@country)
    else
      form_info
      render :action => 'edit'
    end
  end

  def destroy
    @country = Country.find(params[:id])
    if @country.active?
      @country.active = false
    else
      @country.active = true
    end
    @country.save
    redirect_to admin_config_countries_url
  end

  private

  def allowed_params
    params.require(:country).permit!
  end

  def form_info
    @shipping_zones = ShippingZone.all.collect{|s| [s.name, s.id]}
  end
end
