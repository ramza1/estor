class Admin::ImagesController < Admin::BaseController
  before_filter :setup

  def index
    @images = @parent.images
  end

  def new
    @image = @parent.images.new
  end

  def create
    @image = @parent.images.new(params[:image])
    if @image.save
      respond_to do |format|
        format.html{redirect_to admin_product_path(@parent)}
        format.js
      end
    else
      respond_to do |format|
        format.html{ render :action => 'new'}
        format.js
      end
    end
  end

  def show

  end

  def destroy
    @image = @parent.images.find(params[:id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to admin_product_path(@parent) }
      format.js
    end
  end


  protected

  def parent; @product || nil end

  def setup
    @product = Product.find(params[:product_id]) unless params[:product_id].blank?
    @parent = parent
  end
end
