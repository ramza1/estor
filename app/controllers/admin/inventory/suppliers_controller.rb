class Admin::Inventory::SuppliersController < Admin::BaseController

  respond_to :json, :html

  def index
    @suppliers = Supplier.order(created_at: :desc).
                                              paginate(:page => pagination_page, :per_page => pagination_rows)
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(allowed_params)

    if @supplier.save
      redirect_to :action => :index
    else
      flash[:error] = "The supplier could not be saved"
      render :action => :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(allowed_params)
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end

  def show
    @supplier = Supplier.find(params[:id])
    respond_with(@supplier)
  end

private

  def allowed_params
    params.require(:supplier).permit(:name, :email)
  end


end
