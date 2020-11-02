class CartsController < ApplicationController

    def new
    end

    def show
        @cart = current_cart
    end

    def destroy
    end

end
