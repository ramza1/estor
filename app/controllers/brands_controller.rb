class BrandsController < ApplicationController
  def show
    @brand = Brand.find(params[:id])
    @products = @brand.products
  end
end
