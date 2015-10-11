require "shop_cart/engine"

module ShopCart
  mattr_accessor :customer_class, :product_class, :main_controller, :address_class, :delivery_class, :credit_class

  def self.customer_class
    @@customer_class.constantize
  end

  def self.product_class
    @@product_class.constantize
  end

  def self.main_controller
    @@main_controller.constantize
  end

  def self.address_class
    @@address_class.constantize
  end

  def self.delivery_class
    @@delivery_class.constantize
  end

  def self.credit_class
    @@credit_class.constantize
  end

  mattr_accessor :parent_controller
  @@parent_controller = 'ApplicationController'
end
