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
      @product_type = ProductType.find_by_id(params[:product_type_id])
      product_types = product_type.subtree_ids
    end
    if product_types
      @products = products.where('product_type_id IN (?)', product_types)
    else
      @products = products
    end
  end

  def search
    min_price = params[:min_price]   if params[:min_price].present?
    max_price = params[:max_price]   if params[:max_price].present?
    variant_name = params[:variant_name]   if params[:variant_name].present?
    brands = params[:brand_ids] if params[:brand_ids].present?

  end

  private

  def form_info
    @cart_item = CartItem.new
  end
end
