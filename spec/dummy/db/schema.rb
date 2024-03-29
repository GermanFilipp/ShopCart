# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151011090011) do

  create_table "shop_cart_coupons", force: :cascade do |t|
    t.string   "number"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_cart_order_items", force: :cascade do |t|
    t.decimal  "price"
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_cart_orders", force: :cascade do |t|
    t.decimal  "total_price"
    t.datetime "completed_date"
    t.string   "state"
    t.string   "number"
    t.decimal  "delivery_price"
    t.integer  "customer_id"
    t.integer  "coupon_id"
    t.integer  "order_item_id"
    t.integer  "billing_address_id"
    t.integer  "shipping_address_id"
    t.integer  "delivery_method_id"
    t.integer  "credit_card_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
