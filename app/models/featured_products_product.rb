class FeaturedProductsProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :featured_product
end
