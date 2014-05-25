class ProductsController < ApplicationController
  def show
    @product = Product.active.find(params[:id])
    form_info
    @cart_item.variant_id = @product.active_variants.first.try(:id)
    respond_to do |format|
      format.html
      format.js
    end
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
    products = Product.active.includes(:variants)
    variants = Variant.all
    products = products.where(product_type_id: params[:product_type_id]) if params[:product_type_id].present?
    product_ids = variants.where("name LIKE (?)", "%#{params[:variant_name]}%").pluck(:product_id)  if params[:variant_name].present?
    products = products.where(id: product_ids) if params[:variant_name].present?
    product_ids_for_price = variants.where(price: params[:min_price].to_i...params[:max_price].to_i).pluck(:product_id) if params[:max_price].present?
    products = products.where(id: product_ids_for_price) if params[:max_price].present?
    products = products.where(brand_id: params[:brand_ids] ) if params[:brand_ids].present?
    @products = products

  end

  private

  def form_info
    @cart_item = CartItem.new
  end
end
