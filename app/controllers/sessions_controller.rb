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

    def omniauth
        @user = User.find_or_create_by(username: auth[:info][:email]) do |u| 
            u.password = SecureRandom.hex
        end
        session[:user_id] = @user.id
        set_cart
        redirect_to categories_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end