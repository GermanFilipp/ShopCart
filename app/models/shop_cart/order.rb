module ShopCart
  class Order < ActiveRecord::Base
    include AASM


    belongs_to :coupon
    belongs_to :customer,         class_name: ShopCart.customer_class
    belongs_to :shipping_address, class_name: ShopCart.address_class,  autosave: true
    belongs_to :billing_address,  class_name: ShopCart.address_class, autosave: true
    belongs_to :delivery_method,  class_name: ShopCart.delivery_class
    belongs_to :credit_card,      class_name: ShopCart.credit_class
    has_many   :order_items

    STATE_IN_PROGRESS = 'in progress'
    scope :already_completed, -> {where.not(state: STATE_IN_PROGRESS)}

    def self.all_completed_orders
      self.already_completed.order(state: :asc, completed_date: :desc)
    end

    validates   :state, presence: true
    enum state: {
             in_progress: "in progress",
             in_queue: "in queue",
             in_delivery: "in delivery",
             delivered: "delivered",
             canceled:  "canceled",
         }
    aasm column: :state, :enum => true do
      state :in_progress, :initial => true
      state :in_queue
      state :in_delivery
      state :delivered
      state :canceled

      event :checkout, :before => :set_completed_date, :after => :update_sold_count do
        transitions :from => :in_progress, :to => :in_queue
      end

      event :confirm do
        transitions :from => :in_queue, :to => :in_delivery
      end

      event :deliver do
        transitions :from => :in_delivery, :to => :delivered
      end

      event :cancel do
        transitions :from => :in_queue, :to => :canceled
      end
    end

    after_create do
      self.update(number: "R"+rand(100000000..999999999).to_s)
    end

    def total_items
      @total_items = self.order_items.sum(:quantity) if @total_items.nil?
      @total_items
    end

    def add_product(product,quantity)
      order = self
      order_item = order.order_items.find_by(:product => product)
      if order_item.nil?
        order_item = OrderItem.new({:product => product, :order => order, :price => product.price, :quantity => quantity})
      else
        order_item.quantity += quantity
      end
      order_item.save
    end

    def total_price
      items_price = self.order_items.map {|item| item.quantity*item.price}
      price = items_price.inject(&:+) || 0
      unless self.coupon.blank?
        self.total_price =  price - self.coupon.price
      else
        self.total_price =  price
      end

    end

    def set_completed_date
      self.completed_date = Time.zone.now
    end

    def products
      self.order_items.includes(:product).references(:product)
    end

    def update_sold_count
      return false if self.state  == STATE_IN_PROGRESS
      self.order_items.each do |order_item|
        ShopCart.product_class.where(id: order_item.product_id).update_all("sold_count = sold_count + #{order_item.quantity}")
      end
    end



  end
end
