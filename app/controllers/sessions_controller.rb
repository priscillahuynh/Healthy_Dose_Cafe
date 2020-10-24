class SessionsController < ApplicationController
    def welcome
    end

    def new
        
    end

    def create
        session[:username] = params[:username]
    end

    def destroy
        
    end
end