class UsersController < ApplicationController
    skip_before_action :current_cart
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            set_cart
            redirect_to categories_path, flash: { notice: 'Welcome! ' }
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :admin)
    end
end
