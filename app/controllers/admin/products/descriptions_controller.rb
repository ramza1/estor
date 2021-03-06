class Admin::Products::DescriptionsController < Admin::BaseController
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(allowed_params)
      redirect_to admin_product_url(@product)
    else
      render :action => :edit
    end
  end
  private

  def allowed_params
    params.require(:product).permit(:name, :description_markup)
  end
end
