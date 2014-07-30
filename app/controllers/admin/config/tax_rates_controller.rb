class Admin::Config::TaxRatesController < Admin::BaseController
  helper_method :countries

  # GET /admin/config/tax_rates
  def index
    @tax_rates = TaxRate.all
  end

  # GET /admin/config/tax_rates/1
  def show
    @tax_rate = TaxRate.find(params[:id])
  end

  # GET /admin/config/tax_rates/new
  def new
    @tax_rate = TaxRate.new
    form_info
    unless State.any?
      redirect_to admin_config_countries_url, notice: "Yon need to create a country or add a state to a country before creating a tax rate"
    end

  end

  # GET /admin/config/tax_rates/1/edit
  def edit
    @tax_rate = TaxRate.find(params[:id])
    form_info
  end

  # POST /admin/config/tax_rates
  def create
    @tax_rate = TaxRate.new(allowed_params)
    @tax_rate.country = params[:select_country] if params[:select_country].present?

    if @tax_rate.save
      redirect_to(admin_config_tax_rate_url(@tax_rate), :notice => 'Tax rate was successfully created.')
    else
      form_info
      render :action => "new"
    end
  end

  # PUT /admin/config/tax_rates/1
  def update
    @tax_rate = TaxRate.find(params[:id])

    if @tax_rate.update_attributes(allowed_params)
      redirect_to(admin_config_tax_rate_url(@tax_rate), :notice => 'Tax rate was successfully updated.')
    else
      form_info
      render :action => "edit"
    end
  end

  # DELETE /admin/config/tax_rates/1
  def destroy
    @tax_rate = TaxRate.find(params[:id])
    @tax_rate.inactivate!
    redirect_to(admin_config_tax_rates_url)
  end

  private

  def allowed_params
    params.require(:tax_rate).permit!
  end

  def countries
    @countries    ||= Country.form_selector
  end

  def form_info
    @states       = State.all_with_country_id(@tax_rate.state.country_id) if  @tax_rate.state_id
    @states       ||= []
  end
end
