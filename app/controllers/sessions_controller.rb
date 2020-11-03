class SessionsController < ApplicationController
    skip_before_action :current_cart

    def welcome
    end

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            set_cart
            redirect_to categories_path
        else
            flash[:error] = "Invalid username or password"
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        session.delete(:cart_id)
        redirect_to '/' 
    end
end