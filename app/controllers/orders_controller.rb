class OrdersController < ApplicationController
    def new    
    end

    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
    end

    def create
        @order = current_user.orders.build(total: current_cart.sub_total)
        cart = Cart.new(order_id: @order.id, user_id: current_user.id)
        cart.save 
        @order.cart = cart
        current_cart.line_items.each do |item|
          @order.cart.line_items << item
          item.cart_id = nil 
        end
        @order.save
        cart = Cart.new(user_id: current_user.id)
        cart.save
        session[:cart_id] = cart.id
        redirect_to '/menu' , flash: { alert: "Order completed. Come again soon!" }
    end

end
