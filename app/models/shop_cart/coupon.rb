module ShopCart
  class Coupon < ActiveRecord::Base
    has_many :orders
  end
end
