class CategoriesController < ApplicationController
    before_action :find_category, only: [:show, :edit, :update, :destroy]

    def new
        @category = Category.new
    end

    def create 
        @category = Category.new(params.require(:category).permit(:name))
        @category.name.titlecase
        if @category.save 
            redirect_to categories_path, flash: { notice: "Category successfully added" }
        else 
            render :new 
        end
    end

    def index
        @categories = Category.all
    end

    def show
    end
    
    def edit
    end

    def update
        @category.update(params.require(:category).permit(:name))
        redirect_to categories_path, flash: { notice: "Category name successfully updated" }
    end

    def destroy
        @category.destroy
        redirect_to categories_path , flash: { notice: "Category successfully deleted" }
    end

    private

    def find_category
        @category = Category.find_by_id(params[:id])
    end
end
