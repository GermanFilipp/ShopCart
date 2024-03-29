FactoryGirl.define do
  factory :shop_cart_order do
    customer {FactoryGirl.create(:customer)}

    factory :already_completed do
      state do
        a = ["in queue", "in delivery", "delivered", "canceled"]
        a.sample
      end
      completed_date { Time.zone.now }
    end

  end
end