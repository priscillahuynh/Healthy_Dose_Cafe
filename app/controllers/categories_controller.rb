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
        find_category
    end
    
    def edit
        find_category
    end

    def update
        find_category
        @category.update(params.require(:category).permit(:name))
        redirect_to categories_path, flash: { notice: "Category name successfully updated" }
    end

    def destroy
        find_category
        @category.destroy
        redirect_to categories_path , flash: { notice: "Category successfully deleted" }
    end

    private

    def find_category
        @category = Category.find_by_id(params[:id])
    end
end
