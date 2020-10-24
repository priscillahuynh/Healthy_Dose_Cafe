class SessionsController < ApplicationController
    def welcome
    end

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to categories_path
        else
            flash.now.alert = 'Invalid username or password'
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect to '/'
    end
end