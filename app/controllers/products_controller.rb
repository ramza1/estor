class ProductsController < ApplicationController
  def show
    @product = Product.active.find(params[:id])
    form_info
    @cart_item.variant_id = @product.active_variants.first.try(:id)
  end

  def index
    products = Product.active.includes(:variants)

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

  private

  def form_info
    @cart_item = CartItem.new
  end
end
