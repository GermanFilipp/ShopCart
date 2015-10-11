require 'rails/generators'


module ShopCart
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def copy_initializer_file
      copy_file "shop_cart.rb", "config/initializers/shop_cart.rb"

      route "mount ShopCart::Engine, at: '/cart', as: 'shop_cart'"

    end
  end
end