require 'rails/generators'


module ShopCart
  module Generators
    class ViewGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates/shop_cart", __FILE__)

      def copy_views
        directory "orders", "app/views/shop_cart/orders"
        directory "order_items", "app/views/shop_cart/order_items"
      end

    end
  end

end