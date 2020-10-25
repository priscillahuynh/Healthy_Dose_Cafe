class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!@current_user
    end

    def login_required
        if !logged_in?
            redirect_to login_path, :notice => "You must be logged in to checkout cart"
        end
    end
end
