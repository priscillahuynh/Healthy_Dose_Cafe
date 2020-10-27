class ProductsController < ApplicationController
    def new
        @category = Category.find_by_id(params[:category_id])
        @product = @category.products.build
    end

    def create
        @category = Category.find_by(name: params[:product][:category_name])
        @product = Product.create({
            name: params[:product][:name],
            price: params[:product][:price],
            category_name: params[:product][:category_name]
        })
        redirect_to category_product_path(@category)
    end

    def show
        @product = Product.find_by_id(params[:id])
    end

    def index
        @products = Product.all
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :category_name)
    end

end
