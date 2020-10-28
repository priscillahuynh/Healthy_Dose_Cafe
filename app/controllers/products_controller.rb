class ProductsController < ApplicationController
    def new
        if @category = Category.find_by_id(params[:category_id])
        @product = @category.products.build
        else 
            @product = Product.new
        end
    end

    def create
        @category = Category.find_by(id: params[:product][:category_id])
        @product = @category.products.build(product_params)
        redirect_to category_products_path(@category)
    end

    def show
        @product = Product.find_by_id(params[:id])
    end

    def index
        @products = Product.all
        @category = Category.find_by_id(params[:category_id])
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :category_name)
    end

end
