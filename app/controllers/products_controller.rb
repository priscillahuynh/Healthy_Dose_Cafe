class ProductsController < ApplicationController
    def new
        @product = Product.new
    end

    def create
        @category = Category.find_by(name: params[:product][:category_name])
        @product = Product.create({
            name: params[:product][:name],
            price: params[:product][:price],
            category_name: params[:product][:category_name]
        })
        redirect_to product_path(@product)
    end

    def show
        @product = Product.find_by_id(params[:id])
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :category_name)
    end

end
