class Admin::ImageGroupsController < Admin::BaseController
  helper_method :products
  def index
    @image_groups = ImageGroup.all
  end

  def show
    @image_group = ImageGroup.find(params[:id])
  end

  def new
    @image_group = ImageGroup.new
  end

  def create
    @image_group = ImageGroup.new(allowed_params)
    if @image_group.save
      redirect_to edit_admin_image_group_url( @image_group ), :notice => "Successfully created image group."
    else
      render :new
    end
  end

  def edit
    @image_group  = ImageGroup.includes(:images).find(params[:id])
  end

  def update
    @image_group = ImageGroup.find(params[:id])
    if @image_group.update_attributes(allowed_params)
      redirect_to [:admin, @image_group], :notice  => "Successfully updated image group."
    else
      render :edit
    end
  end

  private

  def allowed_params
    params.require(:image_group).permit!
  end

  def products
    @products ||= Product.all.map{|p|[p.name, p.id]}
  end

end
