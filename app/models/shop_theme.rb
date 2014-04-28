class ShopTheme < ActiveRecord::Base
  belongs_to :theme
  belongs_to :shop
  #attr_accessible :enable_slider
  scope :display_layout, where(applied_theme: true)

  def apply_default_theme(shop)
    ShopTheme.transaction do
      shop.shop_themes.update_all( { :applied_theme  => false})
      self.applied_theme = true
      self.save
    end
  end

  def disable_default_theme(shop)
    ShopTheme.transaction do
      shop.shop_themes.update_all( { :applied_theme  => false})
      self.applied_theme = false
      self.save
    end
  end
end
