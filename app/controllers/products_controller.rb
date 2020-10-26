class ProductsController < ApplicationController
    def new
        @product = Product.new
    end

    def create
        @category = Category.find_or_create_by(name: params[:product][:category_name])
        Product.create({
            name: params[:product][:name],
            price: params[:product][:price],
            category_name: params[:product][:category_name]
        })
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :category_name)
    end

end
