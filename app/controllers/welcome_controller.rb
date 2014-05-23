class WelcomeController < ApplicationController
  layout 'home'
  def index

      products = Product.active.recent.includes(:variants).limit(12)
      unless FeaturedProduct.any?
        FeaturedProduct.create
      end
      @featured_product_layout = FeaturedProduct.first
      @brands = Brand.all
      @featured_products = @featured_product_layout.products
      product_types = nil
      if params[:product_type_id].present? && product_type = ProductType.find_by_id(params[:product_type_id])
        product_types = product_type.self_and_descendants.map(&:id)
      end
      if product_types
        @products = products.where('product_type_id IN (?)', product_types)
      else
        @products = products
      end
  end



end
