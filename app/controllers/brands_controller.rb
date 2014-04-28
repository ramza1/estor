class BrandsController < BaseController
  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products
  end
end
