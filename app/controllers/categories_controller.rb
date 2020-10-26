class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end
    def index
        @categories = Category.all
    end

    def show
        @category = Category.find_by_id(params[:id])
    end

end
