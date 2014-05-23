class Admin::FeaturedProductsController < Admin::BaseController
  def index
    unless FeaturedProduct.any?
      @featured_product = FeaturedProduct.create
    end
    @featured_product = FeaturedProduct.first
  end

  def update
    @featured_product = FeaturedProduct.first
    if @featured_product.update_attributes(featured_params)
       redirect_to admin_featured_products_path, notice: "products added"
    else
       render :index
    end
  end

  private

  def featured_params
    params.require(:featured_product).permit(product_ids: [])
  end
end
