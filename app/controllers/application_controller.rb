class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :current_cart
    before_action :current_cart 

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end
    
    def current_cart
        @current_cart = Cart.find(session[:cart_id]) 
    end   
end
