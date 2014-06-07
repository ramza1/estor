class Admin::PrototypesController < Admin::BaseController
  helper_method
  #respond_to :html, :json
  def index
    @prototypes = Prototype.active
  end

  def new
    @all_properties = Property.active
    if @all_properties.empty?
      flash[:notice] = "You must create a property before you create a prototype."
      redirect_to new_admin_property_path
    else
      @prototype      = Prototype.new(:active => true)
      @prototype.properties.build
    end
  end

  def create
    @prototype = Prototype.new(allowed_params)

    if @prototype.save
      redirect_to admin_prototypes_url
    else
      @all_properties = Property.all
      flash[:error] = "The prototype property could not be saved"
      render :action => :new
    end
  end

  def edit
    @all_properties = Property.all
    @prototype = Prototype.includes(:properties).find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
@prototype.property_ids = params[:prototype][:property_ids]
    if @prototype.update_attributes(allowed_params)
      redirect_to :action => :index
    else
      @all_properties = Property.all
      render :action => :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.active = false
    @prototype.save

    redirect_to :action => :index
  end
  private

  def allowed_params
    params.require(:prototype).permit( :name, :active, :property_ids => [] )
  end


end
