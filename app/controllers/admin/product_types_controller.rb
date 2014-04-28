class Admin::ProductTypesController < Admin::BaseController
  def index
    @product_types = ProductType.all
  end

  def show
    @product_type = ProductType.find(params[:id])
    respond_with(@product_type)
  end

  def new
    @product_type = ProductType.new
    form_info
  end

  def create
    @product_type = ProductType.new(allowed_params)

    if @product_type.save
      redirect_to :action => :index, notice: "Product type added"
    else
      form_info
      flash[:error] = "The product_type could not be saved"
      render :action => :new
    end
  end

  def edit
    @product_type = ProductType.find(params[:id])
    form_info
  end

  def update
    @product_type = ProductType.find(params[:id])

    if @product_type.update_attributes(allowed_params)
      redirect_to :action => :index
    else
      form_info
      render :action => :edit
    end
  end

  def destroy
    @product_type = ProductType.find(params[:id])
    @product_type.active = false
    @product_type.save

    redirect_to :action => :index
  end

  private

  def allowed_params
    params.require(:product_type).permit( :name, :parent_id )
  end

  def form_info
    @product_types = ProductType.all
  end


end
