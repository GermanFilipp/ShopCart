class CreateShopCartCoupons < ActiveRecord::Migration
  def change
    create_table :shop_cart_coupons do |t|
      t.string :number
      t.decimal :price

      t.timestamps null: false
    end
  end
end
