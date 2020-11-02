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
        @order = current_user.orders.build(total: @current_cart.sub_total)
        @order.save
        @current_cart.line_items.each do |item|
          @order.cart.line_items << item
          item.cart_id = nil
        end
        @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to '/'
    end

end
