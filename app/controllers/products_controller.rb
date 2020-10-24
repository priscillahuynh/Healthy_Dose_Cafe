class ProductsController < ApplicationController
    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        raise params.inspect

    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :category_name)
    end

end
