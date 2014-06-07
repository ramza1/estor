class Admin::ProductsController < Admin::BaseController
  helper_method :product_types
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @shipping_zones =  ShippingZone.all
  end

  def new
    form_info
    if @prototypes.empty?
      flash[:notice] = "You must create a prototype before you create a product."
      redirect_to new_admin_prototype_url
    else
      @product            = Product.new
      @product.prototype  = Prototype.new
    end
  end

  def edit
    @product  = Product.includes(:properties,:product_properties, {:prototype => :properties}).find(params[:id])
    form_info
  end

  def create
    @product = Product.new(allowed_params)

    if @product.save
      flash[:notice] = "Success, You should create a variant for the product."
      redirect_to edit_admin_products_description_url(@product)
    else
      form_info
      flash[:error] = "The product could not be saved"
      render :action => :new
    end
  end


  def add_properties
    prototype  = Prototype.includes(:properties).find(params[:id])
    @properties = prototype.properties
    all_properties = Property.all

    @properties_hash = all_properties.inject({:active => [], :inactive => []}) do |h, property|
      if  @properties.detect{|p| (p.id == property.id) }
        h[:active] << property.id
      else
        h[:inactive] << property.id
      end
      h
    end
    respond_to do |format|
      format.html
      format.json { render :json => @properties_hash.to_json }
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(allowed_params)
      redirect_to admin_product_path(@product), notice: 'Product was successfully updated.'
    else
      form_info
      render action: "edit"
    end
  end

  def upload_images
    @product = Product.includes(:images).find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.deleted_at ||= Time.zone.now
    @product.save

    redirect_to admin_product_url(@product)
  end

  def product_wizard

  end

  def activate
    @product = Product.find(params[:id])
    @product.deleted_at = nil
    if @product.save
      redirect_to admin_product_url(@product)
    else
      flash[:alert] = @product.errors.full_messages.to_s
      redirect_to edit_admin_products_description_url(@product)
    end
  end

  private

  def allowed_params
    params.require(:product).permit(:name, :description, :product_keywords, :set_keywords, :product_type_id,
                                    :prototype_id, :shipping_category_id, :permalink, :available_at, :deleted_at,
                                    :meta_keywords, :meta_description, :featured, :description_markup, :brand_id,
                                    product_properties_attributes: [:id, :product_id, :property_id, :position, :description])
  end

  def form_info
    @prototypes               = Prototype.active.collect{|pt| [pt.name, pt.id]}
    @all_properties           = Property.active
    #@select_shipping_category = ShippingCategory.all.collect {|sc| [sc.name, sc.id]}
    @brands        = Brand.order(:name).collect {|ts| [ts.name, ts.id]}
  end

  def product_types
    @product_types ||= ProductType.all
  end

end
