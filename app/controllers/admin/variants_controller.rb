class Admin::VariantsController < Admin::BaseController
  #before_filter :get_product

  def index
    @product = Product.find(params[:product_id])
    @variants = @product.variants.admin_grid(@product, params).order(created_at: :desc).
        paginate(:page => pagination_page, :per_page => pagination_rows)
  end

  def new
    @variant = @product.variants.new
  end

  def edit
    @variant  = Variant.includes(:properties,:variant_properties, {:product => :properties}).find(params[:id])
    @product  =  @variant.product
  end


  def create
    @variant = @product.variants.new(params[:variant])
    if @variant.save
      redirect_to admin_product_path(@product), :notice => "Variant created"
    else
      render action: 'new'
    end
  end

  def show
    @variant = Variant.includes(:product).find(params[:id])
    @product  =  @variant.product
  end

  def update
    @variant = Variant.includes( :product ).find(params[:id])

    if @variant.update_attributes(allowed_params)
      redirect_to admin_product_variants_url(@variant.product)
    else
      form_info
      @product  =  @variant.product
      render :action => :edit
    end
    end

  def destroy
    @variant = Variant.find(params[:id])
    @variant.deleted_at = Time.zone.now
    @variant.save

    redirect_to admin_product_variants_url(@variant.product)
  end

  protected

  def get_product
    @product = Product.find(params[:product_id])
  end

  private

  def allowed_params
    params.require(:variant).permit(:sku, :name, :price, :cost, :deleted_at, :master, :inventory_id )
  end
end
