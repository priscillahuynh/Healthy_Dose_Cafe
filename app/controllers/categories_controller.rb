class CategoriesController < ApplicationController
    def new
        @category = Category.new
    end

    def create 
        @category = Category.new(params.require(:category).permit(:name))
        if @category.save 
            redirect_to categories_path
        else 
            render :new 
        end
    end

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find_by_id(params[:id])
    end
    
    def edit
    end

    def destroy
        @category = Category.find_by_id(params[:id])
        @category.destroy
        redirect_to categories_path , flash: { notice: "Category successfully deleted" }
    end
end
