FactoryGirl.define do
  factory :shop_cart_order_item do

    product { FactoryGirl.create(:book) }
    order { FactoryGirl.create(:order) }
    price { Faker::Commerce.price }
    quantity { rand(1..20) }

  end
end